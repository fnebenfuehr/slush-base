gulp = require 'gulp'
g = require('gulp-load-plugins')(lazy: false)
reportError = require '../util/errorHandler'

gulp.task 'images', ->
  gulp.src("assets/**")
    .pipe g.plumber(errorHandler: reportError)
    .pipe g.changed("#{global.dest}/i")
    .pipe g.imagemin()
    .pipe gulp.dest("#{global.dest}/i")

gulp.task 'assets', ['images']