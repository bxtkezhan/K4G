extends Spatial

onready var animationPlayer = get_node("AnimationPlayer")
onready var human = get_node("human_skeleton")
onready var camera = get_node("Camera")

export var runTag = false
export var jumpTag = false

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if runTag:
		get_parent().translate(Vector3(0, 0, 2.5 * delta))
		if not animationPlayer.is_playing() and not jumpTag:
			animationPlayer.play("ARun")

func _on_Area_body_enter( body ):
	animationPlayer.play("AJumpEnd")
	jumpTag = false

func _on_Area2_body_enter( body ):
	if jumpTag:
		animationPlayer.play("AJumpEnd")