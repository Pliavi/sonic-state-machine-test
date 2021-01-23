extends Node
class_name State

export (Array, NodePath) var _behaviors := []

onready var _state_machine = self.get_parent()
onready var _actor = owner


func _init():
	set_process_input(false)
	set_process(false)
	set_physics_process(false)


func _ready() -> void:
	yield(_actor, "ready")

func is_state(state_name:String):
	return self.name == state_name


func change_state(state_name, options = {}):
	self._state_machine.change_state(state_name, options)


func _enter(options: Dictionary = {}) -> void:
	""" This is the parent _enter, for specific states classes, like CharacterState """
	self.enter(options)
	

func _update(delta: float) -> void:
	""" This is the parent update, for specific states classes, like CharacterState """
	self.update(delta)


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func enter(_options: Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass
