extends CharacterState


func _init():
	self.behaviors = ["fall_behavior", "walk_behavior"]


func enter(_options: Dictionary):
	var character = self.target

	character.velocity.y = -character.JUMP_SPEED


func update(_delta):
	var character = self.target

	if character.is_falling():
		self.change_state("IDLE")
