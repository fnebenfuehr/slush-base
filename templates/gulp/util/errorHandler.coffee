g = require('gulp-load-plugins')(lazy: false)

errorHandler = ->
  # console.log 'args', arguments
  args = Array::slice.call(arguments)

  g.notify.onError(
    title: 'Compile Error'
    message: "#{error.message}"
  ).apply(@, args)

  # Keep gulp from haning on this task
  @emit 'end'

module.exports = errorHandler