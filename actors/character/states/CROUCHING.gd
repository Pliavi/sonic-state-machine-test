extends CharacterState

func update(_delta):
	if Input.is_action_just_released("ui_down"):
		self.change_state("IDLE")
		