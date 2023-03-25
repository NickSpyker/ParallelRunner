extends Node2D

export var parallaxSpeed = 50
var parallax = 0

func _ready():
	pass

func _process(delta):

	parallax += parallaxSpeed * delta
	$Background/Top.region_rect = Rect2(parallax, parallax / 2, 1280, 360)
	$Background/Bottom.region_rect = Rect2(parallax, parallax / 2, 1280, 360)
