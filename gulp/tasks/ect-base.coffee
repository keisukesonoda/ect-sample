gulp = require 'gulp'
CONF = require '../config'
FUNCTIONS = require './functions'
browser = require 'browser-sync'
reload = browser.reload
# ect     = require 'gulp-ect'
ect = require 'gulp-ect-simple'

gulp.task 'ect-base', ->
	gulp.src [
		"#{CONF.PATH.src.temp}/content/*.ect"
		"#{CONF.PATH.src.temp}/content/**/*.ect"
		"!#{CONF.PATH.src.temp}/content/**/detail/index.ect"
	]
			.pipe ect({
				options:
					root: "#{CONF.PATH.src.temp}"
					ext: '.ect'
				data:
					data: CONF.DATA
					func: FUNCTIONS
			})
			.pipe gulp.dest "#{CONF.PATH.dest.root}"
			.pipe reload({stream: true})


