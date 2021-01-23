extends State

class_name CharacterState

var behaviors: PoolStringArray = []
var _behaviors_refs: Array = []


func _ready():
	._ready()
	var behavior_instance = self._actor._behavior_instance

	for behavior_name in self.behaviors:
		var behavior_ref = funcref(behavior_instance, behavior_name)
		self._behaviors_refs.append(behavior_ref)


func _enter(options := {}):
	var sprite = self._actor.sprite as AnimatedSprite
	sprite.play(self.name)
	self.enter(options)


func _update(delta):
	var character = self._actor as Character

	for behavior in self._behaviors_refs:
		behavior.call_func(delta, self)

	self.update(delta)

	character.velocity = character.move_and_slide(
		character.velocity, Vector2.UP
	)
