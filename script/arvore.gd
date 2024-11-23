extends Area2D

var encostou : bool = false
var cortou : bool = false
var vida : int = 100
var dropou : bool = false

var node_graveto = preload("res://scene/graveto.tscn")
var node_folha = preload("res://scene/folha_seca.tscn")


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	cortar()


func _on_body_entered(body: Node2D) -> void:
	encostou = true 


func _on_body_exited(body: Node2D) -> void:
	encostou = false
	
	
func cortar() -> void:
	
	if encostou and Input.is_action_just_released("click_left") and !cortou and vida > 0:
		#Tira 20 de vida da arvore
		vida -= 20
		#Inicia a animação dela cortando
		$AnimatedSprite2D.play("cortando")
		#Timer de 0.5 segundos
		await get_tree().create_timer(0.5).timeout
		#Para a animação
		$AnimatedSprite2D.stop()
		#deixa a animação no 0, que parece ela parada 
		$AnimatedSprite2D.frame = 0
	
		#Verifica se a vida é zero
		if vida == 0:
			$AnimatedSprite2D.play("cortada")
			cortou = true
			#Volta a vida dela a 100 para esse if nao ficar em loop 
			vida = 100
		if cortou:
			drop()
			await get_tree().create_timer(5.0).timeout
			$AnimatedSprite2D.play("normal")
			cortou = false
			dropou = false
			


#Função para dropar as folhas e galhos
func drop() -> void:
	if !dropou:
		print("oi")
		#dropa o graveto apos cortar
		var instance_graveto = node_graveto.instantiate()
		instance_graveto.position = $drop_graveto.position
		add_child(instance_graveto)
		
		#dropa a folha apos cortar
		var instance_folha = node_folha.instantiate()
		instance_folha.position = $drop_folha.position
		add_child(instance_folha)
		dropou = true
	
