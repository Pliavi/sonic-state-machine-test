extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func update(_delta):
	var character = self._actor

	if character.will_jump():  # TODO: Change to "will_jump"
		return self.change_state("JUMPING")

	if character.will_crouch():  # TODO: Change to "will_spin"
		return self.change_state("CROUCHING")

	if character.is_idling():
		return self.change_state("IDLE")

	if abs(character.velocity.x) > 300:
		return self.change_state("RUNNING")
