path    = require 'path'
gulp    = require 'gulp'
webpack = require 'webpack'
config  = require '../config.coffee'

gulp.task 'webpack', ->
  compiler = webpack config.webpack

  compiler.watch null, (err, stats) ->
    jsonStats = stats.toJson()
    if err then console.log err
    if jsonStats.errors.length > 0
      for error in jsonStats.errors
        console.log error

    if jsonStats.warnings.length > 0 then console.log 'Stats.warning'

