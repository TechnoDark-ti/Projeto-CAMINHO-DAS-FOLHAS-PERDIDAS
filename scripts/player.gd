extends CharacterBody2D

"""
##### SESSÃO DE COMENTÁRIOS #####
@Author: Márcio Moda, Grazi Leão, João Manoel e Edy Carlos

"""

#Definindo algumas variáveis de Física
@export_category("Variables")
@export var _move_speed: float = 64.0
@export var _friction: float = 0.2
@export var _acceleration: float = 0.2

@onready var animation: AnimationPlayer = get_node("Animation")
@onready var sprite: Sprite2D = get_node("Sprite")
#Função principal
func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()
	animate()
	
#Função de movimentação	
func _move():
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	if _direction !=  Vector2.ZERO:
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return	

	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.x = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
	
	velocity = _direction.normalized() * _move_speed

func animate() -> void:
	if velocity != Vector2.ZERO:
		if abs(velocity.x) > abs(velocity.y):
			# Movimento horizontal
			if velocity.x > 0:
				animation.play("correr_direita")
				#sprite.flip_h = false #Não mexer
			else:
				animation.play("correr_esquerda")
				#sprite.flip_h = true #Não mexer
		else:
			# Movimento vertical
			if velocity.y > 0:
				animation.play("correr_frente")
			else:
				animation.play("correr_costa")
	else:
		# Quando o personagem está parado
		animation.play("parado_frente")
