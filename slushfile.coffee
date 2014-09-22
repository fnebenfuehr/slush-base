'use strict'

gulp     = require 'gulp'
install  = require 'gulp-install'
conflict = require 'gulp-conflict'
template = require 'gulp-template'

inquirer = require 'inquirer'
path     = require 'path'

_ = require 'underscore.string'

gulp.task 'default', (done) ->
  inquirer.prompt [
    {type: 'input', name: 'name', message: 'How do you want to name your app?', default: getNameProposal()},
    {type: 'input', name: 'description', message: 'Describe your app in one line:', default: 'Todo'}
  ], (answers) ->
    answers.nameDashed  = _.slugify(answers.name)
    answers.description = answers.description
    answers.modulename  = _.camelize(answers.nameDashed)

    files = [__dirname + '/templates/**']

    return gulp.src(files)
      .pipe template(answers)
      .pipe conflict('./')
      .pipe gulp.dest('./')
      .pipe install()
      .on 'end', ->
        done()

getNameProposal = ->
  try
    return require(path.join(process.cwd(), 'package.json')).name
  catch e
    return path.basename(process.cwd())