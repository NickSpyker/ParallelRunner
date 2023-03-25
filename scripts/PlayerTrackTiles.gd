extends TileMap

export var scrollSpeed = 150
var mapWidth = 1280

func _ready():
	pass

func _process(delta):
	
	position.x -= scrollSpeed * delta
	if position.x < -mapWidth:
		position.x += mapWidth
