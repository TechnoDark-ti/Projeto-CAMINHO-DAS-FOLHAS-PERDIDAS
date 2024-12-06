extends Node2D

var turn_order = []
var current_turn = 0

func start_battle(entities):
	turn_order = entities
	current_turn = 0
	process_turn()

func process_turn():
	var entity = turn_order[current_turn]
	if entity.is_player:
		show_player_options()
	else:
		enemy_action(entity)

func next_turn():
	current_turn = (current_turn + 1) % turn_order.size()
	process_turn()

func show_player_options():
	# Mostrar opções de ataque/defesa
	pass

func enemy_action(enemy):
	# Implementar lógica de IA do inimigo
	pass
