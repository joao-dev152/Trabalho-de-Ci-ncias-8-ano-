extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var has_started_slides := false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and !has_started_slides:
		animation_player.play("fade-in")
		has_started_slides = true
