extends KinematicBody2D

const SPEED = 50000
const JUMP_SPEED = 1000

onready var sprite: AnimatedSprite = $sprite
onready var hurtbox: Area2D = $hurtbox
onready var state_machine: StateMachine

var velocity: Vector2 = Vector2.ZERO
var behavior_instance = preload("behaviors.gd").new()


func _ready():
	var states_path = "res://actors/character/states/"
	self.state_machine = StateMachine.new()
	self.state_machine.setup(
		self,
		"IDLE",
		{
			"CROUCHING": load(states_path + "CROUCHING.gd").new(),
			"DEAD": load(states_path + "DEAD.gd").new(),
			"HURT": load(states_path + "HURT.gd").new(),
			"IDLE": load(states_path + "IDLE.gd").new(),
			"JUMPING": load(states_path + "JUMPING.gd").new(),
			"RUNNING": load(states_path + "RUNNING.gd").new(),
			"SPINNING": load(states_path + "SPINNING.gd").new(),
			"WALKING": load(states_path + "WALKING.gd").new()
		}
	)
	self.hurtbox.connect("area_entered", self, "_on_hurt")


func is_still_walking() -> bool:
	return abs(self.velocity.x) > 0


func is_idling() -> bool:
	var is_not_walking = velocity.x < 1

	return is_on_floor() and is_not_walking


func is_falling() -> bool:
	var is_falling = velocity.y > 0

	return is_falling


func can_walk() -> bool:
	var right_pressed = Input.is_action_pressed("ui_right")
	var left_pressed = Input.is_action_pressed("ui_left")
	var is_side_pressed = right_pressed or left_pressed

	return is_side_pressed


func can_jump() -> bool:
	var is_jump_pressed = Input.is_action_just_pressed("ui_up")

	return is_jump_pressed


func can_crouch() -> bool:
	var is_crouch_pressed = Input.is_action_pressed("ui_down")

	return is_crouch_pressed


func can_spin() -> bool:
	var is_character_moving = abs(self.velocity.x) > 1

	return is_character_moving


func _on_hurt(_area_entered: Area2D):
	pass
