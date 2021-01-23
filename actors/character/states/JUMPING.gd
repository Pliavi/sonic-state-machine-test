extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func enter(_options := {}):
	var character = self._actor as Character

	character.velocity.y = -character.JUMP_SPEED


func update(_delta):
	var character = self._actor as Character

	if character.is_on_floor():
		self.change_state("WALKING")
