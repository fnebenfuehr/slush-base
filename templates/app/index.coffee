$ = jquery = require 'jquery'

Hello = require './home/hello'

$(document).ready ->
  hello = new Hello()
  $('body').append hello.el