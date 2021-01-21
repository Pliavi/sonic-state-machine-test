extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func update(_delta):
	var character = self._actor

	if character.can_jump(): # TODO: Change to "will_jump"
		return self.change_state("JUMPING")

	if character.can_spin(): # TODO: Change to "will_spin"
		return self.change_state("SPINNING")

	if character.is_idling():
		return self.change_state("IDLE")

