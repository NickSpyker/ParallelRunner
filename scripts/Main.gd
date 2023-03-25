extends Node2D

export var parallaxSpeed = 50
var parallax = 0

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	var player = ["mask", "ninja", "pink", "virtual"]
	Global.playerType1 = player[rng.randi_range(0, 3)]
	Global.playerType2 = player[rng.randi_range(0, 3)]
	while Global.playerType1 == Global.playerType2:
		Global.playerType2 = player[rng.randi_range(0, 3)]
	$Player1.setPlayerType(Global.playerType1)
	$Player2.setPlayerType(Global.playerType2)

func _process(delta):
	parallax += parallaxSpeed * delta
	if 1280 <= parallax:
		parallax = 0
	$bg.region_rect = Rect2(parallax, 0, 1280, 720)

func _on_StartButton_pressed():
	var isErr = get_tree().change_scene("res://scenes/Track.tscn")
	if isErr:
		OS.alert("An error has occurred, please restart the game.", "Error")
