extends Node

onready var scene3 = get_node("k4g_scene3")
onready var gameCtrl = get_node("gameCtrl")
onready var character = get_node("characterBody")
var gemGenerator = preload("res://Scenes/Gem/gem.scn")

var posList = [
	Vector3(1.124878, 0.986821, -1.466736),
	Vector3(-0.829407, 0.986821, -1.617435),
	Vector3(-2.822478, 0.152639, -1.206417),
	Vector3(2.09546, 0.350759, 2.614353),
	Vector3(2.65381, 0.258352, -1.363552),
	Vector3(0.760743, 0.311941, -3.0574),
	Vector3(-1.271971, 0.322927, 2.993137),
]

var gemList = []
var gemsVisible = false

func _ready():
	for vect in posList:
		var gem = gemGenerator.instance()
		gem.set_translation(vect)
		gem.set_mode(RigidBody.MODE_STATIC)
		gem.hide()
		gemList.append(gem)
		add_child(gem)
	set_fixed_process(true)

func _fixed_process(delta):
	if scene3.iscoreCollided and not gemsVisible:
		for i in gemList:
			if str(i) != "[Deleted Object]":
				i.show()
		gemsVisible = true
	elif not scene3.iscoreCollided and gemsVisible:
		for i in gemList:
			if str(i) != "[Deleted Object]":
				i.hide()
		gemsVisible = false
	if character.get_translation()[1] < -3.5:
		get_tree().change_scene("res://main.tscn")