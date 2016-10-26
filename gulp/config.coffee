gulp = require 'gulp'
YAML = require 'js-yaml'
fs   = require 'fs'
CONFIG = {}

### ディレクトリ名設定 ###
CONFIG.DIR =
	'app': 'app'
	'src': 'source'
	'dest': 'build'
	'sass': 'sass'
	'coffee': 'coffee'
	'js': 'js'
	'css': 'css'
	'temp': 'templates'

### パス設定 ###
CONFIG.PATH =
	'src':
		'root':   "#{CONFIG.DIR.app}/#{CONFIG.DIR.src}"
		'temp':   "#{CONFIG.DIR.app}/#{CONFIG.DIR.src}/#{CONFIG.DIR.temp}"
		'coffee': "#{CONFIG.DIR.app}/#{CONFIG.DIR.src}/#{CONFIG.DIR.coffee}"
		'js':     "#{CONFIG.DIR.app}/#{CONFIG.DIR.src}/#{CONFIG.DIR.js}"
		'sass':   "#{CONFIG.DIR.app}/#{CONFIG.DIR.src}/#{CONFIG.DIR.sass}"
		'css':    "#{CONFIG.DIR.app}/#{CONFIG.DIR.src}/#{CONFIG.DIR.css}"
	'dest':
		'root': "#{CONFIG.DIR.app}/#{CONFIG.DIR.dest}"
		'js':   "#{CONFIG.DIR.app}/#{CONFIG.DIR.dest}/#{CONFIG.DIR.js}"
		'css':  "#{CONFIG.DIR.app}/#{CONFIG.DIR.dest}/#{CONFIG.DIR.css}"

### data読み込み ###
CONFIG.DATA =
	'pages': YAML.safeLoad fs.readFileSync "#{CONFIG.PATH.src.root}/data/pages.yaml", 'utf8'

### パラメータ設定 ###
CONFIG.PARAMS =
	reloadDelay = 200

### CONFIGを出力 ###
module.exports = CONFIG

### gulp起動タスク ###
gulp.task 'default', ['server', 'watch']


