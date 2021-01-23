extends CharacterState


func _init():
	self.behaviors = ["fall_behavior"]


func enter(_options = {}):
	var character = self._actor
	character.get_node("collision").set_deferred("disabled", true)
	character.get_node("hurtbox/collision").set_deferred("disabled", true)
	character.set_deferred("velocity", Vector2(0, -400))