@tool
extends Node2D

@export var emmitting := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_set_emit()


func _set_emit():
	for particle in get_children():
		if particle is GPUParticles2D:
			particle.emitting = emmitting 
