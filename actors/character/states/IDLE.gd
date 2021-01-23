extends CharacterState


func _init() -> void:
	self.behaviors = ["fall_behavior"]


func enter(_options: Dictionary = {}) -> void:
	var character = self._actor as Character

	if character.is_still_walking():
		self.change_state("WALKING")
		return

	character.velocity.x = 0


func update(_delta: float) -> void:
	var character = self._actor as Character

	if character.will_walk():
		self.change_state("WALKING")
		return

	if character.will_jump():
		self.change_state("JUMPING")
		return

	if character.will_crouch():
		self.change_state("CROUCHING")
		return
