Sequelize = require('sequelize-mysql').sequelize
sequelize = require('../data/db').seq
mysql			= require('sequelize-mysql').mysql



module.exports.playlist = sequelize.define "Playlist",{
	name:
		type: Sequelize.STRING
		allowNull: false

	owner:
		type: Sequelize.STRING
		allowNull: false

	}
