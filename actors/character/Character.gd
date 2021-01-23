extends KinematicBody2D

class_name Character

const SPEED = 20000
const JUMP_SPEED = 500

onready var sprite: AnimatedSprite = $sprite
onready var hurtbox: Area2D = $hurtbox
onready var state_machine := $state_machine

var velocity: Vector2 = Vector2.ZERO
var _behavior_instance = preload("Behaviors.gd").new()
var damage_counter: int = 0


func _ready():
	self.hurtbox.connect("area_entered", self, "_on_hurt")  # ignore this warning


func is_still_walking() -> bool:
	return abs(self.velocity.x) > 1


func is_idling() -> bool:
	var is_not_walking = abs(self.velocity.x) < 1

	return is_on_floor() and is_not_walking


func is_falling() -> bool:
	var is_falling = self.velocity.y > 0

	return is_falling


func will_walk() -> bool:
	var right_pressed = Input.is_action_pressed("ui_right")
	var left_pressed = Input.is_action_pressed("ui_left")
	var is_side_pressed = right_pressed or left_pressed

	return is_side_pressed


func will_jump() -> bool:
	var is_jump_pressed = Input.is_action_just_pressed("ui_up")

	return is_jump_pressed


func will_crouch() -> bool:
	var is_crouch_pressed = Input.is_action_pressed("ui_down")

	return is_crouch_pressed


func will_push() -> bool:
	var right_pressed = Input.is_action_pressed("ui_right")
	var left_pressed = Input.is_action_pressed("ui_left")
	var is_side_pressed = right_pressed or left_pressed
	var is_pushing = self.is_on_wall() and is_side_pressed

	return is_pushing


func will_spin() -> bool:
	var will_spin = Input.is_action_pressed("ui_down")
	var is_character_moving = abs(self.velocity.x) > 1

	return is_character_moving and will_spin


func will_skid() -> bool:
	var horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	var is_direction_pressed = horizontal_direction != 0
	var is_inverse_direction_pressed = (
		horizontal_direction
		!= sign(self.velocity.x)
	)

	return is_direction_pressed and is_inverse_direction_pressed


func _on_hurt(_area_entered: Area2D):
	if not self.state_machine.is_state("HURT"):
		self.state_machine.change_state("HURT")
