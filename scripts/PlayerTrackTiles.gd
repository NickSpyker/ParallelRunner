extends TileMap

export var scrollSpeed = 150
var mapPXWidth = 1280

var mapWidth = null
var mapHeight = null

var environment_type = 1

### Building patterns ###
var grass1_block = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
var grass2_block = [[9, 10, 11], [12, 13, 14], [15, 16, 17]]
var grass3_block = [[18, 19, 20], [21, 22, 23], [24, 25, 26]]

var stick_platform  = [49, 50, 51]
var block1_platform = [27, 28, 29]
var block2_platform = [38, 39, 40]

var block1_cube = [[35, 36], [34, 33]]
var block2_cube = [[46, 47], [45, 44]]

var block1_col = [[30], [31], [32]]
var block2_col = [[41], [42], [43]]
#########################

func loadGround(x: int, y: int, s: int, f: int):
	var cell = -1
	match y:
		7: match environment_type:
			0:
				if x == s:
					cell = 0
				elif x == f:
					cell = 2
				else:
					cell = 1
			1:
				if x == s:
					cell = 9
				elif x == f:
					cell = 11
				else:
					cell = 10
			_:
				if x == s:
					cell = 18
				elif x == f:
					cell = 20
				else:
					cell = 19
		8: match environment_type:
			0:
				if x == s:
					cell = 6
				elif x == f:
					cell = 8
				else:
					cell = 7
			1:
				if x == s:
					cell = 15
				elif x == f:
					cell = 17
				else:
					cell = 16
			_:
				if x == s:
					cell = 24
				elif x == f:
					cell = 26
				else:
					cell = 25
		_:
			pass
	set_cell(x, y, cell)

func loadPart(s: int, f: int):
	environment_type += 1
	if 2 < environment_type:
		environment_type = 0
	for y in range(mapHeight):
		for x in range(s, f):
			loadGround(x, y, s, f)

func getMap():
	var map = []
	for y in range(mapHeight):
		var row = []
		for x in range(mapWidth):
			var cell = get_cell(x, y)
			row.append(cell)
		map.append(row)
	return map

func _ready():
	mapWidth = Global.MAP_WIDTH
	mapHeight = Global.MAP_HEIGHT

func _process(delta):
	
	position.x -= scrollSpeed * delta
	if position.x < -mapPXWidth:
		loadPart(mapWidth / 2, mapWidth)
		position.x += mapPXWidth
		loadPart(0, mapWidth / 2)
