extends KinematicBody2D

class_name Character

const SPEED = 20000
const JUMP_SPEED = 500

onready var sprite: AnimatedSprite = $sprite
onready var hurtbox: Area2D = $hurtbox
onready var state_machine := $state_machine

var velocity: Vector2 = Vector2.ZERO
var _behavior_instance = preload("Behaviors.gd").new()


func _ready():
	self.hurtbox.connect("area_entered", self, "_on_hurt")


func is_still_walking() -> bool:
	return abs(self.velocity.x) > 1


func is_idling() -> bool:
	var is_not_walking = abs(self.velocity.x) < 1

	return is_on_floor() and is_not_walking


func is_falling() -> bool:
	var is_falling = self.velocity.y > 0

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
	var will_spin = Input.is_action_pressed("ui_down")
	var is_character_moving = abs(self.velocity.x) > 1

	return is_character_moving and will_spin


func _on_hurt(_area_entered: Area2D):
	pass
