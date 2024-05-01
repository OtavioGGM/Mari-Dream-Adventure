extends Area2D

func _on_ProximaFase_body_entered(hero):
	print(hero.name)
	
	if hero.name == "Mari":
		
		$CanvasLayer/Sprite/AnimationPlayer.play("Fecha")
		
		yield(get_tree().create_timer(1.9),"timeout")
		
		IrParaProximaFase.current_level +=1
		get_tree().change_scene("res://TSCN/levels/level0" + str(IrParaProximaFase.current_level) + ".tscn")
		
		#RODAR ANIMAÇÃO "ABRE"
		
		$CanvasLayer/Sprite/AnimationPlayer.play("Abre")
		
		print(get_tree().get_current_scene())



