extends Button

func _on_Start_mouse_entered():
	$Desenho.modulate.r = 0.7
	$Desenho.modulate.g = 0.7
	$Desenho.modulate.b = 0.7
	pass 

func _on_Start_mouse_exited():
	$Desenho.modulate.r = 1
	$Desenho.modulate.g = 1
	$Desenho.modulate.b = 1
	pass # Replace with function body.

func _on_Start_pressed():
	$Desenho.modulate.r = 0.5
	$Desenho.modulate.g = 0.5
	$Desenho.modulate.b = 0.5
	get_tree().change_scene("res://cenas/main.tscn") # Comando para chamr a cena principal caso precionada este botão
	pass 
