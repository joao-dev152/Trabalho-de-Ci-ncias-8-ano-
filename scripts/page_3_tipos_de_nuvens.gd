extends Node2D

@onready var fade: AnimationPlayer = $fade

var _is_turning_page := false
var _has_started

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	_has_started = true


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left-up") and _has_started and !_is_turning_page:
		fade.play("fade-out")
		_is_turning_page = true
		await fade.animation_finished
		get_tree().change_scene_to_file("res://páginas/2. Anna Luiza/page_2_temperatura_e_nebulosidade.tscn")
	
	if event.is_action_pressed("right-down") and _has_started and !_is_turning_page:
		fade.play("fade-out")
		_is_turning_page = true
		await fade.animation_finished
		get_tree().change_scene_to_file("res://páginas/2. Anna Luiza/page_4_experimento.tscn")
