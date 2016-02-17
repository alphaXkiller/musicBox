express = require 'express'
gulp    = require 'gulp'
path    = require 'path'
nodemon = require 'gulp-nodemon'
config  = require '../config.coffee'
server  = require '../app.coffee'
webpack = require './webpack.coffee'
views   = require './views.coffee'
app     = express()

gulp.task 'start-server', ->
  server app
  app.listen 4000, ->
    console.log 'It\'s listening on port: 4000'

tasks = [
  'webpack',
  'views',
  'start-server'
]

scriptFile = path.join config.directory.source, '/**/*.coffee'
viewsFile  = path.join config.directory.source, '/**/*.jade'

gulp.task 'serve', tasks, ->
  gulp.watch scriptFile, ['webpack']
  gulp.watch viewsFile, ['views']
  console.log 'PID: ', process.pid
