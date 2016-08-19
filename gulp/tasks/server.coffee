gulp    = require 'gulp'
CONF    = require '../config'
browser = require 'browser-sync'
reload  = browser.reload


### サーバー起動 ###
gulp.task 'server', ->
	browser({
		server:
			baseDir: [
				"#{CONF.PATH.dest.root}"
			]
		port: 8000
		open: false
		reloadDelay: CONF.PARAMS.reloadDelay
	})


### リロード ###
gulp.task 'reload', ->
	gulp.src './'
			.pipe reload({ stream: true })
