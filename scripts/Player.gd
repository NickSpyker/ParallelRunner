extends KinematicBody2D

var playerType = "mask_"

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

func setPlayerType(player: String):
	match player:
		"mask":
			playerType = "mask_"
		"ninja":
			playerType = "ninja_"
		"pink":
			playerType = "pink_"
		"virtual":
			playerType = "virtual_"
		_:
			pass
	var actualPlayerAnimation = $AnimatedSprite.animation
	var separatorIndex = actualPlayerAnimation.find("_")
	var actualAnimation = actualPlayerAnimation.substr(separatorIndex + 1)
	$AnimatedSprite.play(playerType + actualAnimation)
