extends Node
class_name State

export (Array, NodePath) var _behaviors := []

onready var _state_machine: StateMachine = self.get_parent()
onready var _actor = owner


func _ready() -> void:
	yield(_actor, "ready")


func change_state(state_name, options):
	self._state_machine.change_state(state_name, options)


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func enter(_options: Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass
