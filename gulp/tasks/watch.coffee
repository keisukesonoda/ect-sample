gulp = require 'gulp'
CONF = require '../config'

### ファイル監視 ###
gulp.task 'watch', ->

	gulp.watch [
		"#{CONF.PATH.src.temp}/**/*.ect"
		"!#{CONF.PATH.src.temp}/content/product/detail/index.ect"
	], ['ect-base']

	gulp.watch [
		"#{CONF.PATH.src.temp}/content/product/detail/index.ect"
	], ['ect-product']

	gulp.watch [
		"#{CONF.PATH.dest.root}/css/*.css"
	], ['reload']

	gulp.watch [
		"#{CONF.PATH.src.coffee}/*.coffee"
	], ['coffee']

	gulp.watch [
		"#{CONF.PATH.src.sass}/**/*.scss"
	], ['sass']
