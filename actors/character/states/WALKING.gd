extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func update(_delta):
	var character = self.target

	if character.can_jump():
		return self.change_state("JUMPING")

	if character.can_spin():
		return self.change_state("SPINNING")

	if character.is_idling():
		return self.change_state("IDLE")
