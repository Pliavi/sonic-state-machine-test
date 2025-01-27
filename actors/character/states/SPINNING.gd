extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func update(_delta):
	var character = self._actor

	if character.is_idling():
		self.change_state("IDLE")
		return

	if character.will_jump():
		self.change_state("JUMPING")
		return
