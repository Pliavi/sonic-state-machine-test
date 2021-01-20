extends State

class_name CharacterState

func _physics_process(delta):
	._physics_process(delta)
	
	var character = self.target
	character.velocity = character.move_and_slide(
		character.velocity, Vector2.UP
	)
