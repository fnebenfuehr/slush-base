gulp = require 'gulp'

gulp.task 'build', ['browserify', 'styles', 'assets', 'markup']