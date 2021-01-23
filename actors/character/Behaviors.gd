func walk_behavior(delta, state: State):
	var character = state._actor
	var horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	var target_speed = character.SPEED * horizontal_direction * delta
	var is_walk_pressed = abs(horizontal_direction)
	var speed_changing_constant = 0.2

	if is_walk_pressed and state.is_state("WALKING"):
		speed_changing_constant = 0.05

	if state.is_state("JUMPING"):
		speed_changing_constant = 0.05

	if state.is_state("SPINNING"):
		target_speed = 0  # character can't speedup while spinning
		speed_changing_constant = 0.01
		if character.will_skid():
			speed_changing_constant = 0.2

	if horizontal_direction != 0: # Change character direction
		character.scale.x = horizontal_direction * sign(character.scale.y)  # https://github.com/godotengine/godot/issues/12335

	character.velocity.x = lerp(
		character.velocity.x, target_speed, speed_changing_constant
	)


func fall_behavior(delta: float, state: State):
	var character = state._actor as KinematicBody2D

	character.velocity.y += Globals.GRAVITY * delta
	character.velocity.y = clamp(
		character.velocity.y, -Globals.GRAVITY, Globals.GRAVITY
	)
