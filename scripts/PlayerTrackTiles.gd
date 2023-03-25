extends TileMap

export var scrollSpeed = 150
var mapPXWidth = 1280

var mapWidth = null
var mapHeight = null

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
	var file = File.new()
	file.open("res://file.txt", File.WRITE)
	var map = getMap()
	var s = ""
	for row in map:
		for element in row:
			s += str(element) + " "
		s += "\n"
	file.store_string(s)
	file.close()

func _process(delta):
	
	position.x -= scrollSpeed * delta
	if position.x < -mapPXWidth:
		position.x += mapPXWidth
