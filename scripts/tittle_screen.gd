extends Node2D


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") or event.is_action_pressed("right_click"):
		print("funciona o input. ok")
