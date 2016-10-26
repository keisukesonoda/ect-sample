gulp = require 'gulp'
CONF = require '../config'
FUNCTIONS = require './functions'
browser = require 'browser-sync'
reload = browser.reload



# coffee
# --------------------
coffee  = require 'gulp-coffee'
gutil   = require 'gulp-util'
uglify  = require 'gulp-uglify'
plumber = require 'gulp-plumber'
js      =
  concats: [
    'script'
  ]

gulp.task 'coffee', ->
  gulp.src "#{CONF.PATH.src.coffee}/*.coffee"
      .pipe plumber()
      .pipe coffee({
        bare: true
      }).on('error', gutil.log)
      .pipe gulp.dest "#{CONF.PATH.src.js}"
      .pipe uglify()
      .pipe rename({
        suffix: '.min'
        })
      .pipe gulp.dest "#{CONF.PATH.dest.js}"
      .pipe browser.reload({ stream: true })



# sass
# --------------------
sass         = require 'gulp-sass'
autoprefixer = require 'gulp-autoprefixer'
cssmin       = require 'gulp-cssmin'
rename       = require 'gulp-rename'
css          =
  files: ['style', 'sp']

gulp.task 'sass', ->
  sassfiles = []
  for file in css.files
    sassfiles.push "#{CONF.PATH.src.sass}/"+file+'.scss'

  gulp.src sassfiles
      .pipe plumber()
      .pipe sass({
        outputStyle: 'expanded'
      }).on('error', sass.logError)
      .pipe autoprefixer({
        browsers: [
          'last 2 versions'
          'ie >= 10'
          'Android >= 4.1'
          'ios_saf >= 7'
        ]
        cascade: false
      })
      .pipe gulp.dest "#{CONF.PATH.src.css}"
      .pipe cssmin()
      .pipe rename({
        suffix: '.min'
        })
      .pipe gulp.dest "#{CONF.PATH.dest.css}"
      .pipe browser.reload({ stream: true })



