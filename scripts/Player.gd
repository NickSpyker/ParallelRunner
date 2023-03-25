extends KinematicBody2D

export var gravity = 600
export var jumpPower = 500

var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO

var playerType = "mask_"

func _ready():
	rng.randomize()
	var player = ["mask_", "ninja_", "pink_", "virtual_"]
	playerType = player[rng.randi_range(0, 3)]
	$AnimatedSprite.play(playerType + "run")
	velocity = Vector2.ZERO

func _process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func Jump():
	if is_on_floor():
		velocity.y = -jumpPower

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
