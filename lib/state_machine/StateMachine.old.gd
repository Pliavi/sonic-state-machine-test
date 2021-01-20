extends Node
class_name StateMachineOLD

var target
var states: Dictionary
var actual_state: State

signal setup_finished()


func setup(my_target, my_initial_state_name, my_states: Dictionary):
	self.target = my_target

	for state_name in my_states:
		var state = my_states.get(state_name)
		self.states[state_name] = state.setup(self)

	self._change_state(my_initial_state_name)
	(self.target as Node).add_child(self)
	emit_signal("setup_finished")


func _physics_process(delta):
	if(!self.actual_state):
		yield(self, "setup_finished")
	self.actual_state._physics_process(delta)


func _change_state(state_name, options: Dictionary = {}):
	if self.actual_state:
		self.actual_state.exit()
	self.actual_state = states.get(state_name)
	play_animation(state_name)
	self.actual_state.enter(options)


func _unhandled_input(event):
	if(!self.actual_state):
		yield(self, "setup_finished")
	self.actual_state.handle_input(event)


func play_animation(state_name: String):
	var sprite: AnimatedSprite = self.target.sprite
	print(self.target.sprite)
	var animation_states = sprite.frames.get_animation_names()

	if state_name in animation_states:
		sprite.play(state_name)
