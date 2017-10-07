extends Node

onready var gameCtrl = get_node("gameCtrl")
onready var character = get_node("characterBody")
var gemGenerator = preload("res://Scenes/Gem/gem.scn")
var index = 0

var posList = [
	Vector3(-0.538894, 3.327804, 1.449694),
	Vector3(-0.017154, 3.675631, 5.580138),
	Vector3(1.101373, 3.539436, -1.485096),
	Vector3(-0.001174, 5.90432, -5.224168),
	Vector3(4.020984, 1.822732, 1.057364),
	Vector3(5.663647, 0.288826, 2.815202),
	Vector3(1.351463, -3.845194, 1.018676),
	Vector3(-0.451079, -4.216299, -0.866662),
	Vector3(-1.326551, -3.798883, -2.438219),
	Vector3(-5.088944, 0.51577, -4.144625),
	Vector3(-4.328247, 1.807683, -2.014671),
	Vector3(0, 10, 0),
]
func _ready():
	gameCtrl.timeStep = 5
	set_fixed_process(true)

func _fixed_process(delta):
	if gameCtrl.timeChanged:
		var gem = gemGenerator.instance()
		gem.set_translation(posList[index])
		gem.set_mode(RigidBody.MODE_STATIC)
		add_child(gem)
		index += 1
		index = index % posList.size()
	if character.get_translation()[1] < -8:
		get_tree().change_scene("res://main.tscn")