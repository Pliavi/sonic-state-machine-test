extends CharacterState


func _init():
	self.behaviors = ["fall_behavior"]


func enter(_options = {}):
	var character = self._actor
	var back_direction = sign(character.velocity.x)
	if back_direction == 0:
		back_direction = -1

	character.velocity.y -= character.JUMP_SPEED
	character.velocity.x = character.SPEED * back_direction


func update(_delta):
	var character = self._actor

	if character.is_on_floor():
		self.change_state("IDLE")
