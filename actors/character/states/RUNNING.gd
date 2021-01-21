extends "res://actors/character/states/WALKING.gd"


func update(delta):
	.update(delta)
	var character = self._actor

	if abs(character.velocity.x) < 200:
		self.change_state("WALKING")
