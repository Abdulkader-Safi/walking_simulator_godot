extends RayCast3D

@onready var interact_prompt_label: Label = $Label

func _process(_delta):
	var object = get_collider()
	interact_prompt_label.text = ""

	if object and object is IntractableObject:
		if !object.can_interact:
			return

		interact_prompt_label.text = "[E] " + object.interact_prompt
		if Input.is_action_just_pressed("interact"):
			object._interact()