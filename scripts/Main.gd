extends Node2D

export var parallaxSpeed = 50
var parallax = 0

var players = ["mask", "ninja", "pink", "virtual"]

var index1 = null
var index2 = null

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	index1 = rng.randi_range(0, 3)
	index2 = rng.randi_range(0, 3)
	while index1 == index2:
		index2 = rng.randi_range(0, 3)
	Global.playerType1 = players[index1]
	Global.playerType2 = players[index2]
	$Player1.setPlayerType(Global.playerType1)
	$Player2.setPlayerType(Global.playerType2)

func _process(delta):
	parallax += parallaxSpeed * delta
	if 1280 <= parallax:
		parallax = 0
	$bg.region_rect = Rect2(parallax, 0, 1280, 720)
	
	if Input.is_action_pressed("player1_jump"):
		$Player1.Jump()
	if Input.is_action_pressed("player2_jump"):
		$Player2.Jump()
		
	if Input.is_action_just_pressed("player1_chose"):
		index1 += 1
		if index1 > 3:
			index1 = 0
		Global.playerType1 = players[index1]
		$Player1.setPlayerType(Global.playerType1)
	if Input.is_action_just_pressed("player2_chose"):
		index2 += 1
		if index2 > 3:
			index2 = 0
		Global.playerType2 = players[index2]
		$Player2.setPlayerType(Global.playerType2)

func _on_StartButton_pressed():
	var isErr = get_tree().change_scene("res://scenes/Track.tscn")
	if isErr:
		OS.alert("An error has occurred, please restart the game.", "Error")
