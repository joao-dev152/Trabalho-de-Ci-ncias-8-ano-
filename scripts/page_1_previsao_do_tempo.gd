extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animação_dos_texto: AnimationPlayer = $"animação dos texto"
@onready var animação_mudança_climatica: AnimationPlayer = $"animação mudança climatica"

var _has_started := false

var _is_turning_page

func _ready() -> void:
	animation_player.play("fade-in")
	await animation_player.animation_finished
	_has_started = true
	animação_dos_texto.play("apareçam palavras")
	animação_mudança_climatica.play("animem-se nuvens")

func _process(_delta: float) -> void:
	if _is_turning_page:
		animação_mudança_climatica.stop()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left-up") and _has_started:
		animation_player.play("fade-out")
		_is_turning_page = true
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://páginas/1. Alana/page_0_intro.tscn")
	
	if event.is_action_pressed("right-down") and _has_started:
		print("página seguinte: faltando")
		return
		
		animation_player.play("fade-out")
		_is_turning_page = true
		await animation_player.animation_finished
		get_tree().change_scene_to_file("")
