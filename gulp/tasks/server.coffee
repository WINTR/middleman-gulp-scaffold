#--------------------------------------------------------
# Requirements
#--------------------------------------------------------

gulp    = require 'gulp'
plugins = require('gulp-load-plugins')()
config  = require "../config.coffee"
spawn   = require('child_process').spawn

# --------------------------------------------------------
# Run Middleman server
# --------------------------------------------------------

gulp.task "server", ->
  child = spawn 'middleman', ['server']
  child.stdout.pipe process.stdout
  child.stderr.pipe process.stderr
  return
