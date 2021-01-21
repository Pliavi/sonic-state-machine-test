extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func enter(_options: Dictionary = {}):
	var character = self._actor

	character.velocity.y = -character.JUMP_SPEED


func update(_delta):
	var character = self._actor

	if character.is_on_floor():
		self.change_state("WALKING")
