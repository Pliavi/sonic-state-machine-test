extends Node
class_name StateMachine

export (NodePath) var initial_state: NodePath

onready var state: State = get_node(initial_state)
onready var _actor = owner


func _init() -> void:
	add_to_group("state_machine")


func _ready() -> void:
	yield(_actor, "ready")
	state._enter()


func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _physics_process(delta: float) -> void:
	state._update(delta)


func change_state(state_name: String, options: Dictionary = {}) -> void:
	print(state_name)
	var target_state := get_node(state_name)

	state.exit()
	self.state = target_state
	state._enter(options)
