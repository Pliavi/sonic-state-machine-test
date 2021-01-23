extends "res://actors/character/states/WALKING.gd"


func update(delta):
	var character = self._actor as Character

	if abs(character.velocity.x) < 150:
		self.change_state("WALKING")
		return

	if character.will_skid():
		return self.change_state("SKIDDING")

	.update(delta)
