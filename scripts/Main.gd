extends Node2D

func _ready():
	pass

func _on_StartButton_pressed():
	var isErr = get_tree().change_scene("res://scenes/Track.tscn")
	if isErr:
		OS.alert("An error has occurred, please restart the game.", "Error")
