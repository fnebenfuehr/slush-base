'use strict'

class Hello
  constructor: ->
    @el = require('./hello.jade')(name: 'Guest')

module.exports = Hello