Sequelize = require('sequelize-mysql').sequelize
sequelize = require('../data/db').seq
mysql			= require('sequelize-mysql').mysql
models = require './index'

Playlist = sequelize.define "Playlist",{
	name:
		type: Sequelize.STRING
		allowNull: false

	owner:
		type: Sequelize.STRING
		allowNull: false

	}, {
		classMethods:
			all_with_length: ->
				sequelize.query('SELECT p.*, count(t.PlaylistID) AS count FROM Playlists p LEFT JOIN Tracks t on p.id = t.PlaylistID group by p.name, p.owner, p.id, p.createdAt, p.updatedAt;').success (rows)->
					return rows
	}

module.exports.playlist = Playlist