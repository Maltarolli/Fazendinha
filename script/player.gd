extends CharacterBody2D

var quant_sementes : int = 0
var velocidade_player : float = 125.00
var direcao_player : Vector2 = Vector2(0, 0)
var tecla_up : bool = false

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
		$AnimatedSprite2D.play("cima")
		tecla_up = true
		direcao_player.y = -1
	elif Input.is_action_pressed("mv_down"):
		$AnimatedSprite2D.play("baixo")
		direcao_player.y = 1
	else:
		direcao_player.y = 0
		
	if direcao_player.x == 0 and direcao_player.y == 0:
		$AnimatedSprite2D.play("idle")
		
		
	velocity = direcao_player.normalized() * velocidade_player
	move_and_slide()


func _on_bau_body_entered(body: Node2D) -> void:
	Dados.sementes += 1


func _on_entrada_casa_body_entered(body: Node2D) -> void:
	position = $"../teleporte_dentro_casa".position
	Dados.entrou_na_casa = true


func _on_saida_casa_body_entered(body: Node2D) -> void:
	position = $"../cenario/teleporte_fora_casa".position
	Dados.entrou_na_casa = false


func _on_cama_body_entered(body: Node2D) -> void:
	$"../dentro_casa/dialogo_cama".show()
	$"../dentro_casa/dialogo_cama/AnimationPlayer".play("escrita_cama")


func _on_cama_body_exited(body: Node2D) -> void:
	$"../dentro_casa/dialogo_cama".hide()
	
