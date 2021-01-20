extends CharacterState


func _init():
	self.behaviors = ["fall_behavior"]


func update(_delta):
	var character = self.target

	if character.is_still_walking():
		return self.change_state("WALKING")

	if character.can_walk():
		return self.change_state("WALKING")

	if character.can_jump():
		return self.change_state("JUMPING")

	if character.can_crouch():
		return self.change_state("CROUCHING")
