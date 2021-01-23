extends CharacterState


func _init():
	self.behaviors = ["fall_behavior"]


func enter(_options = {}):
	var character = self._actor
	if character.damage_counter == 1:
		self.change_state("DEAD")
	character.damage_counter += 1
	var back_direction = sign(character.velocity.x)
	if back_direction == 0:
		back_direction = -1

	character.velocity.y = -300
	character.velocity.x = 80 * back_direction * -1


func update(_delta):
	var character = self._actor

	if character.velocity.y > 0 and character.is_on_floor():
		self.change_state("IDLE")
