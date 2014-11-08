models				 = require '../models'
winston				 = require 'winston'
async					 = require 'async'

bcrypt				 = require 'bcrypt'
passport			 = require 'passport'
passport_local = require('passport-local').Strategy

sequelize = require('../data/db').seq
User					 = models.User

exports.signup = (req, res) ->
	passsword = null
	async.waterfall [
    # make sure that email isn't already taken
		validateEmail = (callback) ->
			User.find(where:
				email_address: req.body.email_address
			).done (error, user) ->
				if user
					return res.json(error:
						email_address: "Email is already being used"
					)
				callback null
				return
		# make sure username has not already been taken
		validateUsername = (callback) ->
			User.find(where:
				username: req.body.username
			).done (error, user) ->
				if user
					return res.json(error:
						username: "Username is already being used"
					)
				callback null
				return
		# encrypt password and pass it to create user
		encryptPassword = (callback) ->
			if req.body.password is req.body.password_confirmation
				User.hashPassword req.body.password, callback
			else
				return res.json(error:
					confirm_password: "Passwords do not match"
				)
		# create user with hashed password
		createUser = (hashed_password, callback) ->
			User.create(
				username: req.body.username
				email_address: req.body.email_address
				password_digest: hashed_password
			).success((user) ->
				req.user = req.session.user = user
				res.json redirect: "/login"
				return
			)
	]
	return
