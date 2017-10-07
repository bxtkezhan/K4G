extends Control

export var start = false
export var waitTime = 10

var timeStep = 1
var timeChanged = false
var timeTag = 0
var gemNum = 0

onready var timer = get_node("Timer")
onready var timeLabel = get_node("timeLabel")
onready var gemLabel = get_node("gemLabel")

func _ready():
	timer.set_wait_time(waitTime)
	timer.set_one_shot(true)
	timeTag = int(timer.get_time_left())
	if start:
		timer.start()
	set_fixed_process(true)

func _fixed_process(delta):
	var timeLeft = int(timer.get_time_left())
	timeChanged = (
		(timeTag != timeLeft) and (timeLeft % timeStep == 0))
	if timeTag != timeLeft:
		timeTag = timeLeft
		timeLabel.set_text("Timer: " + str(timeTag))
	gemLabel.set_text("Gems: " + str(gemNum))

func _on_Timer_timeout():
	var allScenesGems = {
		'gameSeg1': 0, 'gameSeg2': 0,
		'gameSeg3': 0, 'gameSeg4': 0
	}
	var file = File.new()
	var filename = "user://k4g.config"
	file.open(filename, File.READ_WRITE)
	allScenesGems.parse_json(file.get_as_text())
	print(allScenesGems)
	allScenesGems[get_parent().get_name()] += gemNum
	file.store_string(allScenesGems.to_json())
	file.close()
	get_tree().change_scene("res://main.tscn")
