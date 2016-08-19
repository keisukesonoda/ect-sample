CONF = require '../config'
FUNCTIONS = {}

FUNCTIONS.getMetaInfo = (id) ->
	pages  = CONF.DATA.pages.data
	global = CONF.DATA.pages.data.global
	result = {}

	if id is 'production'
		result.title = 'hoge'
	else if id is 'top'
		result.title = global.sitename
	else
		result.title = pages[id].title + ' | ' + global.sitename

	result.description = global.description
	result.keywords = global.keywords


	return result

FUNCTIONS.str2Upper = (str) ->
	return str.toUpperCase()

FUNCTIONS.n2br = (str) ->
	# 最後の不要な'\n'を削除
	newStr = str.slice(0, -1)
	return newStr.replace(/\n/g, '<br/>')

FUNCTIONS.urlEncode = (str) ->
	return encodeURIComponent(str)

FUNCTIONS.replace_half_size = (str) ->
	createMap = (properties, values) ->
		if properties.length is values.length
			map = {}
			for i in [ 0...properties.length ]
				property = properties.charCodeAt(i)
				value = values.charCodeAt(i)
				map[property] = value
		return map

	m = createMap('アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンァィゥェォッャュョ','ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｧｨｩｪｫｯｬｭｮ')
	g = createMap('ガギグゲゴザジズゼゾダヂヅデドバビブベボヴ','ｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾊﾋﾌﾍﾎｳ')
	p = createMap('パピプペポ','ﾊﾋﾌﾍﾎ')
	e = createMap('ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ', 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz')
	n = createMap('１２３４５６７８９０', '1234567890')
	k = createMap('！＠＃＄％＾＆＊（）＿＋｜〜ー＝￥：；’”＜＞？、。・　', '!@#$%^&*()_+|~-=¥:;\'\"<>?､｡･ ')
	gMark = 'ﾞ'.charCodeAt(0)
	pMark = 'ﾟ'.charCodeAt(0)

	half = (str) ->
		for i in [ 0...str.length+500 ]
			if g.hasOwnProperty(str.charCodeAt(i)) || p.hasOwnProperty(str.charCodeAt(i))
				if g[str.charCodeAt(i)]
					# 濁音文字
					str = str.replace(str[i], String.fromCharCode(g[str.charCodeAt(i)])+String.fromCharCode(gMark))
				else if p[str.charCodeAt(i)]
					# 半濁音文字
					str = str.replace(str[i], String.fromCharCode(p[str.charCodeAt(i)])+String.fromCharCode(pMark));
				else
					break
				i++
				_ref = str.length
			else
				if n[str.charCodeAt(i)]
				# 数字
					str = str.replace(str[i], String.fromCharCode(n[str.charCodeAt(i)]))
				else if e[str.charCodeAt(i)]
				# 英語
					str = str.replace(str[i], String.fromCharCode(e[str.charCodeAt(i)]))
				else if k[str.charCodeAt(i)]
				# 記号
					str = str.replace(str[i], String.fromCharCode(k[str.charCodeAt(i)]))
				else if m[str.charCodeAt(i)]
				# 通常カナ
					str = str.replace(str[i], String.fromCharCode(m[str.charCodeAt(i)]))
		return str
	half(str)


module.exports = FUNCTIONS