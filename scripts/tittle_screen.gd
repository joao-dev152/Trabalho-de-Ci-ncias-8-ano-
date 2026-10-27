extends Node2D

@onready var default_animation_player: AnimationPlayer = $"default-anim"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var has_started_slides := false

var is_turning_page := false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and !has_started_slides:
		default_animation_player.play("fade-in")
		has_started_slides = true
	
	if event.is_action_pressed("right-down") and !is_turning_page:
		animation_player.play("fade-out")
		is_turning_page = true
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://páginas/1. Alana/page_1_previsao_do_tempo.tscn")
