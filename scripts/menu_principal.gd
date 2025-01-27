extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

# Função chamada ao pressionar o botão "Exit"
func _on_exit_pressed() -> void:
	get_tree().quit() # Fecha o jogo

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/act01/act01_02.tscn")

func _on_controles_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/menu/controles.tscn")

func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/creditos.tscn")


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/menu/menu_main.tscn")
