extends Control

onready var scene1Gems = get_node("scene1Gems")
onready var scene2Gems = get_node("scene2Gems")
onready var scene3Gems = get_node("scene3Gems")

func _ready():
	var allScenesGems = {
		'gameSeg1': 0, 'gameSeg2': 0,
		'gameSeg3': 0, 'gameSeg4': 0
	}
	var file = File.new()
	var filename = "user://k4g.config"
	if not file.file_exists(filename):
		file.open(filename, File.WRITE)
		file.store_string(allScenesGems.to_json())
	else:
		file.open(filename, File.READ)
		allScenesGems.parse_json(file.get_as_text())
	file.close()
	scene1Gems.set_text(
		"Gems: " + str(allScenesGems['gameSeg1']))
	scene2Gems.set_text(
		"Gems: " + str(allScenesGems['gameSeg2']))
	scene3Gems.set_text(
		"Gems: " + str(allScenesGems['gameSeg3']))


func _on_toScene1_pressed():
	get_tree().change_scene("res://Segments/gameSeg1.tscn")


func _on_toScene2_pressed():
	get_tree().change_scene("res://Segments/gameSeg2.tscn")


func _on_toScene3_pressed():
	get_tree().change_scene("res://Segments/gameSeg3.tscn")
