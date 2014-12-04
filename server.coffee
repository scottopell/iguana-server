# defaults to production
environment = process.env.NODE_ENV

ui = "iguana"
# ui = "switz"

#if environment is "production"
#  require('strong-agent').profile()
#  require 'newrelic'
#  require('graphdat').config { socketFile: '/host_tmp/gd.agent.sock', debug: true }

# Module dependencies.
express          = require "express"
morgan           = require "morgan"
bodyParser       = require "body-parser"
favicon          = require "serve-favicon"
methodOverride   = require "method-override"
errorhandler     = require "errorhandler"
expressValidator = require 'express-validator'
session          = require 'express-session'
cookieParser     = require 'cookie-parser'
flash            = require 'connect-flash'
path             = require "path"
app              = express()

# passport

passport   = require 'passport'
{Strategy} = require 'passport-local'


# db
models      = require './lib/models'
config      = require './lib/config'

models.sync(force: false)
      .error((err) ->
        console.log err
        throw err
      )
      .success () ->
        console.log 'synced'

# Controllers
api         = require "./lib/controllers/api"
user        = require "./lib/controllers/user"
playlist    = require "./lib/controllers/playlist"
importer    = require "./lib/controllers/importer"

app.locals = site: config.get 'site'
app.set 'view engine', 'jade'
app.set 'trust proxy', true

#   Morgan config
if environment is 'development'
  logger = morgan("dev")
else
  logger = morgan("combined")
app.use logger

if environment is 'development'
  if ui is not "switz"
    app.use express.static(path.join(__dirname, "public"), maxAge: 3600 * 1000)
  else
    app.use express.static(path.join(__dirname, ".tmp"))
    app.use express.static(path.join(__dirname, "app"))

  app.use express.static(path.join(__dirname, "public"), maxAge: 3600 * 1000)
  app.use errorhandler()

# Express Middleware config
# Allow access control origin
app.use (req, res, next) ->
  res.set 'Access-Control-Allow-Origin': '*'
  res.set 'Access-Control-Allow-Methods': 'GET'

  next()

app.use (req, res, next) ->
  res.renderView = (viewName, viewModel) ->
    suffix = "" # if req.xhr then "" else "_full"
    res.render viewName + suffix, viewModel

  next()


app.use bodyParser.urlencoded({extended: false})
app.use expressValidator()

app.use cookieParser()

app.use methodOverride 'X-HTTP-Method-Override'

app.use session( {secret: 'phish 4 lyfe'},
									saveUninitialized: false,
									resave: false)

app.use favicon(__dirname + '/public/favicon.ico')

app.use passport.initialize()
app.use passport.session()

app.use flash()

# Routes
#app.get "/importer/:artist/rebuild_index", importer.rebuild_index
#app.get "/importer/:artist/:archive_id/rebuild_index", importer.rebuild_show
#app.get "/importer/:artist/rebuild_setlists", importer.rebuild_setlists
#app.get "/importer/rebuild-all", importer.rebuild_all
#app.get "/importer/reslug", importer.reslug
#app.get "/importer/rebuild-weighted-avg", importer.reweigh
#app.get "/importer/search_data", api.search_data

app.get '/views/:name.html', (req, res) -> res.renderView req.param('name')

app.get '/api/status', api.status

app.get '/api/artists', api.artists
app.get '/api/artists/:artist_slug', api.single_artist
app.get '/api/artists/:artist_slug/years', api.artist_years
app.get '/api/artists/:artist_slug/years/:year', api.artist_year_shows
app.get '/api/artists/:artist_slug/years/:year/shows/:show_date', api.artist_show_by_date
app.get '/api/artists/:artist_slug/top_shows', api.top_shows
app.get '/api/artists/:artist_slug/random_show', api.random_show
app.get '/api/artists/:artist_slug/random_date', api.random_date
app.get '/api/artists/:artist_slug/shows', api.artist_shows
app.get '/api/artists/:artist_slug/shows/:show_id', api.single_show
app.get '/api/artists/:artist_slug/mp3/:track_id', api.artist_mp3
app.get '/api/artists/:artist_slug/venues', api.artist_venues
app.get '/api/artists/:artist_slug/venues/:venue_id', api.single_venue
app.get '/api/artists/:artist_slug/search', api.search

comb_auth = (req, res, next) ->
	console.log("checking auth...")
	if req.isAuthenticated()
		console.log("already authed")
		return next()
	passport.authenticate('local', (err, user, info) ->
		if (err || !user)
			passport.authenticate('basic', {session: false }, (err, user, info) ->
				if (err || !user)
					return res.json 403, is_success: false, data: null
				else
					console.log("Basic auth succeeded")
					return next()
			)(req, res, next)
		else
			console.log("session auth succeeded")
			return next()
	)(req, res, next)
	return

app.get '/login', (req, res) ->
	res.sendFile __dirname + '/public/test.html'

app.get "/logout", (req, res) ->
	req.logout()
	res.redirect "/"
	return

app.get '/amiloggedin', comb_auth, (req, res) ->
	res.json 200, is_success: true, data: null

app.post '/api/playlists/create', comb_auth, playlist.create
app.get  '/api/playlists/all', playlist.all
app.get  '/api/playlists/:playlist_id/all', playlist.allTracks
app.post '/api/playlists/:playlist_id/addTrack', comb_auth, playlist.addTrack
app.post '/api/playlists/:playlist_id/removeTrack', comb_auth,  playlist.removeTrack
app.post '/api/playlists/:playlist_id/delete', comb_auth, playlist.delete

app.post '/api/users/create', user.signup
app.post "/login", passport.authenticate("local"), (req, res, next) ->
	res.redirect '/'
	return


app.get '/api/artists/:artist_slug/setlists', api.setlist.setlist
app.get '/api/artists/:artist_slug/setlists/:setlist_id', api.setlist.show_id
app.get '/api/artists/:artist_slug/setlists/on-date/:show_date', api.setlist.on_date
app.get '/api/artists/:artist_slug/song_stats', api.setlist.song_stats

app.get '/configure.js', (req, res) ->
  res.set 'Cache-Control', 'no-cache'
  res.set 'Content-Type', 'text/javascript'

  app_config = {}
  for single_config in config.get('site')
    if single_config.domain_names.filter((v) -> req.hostname.indexOf(v) isnt -1).length > 0
      app_config = single_config
  console.log(app_config)

  json = "window.app_config = " + JSON.stringify(app_config) + ";"
  res.send json + config.googleAnalyticsCode(app_config.google_analytics.id, app_config.google_analytics.domain)

app.get '/', (req, res) -> res.render 'index'
app.get '*', (req, res) ->
  if environment is "production" and ui is "switz"
    res.sendFile __dirname + '/public/index.html'
  else
    res.render 'index'



# Start server
console.log "Attempting to listen on port %d", (process.env.PORT or 9000)
port = process.env.PORT or 9000
app.listen port, ->
  console.log "Express server listening on port %d in %s mode", port, app.get("env")
