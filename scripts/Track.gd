extends Node2D

export var parallaxSpeed = 50
var parallax = 0

func _ready():
	$Player1.setPlayerType(Global.playerType1)
	$Player2.setPlayerType(Global.playerType2)
	$Player1.setIdleAnimation("run")
	$Player2.setIdleAnimation("run")

func _process(delta):
	
	parallax += parallaxSpeed * delta
	if 1280 <= parallax:
		parallax = 0
	$Background/Top.region_rect = Rect2(parallax, parallax / 2, 1280, 360)
	$Background/Bottom.region_rect = Rect2(parallax, parallax / 2, 1280, 360)
	
	if Input.is_action_pressed("player1_jump"):
		$Player1.Jump()
	if Input.is_action_pressed("player2_jump"):
		$Player2.Jump()
