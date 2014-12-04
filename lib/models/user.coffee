Sequelize = require('sequelize-mysql').sequelize
sequelize = require('../data/db').seq
mysql			= require('sequelize-mysql').mysql
bcrypt		= require 'bcrypt'



module.exports.user = sequelize.define "User",{
	password_digest:
		type: Sequelize.STRING
		allowNull: false

	username:
		type: Sequelize.STRING
		allowNull: false

	email_address:
		type: Sequelize.STRING

	},{
	classMethods:
		hashPassword: (plaintext_password, callback) ->
			bcrypt.genSalt 10, (err, salt) ->
				return new Error("bcrypt salting error")  if err
				bcrypt.hash plaintext_password, salt, (error, password) ->
					return new Error("bcrypt hashing error")  if error
					callback null, password
					return
				return
			return
	}
