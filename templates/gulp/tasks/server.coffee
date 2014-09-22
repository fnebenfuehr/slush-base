gulp        = require 'gulp'
browserSync = require 'browser-sync'

gulp.task 'browserSync', ['build'], ->
  browserSync
    server:
      baseDir: ["#{global.dest}"]
    files: [
      # Watch everything in dest
      "#{global.dest}/**",
      # Exclude sourcemap files
      "!#{global.dest}/**.map"
    ]

gulp.task 'server', ['browserSync']