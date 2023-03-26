extends TileMap

func _ready():
	position.x = 1280

func _process(delta):
	if position.x < -500:
		queue_free()
	else:
		position.x -= 150 * delta
