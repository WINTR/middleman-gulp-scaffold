#--------------------------------------------------------
# Requirements
#--------------------------------------------------------

gulp    = require 'gulp'
plugins = require('gulp-load-plugins')()
config  = require "../config.coffee"
kouto   = require "kouto-swiss"
jeet    = require "jeet"

#--------------------------------------------------------
# Compile Stylesheets
#--------------------------------------------------------

gulp.task "stylesheets", ->
  gulp.src ["#{config.sourcePath}/#{config.cssDirectory}/#{config.cssMainFile}.styl"]
    .pipe plugins.plumber()
    .pipe plugins.stylus
      sourcemap:
        inline: config.development
      use: [kouto(), jeet()]
    .pipe plugins.sourcemaps.init
      loadMaps: true
    .pipe plugins.autoprefixer()
    .pipe plugins.sourcemaps.write()
    .pipe gulp.dest "#{config.outputPath}/#{config.cssDirectory}"

  gulp.src ["#{config.sourcePath}/#{config.cssDirectory}/ie.styl"]
    .pipe plugins.plumber()
    .pipe plugins.stylus()
    .pipe plugins.autoprefixer()
    .pipe gulp.dest "#{config.outputPath}/#{config.cssDirectory}"