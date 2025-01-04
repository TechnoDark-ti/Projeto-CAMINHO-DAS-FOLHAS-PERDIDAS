"""
##### SESSÃO DE COMENTÁRIOS #####
@Author: Márcio Moda, Grazi Leão, João Manoel e Edy Carlos

1. O que esse código faz?
Este código implementa a lógica de um menu principal que permite ao jogador selecionar uma opção (por exemplo, iniciar o jogo ou acessar uma cena específica). Quando o jogador clica em um botão, o script realiza o seguinte:

- Define qual cena será carregada com base no botão clicado.
- Exibe uma animação de fade-in antes de mudar para a cena selecionada.

##### FIM DOS CaOMENTÁRIOS #####
"""

extends Control

# Variável para armazenar o caminho da cena a ser carregada
var scene_path_to_load

func _ready():
	# Define o foco inicial no botão "Play"
	$MainContainer/HContainer/VContainer/Play.grab_focus()
	
	# Conecta os botões a ações específicas
	for button in $MainContainer/HContainer.get_children():
		# Conecta cada botão com sua respectiva ação
		match button.name:
			"Play":
				button.connect("pressed", Callable(self, "_on_Play_pressed"))
			"Configurações":
				button.connect("pressed", Callable(self, "_on_Config_pressed"))
			"Exit":
				button.connect("pressed", Callable(self, "_on_Exit_pressed"))

# Função chamada ao pressionar o botão "Play"
func _on_Play_pressed():
	scene_path_to_load = "res://cenas/act01/act01_01.tscn" # Caminho da cena de jogo
	_start_fade_in()

# Função chamada ao pressionar o botão "Configurações"
func _on_Config_pressed():
	scene_path_to_load = "res://scenes/config.tscn" # Caminho da cena de configurações
	_start_fade_in()

# Função chamada ao pressionar o botão "Exit"
func _on_Exit_pressed():
	get_tree().quit() # Fecha o jogo

# Inicia o fade-in antes de trocar de cena
func _start_fade_in():
	$FadeIn.show()
	$FadeIn.fade_in()

# Troca a cena ao terminar o fade-in
func _on_FadeIn_fade_finished():
	if scene_path_to_load: # Certifica-se de que há uma cena para carregar
		get_tree().change_scene_to_file(scene_path_to_load)
