gulp = require 'gulp'

gulp.task 'setWatch', ->
  global.isWatching = true

### Notes:
- gulp/tasks/browserify.coffee handles js recompiling with watchify
- gulp/tasks/server.coffee watches and reloads compiled files
###
gulp.task 'watch', ['setWatch', 'server'], ->
  gulp.watch "#{global.src}/**/*.styl" , ['styles']
  gulp.watch "assets/**" , ['assets']
  gulp.watch "#{global.src}/index.jade", ['markup']