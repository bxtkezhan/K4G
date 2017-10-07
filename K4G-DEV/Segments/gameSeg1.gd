extends Node

onready var gameCtrl = get_node("gameCtrl")
onready var character = get_node("characterBody")
var gemGenerator = preload("res://Scenes/Gem/gem.scn")

var number1 = 0
var number2 = 1
var posList = [
	Vector3(-6.344872, 5.492686, -5.765296),
	Vector3(-2.275036, 5.442615, -7.368083),
	Vector3(0.420893, 5.362139, -3.062644),
	Vector3(-1.631233, 4.839048, -1.412896),
	Vector3(2.271828, 5.52309, 2.329215),
	Vector3(5.370134, 5, 3.978962),
	Vector3(8.381001, 4.562055, 1.570269)
]

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if gameCtrl.timeChanged:
		number2 = number1 + number2
		number1 = number2 - number1
		if number1 > 100:
			number1 = 0
			number2 = 1
		var gem = gemGenerator.instance()
		gem.set_gravity_scale(0.03)
		gem.set_translation(posList[number1 % 7])
		gem.set_mode(RigidBody.MODE_RIGID)
		add_child(gem)
	if character.get_translation()[1] < -2:
		get_tree().change_scene("res://main.tscn")