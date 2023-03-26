extends Node2D

export(PackedScene) var props

export var parallaxSpeed = 50
var parallax = 0

func _ready():
	randomize()
	$Player1.setPlayerType(Global.playerType1)
	$Player2.setPlayerType(Global.playerType2)
	$Player1.setIdleAnimation("run")
	$Player2.setIdleAnimation("run")
	$Control.visible = false
	$Control/Button.hide()

func _process(delta):
	
	if !has_node("Player1"):
		$Control.margin_top = 360
		$Control.visible = true
		$Control/win_text.text = str("Player 2 WIN !")
		$Control/Button.show()
	if !has_node("Player2"):
		$Control.margin_top = 0
		$Control.visible = true
		$Control/win_text.text = str("Player 1 WIN !")
		$Control/Button.show()
	
	parallax += parallaxSpeed * delta
	if 1280 <= parallax:
		parallax = 0
	$Background/Top.region_rect = Rect2(parallax, parallax / 2, 1280, 360)
	$Background/Bottom.region_rect = Rect2(parallax, parallax / 2, 1280, 360)
	
	if Input.is_action_pressed("player1_jump") and has_node("Player1"):
		$Player1.Jump()
	if Input.is_action_pressed("player2_jump") and has_node("Player2"):
		$Player2.Jump()
	
	if Input.is_action_pressed("player1_right") and has_node("Player1"):
		$Player1.move_right()
	elif Input.is_action_pressed("player1_left") and has_node("Player1"):
		$Player1.move_left()
	elif has_node("Player1"):
		$Player1.stop_move()
	
	if Input.is_action_pressed("player2_right") and has_node("Player2"):
		$Player2.move_right()
	elif Input.is_action_pressed("player2_left") and has_node("Player2"):
		$Player2.move_left()
	elif has_node("Player2"):
		$Player2.stop_move()

func _on_Timer_timeout():
	var luck = randi() % 3
	if luck == 2:
		pass
	var prop = props.instance()
	var child_count = prop.get_child_count()
	var index = randi() % child_count
	for i in range(child_count - 1, -1, -1):
		if i != index:
			var child = prop.get_child(i)
			prop.remove_child(child)
	match luck:
		0:
			prop.position.y = 312
		1:
			prop.position.y = 672
		_:
			pass
	add_child(prop)

func _on_Button_pressed():
	var isErr = get_tree().change_scene("res://scenes/Main.tscn")
	if isErr:
		OS.alert("An error has occurred, please restart the game.", "Error")
