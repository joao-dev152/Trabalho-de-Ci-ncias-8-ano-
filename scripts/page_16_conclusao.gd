extends Node2D

@onready var fade: AnimationPlayer = $fade
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var _is_turning_page := false
var _has_started
var _has_finished := false


func _ready() -> void:
	fade.animation_finished.connect(_on_fade_animation_finished)


func _input(event: InputEvent) -> void:
	if _has_finished:
		return
	
	if event.is_action_pressed("left-up") and _has_started and !_is_turning_page:
		fade.play("fade-out")
		_is_turning_page = true
		await fade.animation_finished
		get_tree().change_scene_to_file("res://páginas/8. João Guilherme/page_15_populacoes_vulneraveis.tscn")
	
	if event.is_action_pressed("right-down") and _has_started and !_is_turning_page:
		_has_finished = true
		animation_player.play("fim")
		await animation_player.animation_finished
		await get_tree().create_timer(10.0).timeout
		get_tree().change_scene_to_file("res://páginas/credits.tscn")


func _on_fade_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade-in":
		_has_started = true
