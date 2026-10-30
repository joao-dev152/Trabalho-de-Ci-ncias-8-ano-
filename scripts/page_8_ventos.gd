extends Node2D

@onready var fade: AnimationPlayer = $fade

var _is_turning_page := false
var _has_started

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left-up") and _has_started and !_is_turning_page:
		fade.play("fade-out")
		_is_turning_page = true
		await fade.animation_finished
		get_tree().change_scene_to_file("res://páginas/3. Cecília/page_7_pressão_atmosférica.tscn")
	
	#if event.is_action_pressed("right-down") and _has_started and !_is_turning_page:
		#fade.play("fade-out")
		#_is_turning_page = true
		#await fade.animation_finished
		#get_tree().change_scene_to_file("")


func _on_fade_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade-in":
		_has_started = true
