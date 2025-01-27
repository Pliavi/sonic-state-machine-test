extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func update(_delta):
	var character = self._actor

	if character.will_push():
		return self.change_state("PUSHING")

	if character.will_jump():
		return self.change_state("JUMPING")

	if character.will_spin():
		return self.change_state("SPINNING")

	if character.is_idling():
		return self.change_state("IDLE")

	if abs(character.velocity.x) > 300:
		return self.change_state("RUNNING")
