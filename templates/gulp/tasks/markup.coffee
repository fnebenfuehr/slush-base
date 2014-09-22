gulp = require 'gulp'
g = require('gulp-load-plugins')(lazy: false)
reportError = require '../util/errorHandler'

gulp.task 'jade', ->
  YOUR_LOCALS = {}
  gulp.src(["#{global.src}/index.jade"])
    .pipe g.plumber(errorHandler: reportError)
    .pipe g.jade(locals: YOUR_LOCALS).on('error', reportError)
    .pipe gulp.dest("#{global.dest}")

gulp.task 'markup', ['jade']