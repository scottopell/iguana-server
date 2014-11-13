models				 = require '../models'
winston				 = require 'winston'
async					 = require 'async'
validateLoggedIn = require('./api').validateLoggedIn

sequelize = require('../data/db').seq
Playlist					 = models.Playlist


###############################
#       Playlists             #
###############################

exports.create = (req, res) ->
	async.waterfall [
		(callback) ->
			validateLoggedIn(req, res)
			callback null
		# make sure that email isn't already taken
		validatePlaylistName = (callback) ->
			Playlist.find(where:
				name: req.body.name
			).done (error, playlist) ->
				if playlist
					return res.json(error:
						name: "Playlist name is already being used"
					)
				callback null
				return
		createPlaylist = (callback) ->
			Playlist.create(
				name: req.body.name
				owner: req.user.id
			).success((playlist) ->
				res.json redirect: "/playlist"
				return
			)
	]
	return
