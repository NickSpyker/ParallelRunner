extends Node2D

export var parallaxeSpeed = 50
var parallaxe = 0

func _ready():
	pass

func _process(delta):
	
	parallaxe += parallaxeSpeed * delta
	$P1_track/bg.region_rect = Rect2(parallaxe, parallaxe, 1280, 360)
	$P2_track/bg.region_rect = Rect2(parallaxe, -parallaxe, 1280, 360)
