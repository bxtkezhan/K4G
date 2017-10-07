extends Control

onready var rigidBody = get_parent().get_node("characterBody")
onready var character = rigidBody.get_node("character1")
onready var animationPlayer = character.get_node("AnimationPlayer")
var rotationSpeed = 0

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	if rotationSpeed:
		rigidBody.rotate_y(delta * rotationSpeed * 2.5)

func _on_runButton_button_down():
	character.runTag = true

func _on_runButton_button_up():
	character.runTag = false
	if not character.jumpTag:
		animationPlayer.play("human_skeletonAction")
	
func _on_jumpButton_button_down():
	if not character.jumpTag:
		# animationPlayer.play("AJumpStart")
		animationPlayer.play("AJump")
		rigidBody.set_linear_velocity(Vector3(0, 10, 0))
		character.jumpTag = true

func _on_leftButton_button_down():
	rotationSpeed = -1

func _on_rightButton_button_down():
	rotationSpeed = 1

func _on_leftButton_button_up():
	rotationSpeed = 0

func _on_rightButton_button_up():
	rotationSpeed = 0

func _input(event):
	if event.is_action_pressed("ui_up"):
		_on_runButton_button_down()
	elif event.is_action_released("ui_up"):
		_on_runButton_button_up()
	
	if event.is_action_pressed("ui_jump"):
		_on_jumpButton_button_down()
	
	if event.is_action_pressed("ui_left"):
		_on_leftButton_button_down()
	elif event.is_action_released("ui_left"):
		_on_leftButton_button_up()
		
	if event.is_action_pressed("ui_right"):
		_on_rightButton_button_down()
	elif event.is_action_released("ui_right"):
		_on_rightButton_button_up()