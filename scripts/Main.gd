extends Node2D

func _ready():
	pass

func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Track.tscn")
