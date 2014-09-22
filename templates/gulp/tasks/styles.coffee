gulp        = require 'gulp'
reportError = require '../util/errorHandler'
g = require('gulp-load-plugins')(lazy: false)

gulp.task 'stylus', ->
  gulp.src("#{global.src}/**/*.styl")
    .pipe g.plumber(errorHandler: reportError)
    .pipe g.stylus(
      use: [require('nib')],
      compress: true,
      sourcemap: {inline: true, sourceRoot:'.', basePath: "#{global.dest}"})
    .pipe g.concat('app.css')
    .pipe gulp.dest("#{global.dest}")

gulp.task 'styles', ['stylus']