extends Spatial

onready var sun = get_node("Sun")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	sun.rotate_y(delta * 1)
