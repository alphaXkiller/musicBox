jade     = require 'jade'
gulp     = require 'gulp'
config   = require('../config.coffee')
gulpJade = require 'gulp-jade'


gulp.task 'views', ->
  gulp
  .src config.views.path
  .pipe gulpJade {jade: jade, pretty: true}
  .pipe gulp.dest config.directory.build