extends CharacterBody2D

var velocidade_player : float = 125.00
var direcao_player : Vector2 = Vector2(0, 0)

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	movimentacao()


func movimentacao() -> void: 
	if Input.is_action_pressed("mv_right"):
		direcao_player.x = 1
		$AnimatedSprite2D.play("direita")
	elif Input.is_action_pressed("mv_left"):
		direcao_player.x = -1
		$AnimatedSprite2D.play("esquerda")
	else:
		direcao_player.x = 0
	if Input.is_action_pressed("mv_up"):
		direcao_player.y = -1
	elif Input.is_action_pressed("mv_down"):
		direcao_player.y = 1
	else:
		direcao_player.y = 0
		
	if direcao_player.x == 0 and direcao_player.y == 0:
		$AnimatedSprite2D.play("idle")
		
		
	velocity = direcao_player.normalized() * velocidade_player
	move_and_slide()
