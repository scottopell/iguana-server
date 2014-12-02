models				 = require '../models'
winston				 = require 'winston'
async					 = require 'async'
validateLoggedIn = require('./api').validateLoggedIn

sequelize = require('../data/db').seq
Playlist					 = models.Playlist
Track					 = models.Track


###############################
#       Playlists             #
###############################

exports.create = (req, res) ->
	async.waterfall [
		(callback) ->
			if !validateLoggedIn(req, res)
				return
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
			console.log(req.user)
			Playlist.create(
				name: req.param 'name'
				owner: req.user.id
			).success((playlist) ->
				res.json redirect: "/playlist"
				return
			)
	]
	return

exports.all = (req, res) ->
	Playlist.all_with_length().success (playlists) ->
		res.json is_success: true, data: playlists

exports.allTracks = (req, res) ->
	Playlist.find( where:
		id: req.param 'playlist_id'
	).success (playlist) ->
		if playlist
			playlist.getTracks().success (tracks) ->
				res.json is_success: true, data: tracks
		else
			res.status(404).send "Error"

exports.addTrack = (req, res) ->
	async.waterfall [
		(callback) ->
			if !validateLoggedIn(req, res)
				return
			callback null
		verifyOwner = (callback) ->
			Playlist.find(where:
				id: req.param 'playlist_id'
			).done (error, playlist) ->
				console.log(playlist.dataValues.id)
				console.log(req.user.dataValues.id)
				if playlist.dataValues.id is not req.user.dataValues.id
					return res.json(error:
						name: "You're not allowed to edit this playlist"
					)
				callback null
				return
		(callback) ->
			Playlist.find(where:
				id: req.param 'playlist_id'
			).done (error, playlist) ->
				Track.find( where: id: req.body.track_id).success (track) ->
					console.log( req.body)
					console.log( req.body.track_id)
					playlist.addTrack track
					res.redirect '/'

	]

exports.removeTrack = (req, res) ->
	async.waterfall [
		(callback) ->
			if !validateLoggedIn(req, res)
				return
			callback null
		verifyOwner = (callback) ->
			Playlist.find(where:
				id: req.param 'playlist_id'
			).done (error, playlist) ->
				if playlist.dataValues.id is not req.user.dataValues.id
					return res.json(error:
						name: "You're not allowed to edit this playlist"
					)
				callback null
				return
		(callback) ->
			Playlist.find(where:
				id: req.param 'playlist_id'
			).done (error, playlist) ->
				Track.find( where: id: req.body.track_id).success (track) ->
					playlist.removeTrack track
					res.redirect '/'

	]

exports.delete = (req, res) ->
	async.waterfall [
		(callback) ->
			if !validateLoggedIn(req, res)
				return
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
		(callback) ->
			Playlist.find(where:
				id: req.param 'playlist_id'
			).done (error, playlist) ->
				if (error)
					console.log("Couldn't find playlist by id when deleting")
				else
					playlist.destroy().success ->
						res.send 200

	]
	return

