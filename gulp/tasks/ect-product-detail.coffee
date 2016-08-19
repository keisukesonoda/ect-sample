gulp = require 'gulp'
CONF = require '../config'
FUNCTIONS = require './functions'
browser = require 'browser-sync'
reload = browser.reload
# ect     = require 'gulp-ect'
ect = require 'gulp-ect-simple'

productions = CONF.DATA.pages.production

gulp.task 'ect-product', ->
	for product in productions

		gulp.src "#{CONF.PATH.src.temp}/content/product/detail/index.ect"
				.pipe ect({
					options:
						root: "#{CONF.PATH.src.temp}"
						ext: '.ect'
					data:
						title: product.title
						name: product.name
						maker: product.maker
						description: product.description
						data: CONF.DATA
						func: FUNCTIONS
				})
				.pipe gulp.dest "#{CONF.PATH.dest.root}/product/detail/"+product.name
				.pipe reload({stream: true})








