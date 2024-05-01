extends Area2D

func _on_FallZone_body_entered(Hero):
	print(Hero.name)
	
	if Hero.name == "Mari":
		get_tree().reload_current_scene()

