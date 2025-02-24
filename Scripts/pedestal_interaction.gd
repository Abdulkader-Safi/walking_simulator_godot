extends IntractableObject

@onready var light_bold = $LightBulb

func _interact() -> void:
	light_bold.visible = true
	can_interact = false
