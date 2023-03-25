extends KinematicBody2D

export var gravity = 600
export var jumpPower = 500

var velocity = Vector2.ZERO

var playerType = "mask_"
var idle = "idle"

func getAnimation():
	var actualPlayerAnimation = $AnimatedSprite.animation
	var separatorIndex = actualPlayerAnimation.find("_")
	return actualPlayerAnimation.substr(separatorIndex + 1)

func _ready():
	velocity = Vector2.ZERO

func _process(delta):
	if !is_on_floor():
		if velocity.y > 0:
			$AnimatedSprite.play(playerType + "fall")
		else:
			$AnimatedSprite.play(playerType + "jump")
		velocity.y += gravity * delta
	else:
		$AnimatedSprite.play(playerType + idle)
	velocity = move_and_slide(velocity, Vector2.UP)

func Jump():
	if is_on_floor():
		velocity.y = -jumpPower

func setIdleAnimation(animation: String):
	idle = animation

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
	$AnimatedSprite.play(playerType + getAnimation())
