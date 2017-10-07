extends RigidBody

onready var tween = get_node("Tween")
onready var samplePlayer = get_node("SamplePlayer")
var isCollided = false

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	rotate_y(1 * delta)
	tween.interpolate_method(
		self, "gemOut", 0, 3, 1,
		Tween.TRANS_QUAD, Tween.EASE_OUT)

func _on_Area_body_enter( body ):
	if body.get_name() == "characterBody" and not isCollided:
		isCollided = true
		get_parent().get_node("gameCtrl").gemNum += 1
		set_mode(RigidBody.MODE_STATIC)
		tween.start()
		samplePlayer.play("gem")
	else:
		queue_free()

func gemOut(num):
	if num >= 1:
		hide()
	if num >= 3:
		queue_free()