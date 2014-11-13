models				 = require '../models'
winston				 = require 'winston'
async					 = require 'async'

sequelize = require('../data/db').seq
Playlist					 = models.Playlist


###############################
#       Playlists             #
###############################

exports.create = (req, res) ->
	if not req.user
		res.redirect '/login'
	else
			Playlist.create(
				name: req.body.name
				owner: req.user.id
			).success((playlist) ->
				res.json redirect: "/playlist"
				return
			)
