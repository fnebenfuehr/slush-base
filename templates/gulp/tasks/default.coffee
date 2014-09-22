gulp = require 'gulp'

global.src  = './app'
global.dest = './public'

gulp.task 'serve'  , ['watch']
gulp.task 'default', ['serve']