extends CharacterState


func enter(_options := {}):
	var character = self._actor as Character
	character.sprite.flip_h = true


func exit(_options := {}):
	var character = self._actor as Character
	character.sprite.flip_h = false


func update(_delta):
	var character = self._actor as Character

	if character.will_jump():
		self.change_state("IDLE")
		return

	if abs(character.velocity.x) < 1:
		self.change_state("IDLE")
		return

	character.velocity.x = lerp(character.velocity.x, 0, 0.3)
