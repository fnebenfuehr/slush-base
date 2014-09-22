###
Bundle javascripty things with browserify!

If the watch task is running, this uses watchify instead
of browserify for faster bundling using caching.
###

gulp         = require 'gulp'
browserify   = require 'browserify'
watchify     = require 'watchify'
coffeeify    = require 'coffeeify'
source       = require 'vinyl-source-stream'
bundleLogger = require '../util/bundleLogger'
reportError  = require '../util/errorHandler'
g = require('gulp-load-plugins')(lazy: false)

gulp.task 'browserify', ->
  bundler = browserify({
    # Required watchify args
    cache: {}, packageCache: {}, fullPaths: true,
    # Specify the entry point of the app
    entries: ["#{global.src}/index.coffee"],
    # Add file extensions to make it optional in the requires
    extensions: ['.coffee'],
    # Enable source map!
    debug: true
  })

  bundle = ->
    # Log when bundling starts
    bundleLogger.start()

    return bundler
      # Transform files
      # .transform('coffeeify')
      # Bundle Files
      .bundle()
      # Report compile errors
      .on('error', reportError)
      # User vinyl-source=stream to make the
      # stream gulp compatible. Specifiy the
      # desired output filename here.
      .pipe source('app.js')
      # Specifiy the output destination
      .pipe gulp.dest("#{global.dest}")
      # Log when bundling completes!
      .on('end', bundleLogger.end)

  if global.isWatching
    bundler = watchify(bundler)
    # Rebundle with watchify on changes
    bundler.on 'update', bundle

  bundle()