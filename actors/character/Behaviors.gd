func walk_behavior(delta, target):
	var horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	var target_speed = target.SPEED * horizontal_direction * delta
	var is_walk_pressed = abs(horizontal_direction)
	var speed_decreasing_constant = 0.2 if is_walk_pressed else 0.1

	if horizontal_direction != 0:
		target.global_scale.x = horizontal_direction

	target.velocity.x = lerp(
		target.velocity.x, target_speed, speed_decreasing_constant
	)


func fall_behavior(delta: float, target: KinematicBody2D):
	target.velocity.y += Globals.GRAVITY * delta
	target.velocity.y = clamp(
		target.velocity.y, -Globals.GRAVITY, Globals.GRAVITY
	)
