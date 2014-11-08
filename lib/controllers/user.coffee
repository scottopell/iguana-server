models				 = require '../models'
winston				 = require 'winston'
async					 = require 'async'

bcrypt				 = require 'bcrypt'
passport			 = require 'passport'
LocalStrategy	 = require('passport-local').Strategy

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

#Sign in using username and Password.
passport.use new LocalStrategy(
	# these are the fields expected in the POST request
	usernameField: "username"
	passwordField: "password"

, (username, password, done) ->
	console.log('\t\tlogin request for')
	console.log(username)
	async.waterfall [

		# look for user with given username
		findUser = (callback) ->
			User.find(where:
				username: username
			).success((user) ->
				callback null, user
				return
			).failure (error) ->
				console.log 'user not found'
				done null, false,
					message: "User not found"

		# make sure password is valid
		comparePassword = (user, callback) ->
			unless user
				return done(null, false,
					console.log 'invalid login details'
					message: "Invalid email or password."
				)
			bcrypt.compare password, user.password_digest, (err, match) ->
				if match
					done null, user
				else
					console.log 'invalid login details'
					done null, false,
						message: "Invalid email or password."


	]
	return
)

#Passport required serialization
passport.serializeUser (user, done) ->
	done null, user.id
	return


# passport required deserialize find user given id from serialize
passport.deserializeUser (id, done) ->
	User.find(where:
		id: id
	).success((user) ->
		done null, user
		return
	).failure (error) ->
		done error, null
		return

	return
