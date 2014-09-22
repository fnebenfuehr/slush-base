g = require('gulp-load-plugins')(lazy: false)
prettyHrtime = require 'pretty-hrtime'
startTime = 0
# Provides gulp style logs to the bundle method in browserify.coffee
bundleLogger =

  start: ->
    startTime = process.hrtime()
    g.util.log('Running', g.util.colors.green("'bundle'") + '...')

  end: ->
    taskTime   = process.hrtime(startTime)
    prettyTime = prettyHrtime(taskTime)
    g.util.log('Finished', g.util.colors.green("'bundle'"), 'after', g.util.colors.magenta(prettyTime))

module.exports = bundleLogger
