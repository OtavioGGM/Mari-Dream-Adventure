extends Control


#Aqui ele fala dos grupos, para lá na frente falar de "se o mouse
#passar por cima, ficar meio transparente...
func _ready() -> void:
	for button in get_tree().get_nodes_in_group("button"):
		button.connect("pressed", self, "on_button_pressed", [button])
		button.connect("mouse_exited", self, "mouse_interaction", [button, "exited"])
		button.connect("mouse_entered", self, "mouse_interaction", [button, "entered"])


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		var newPauseState = not get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState


func _on_VoltarJogo_pressed():
	var newPauseState = not get_tree().paused
	get_tree().paused = newPauseState
	visible = newPauseState


func _on_VoltarMenu_pressed():
	$Sprite/AnimationPlayer.play("Fecha")
	yield(get_tree().create_timer(2.2),"timeout")
	var _game: bool = get_tree().change_scene("res://TSCN/MenuInicial.tscn")
	
#Aqui a interação do mouse
func mouse_interaction (button: Button, state: String) -> void:
	match state:
		"exited":
			button.modulate.a = 1.0
		"entered":
			button.modulate.a = 0.5

