extends Node
class_name StateMachine

export (NodePath) var initial_state: NodePath

onready var state: State = get_node(initial_state)
onready var _actor: Node2D = owner
onready var _state_label: Label = $state_label


func _init() -> void:
	add_to_group("state_machine")


func _ready() -> void:
	yield(_actor, "ready")
	state._enter()


func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _physics_process(delta: float) -> void:
	state._update(delta)
	# Debug
	_state_label.rect_position = (
		(_actor as Node2D).global_position
		+ Vector2(-30, -30)
	)


func is_state(state_name: String) -> bool:
	return state.name == state_name


func change_state(state_name: String, options: Dictionary = {}) -> void:
	var target_state := get_node(state_name)
	print(state_name)
	_state_label.text = state_name

	state.exit()
	self.state = target_state
	state._enter(options)
