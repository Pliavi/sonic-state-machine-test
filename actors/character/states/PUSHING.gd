extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func update(_delta):
	var character = self._actor as Character

	if character.will_jump():
		self.change_state("JUMPING")
		return

	if character.will_crouch():
		self.change_state("CROUCHING")
		return

	if character.is_idling():
		self.change_state("IDLE")
		return

	if abs(character.velocity.x) > 300:
		self.change_state("RUNNING")
		return
