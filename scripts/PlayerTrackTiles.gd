extends TileMap

export var scrollSpeed = 150
var mapPXWidth = 1280

var mapWidth = null
var mapHeight = null

var rng = RandomNumberGenerator.new()

var environment_type = 0
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
	for y in range(7, 9):
		for x in range(s, f):
			loadGround(x, y, s, f)

func _ready():
	mapWidth = Global.MAP_WIDTH
	mapHeight = Global.MAP_HEIGHT
	rng.randomize()
	environment_type = rng.randi_range(0, 2)
	loadPart(mapWidth / 2, mapWidth)
	loadPart(0, mapWidth / 2)

func _process(delta):
	position.x -= scrollSpeed * delta
	if position.x < -mapPXWidth:
		loadPart(mapWidth / 2, mapWidth)
		loadPart(0, mapWidth / 2)
		position.x += mapPXWidth
