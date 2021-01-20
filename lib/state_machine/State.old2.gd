extends Node

class_name StateOL2

var state_machine
var target
var behaviors = []
var behavior_funcs = [] setget _set_behavior_funcs

func _init():
	set_process(false)
	set_process_input(false)
	set_physics_process(false)

func setup(my_state_machine):
	self.state_machine = my_state_machine
	self.target = self.state_machine.target
	_set_behavior_funcs(self.behaviors)
	
	return self


func _set_behavior_funcs(my_behaviors: PoolStringArray):
	var behavior_instance = self.target.behavior_instance

	for my_behavior in my_behaviors:
		behavior_funcs.append(funcref(behavior_instance, my_behavior))


func _behavior_process(delta):
	for behavior in self.behavior_funcs:
		behavior.call_func(delta, self.target)


func _physics_process(delta):
	self._behavior_process(delta)

	self.update(delta)

# public functions
func change_state(state_name, options={}):
	self.state_machine._change_state(state_name, options)

# custom state functions
func update(_delta):
	pass


func handle_input(_event):
	pass


func enter(_options: Dictionary):
	pass


func exit():
	pass
