extends Spatial

var iscoreCollided = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area_body_enter( body ):
	if body.get_name() == "characterBody":
		iscoreCollided = true

func _on_Area_body_exit( body ):
	if body.get_name() == "characterBody":
		iscoreCollided = false
