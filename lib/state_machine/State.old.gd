extends Node

class_name StateOLD

var state_machine
var target
var behaviors = []
var behavior_instance


func _init():
	self.set_physics_process(false)
	self.set_process_unhandled_input(false)
	self.state_machine = self.get_parent()
	self.target = self.state_machine.target

func __physics_process(delta):
	self._behavior_process(self.target, delta)

	self._physics_process(delta)

	var character = self.target
	character.velocity = character.move_and_slide(
		character.velocity, Vector2.UP
	)


func _behavior_process(state_target, delta):
	for behavior in self.behaviors:
		behavior.call_func(state_target, delta)


func _physics_process(_delta):
	pass


func _enter(_options: Dictionary):
	pass


func _exit():
	pass


func transit_to(state_name: String, options: Dictionary = {}):
	print(state_name)
	self.state_machine.transition(state_name, options)
