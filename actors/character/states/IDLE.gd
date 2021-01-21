extends CharacterState


func _init() -> void:
	self.behaviors = ["fall_behavior"]


func enter(_options: Dictionary = {}) -> void:
	var character = self._actor  # as Character #XXX: GDScript bug 😡

	if character.is_still_walking():
		return self.change_state("WALKING")

	character.velocity.x = 0


func update(_delta: float) -> void:
	var character = self._actor  # as Character #XXX: GDScript bug 😡

	if character.can_walk():  #TODO: change verb to "will_walk"
		return self.change_state("WALKING")

	if character.can_jump():  #TODO: change verb to "will_jump"
		return self.change_state("JUMPING")

	if character.can_crouch():  #TODO: change verb to "will_crouch"
		return self.change_state("CROUCHING")
