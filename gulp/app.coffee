path         = require 'path'
route        = require '../routes/routes.coffee'
logger       = require 'morgan'
config       = require './config.coffee'
express      = require 'express'
bodyParser   = require 'body-parser'
cookieParser = require 'cookie-parser'

module.exports = (app) ->
  build = config.directory.build
  app.use express.static build

  urlencoded = bodyParser.urlencoded extended: true
  app.use urlencoded
  app.use bodyParser.json()

  route app

  app.use logger '[:method] --:status :url :response-time'

  return app
