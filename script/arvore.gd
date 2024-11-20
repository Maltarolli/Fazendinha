extends Area2D

var encostou : bool = false
var node_graveto = preload("res://scene/graveto.tscn")
var node_folha = preload("res://scene/folha_seca.tscn")


func _ready() -> void:
	$AnimatedSprite2D.play("normal") 


func _process(delta: float) -> void:
	cortar()


func _on_body_entered(body: Node2D) -> void:
	encostou = true 


func _on_body_exited(body: Node2D) -> void:
	encostou = false
	
	
func cortar() -> void:
	if encostou and Input.is_action_just_released("click_left"):
		$AnimatedSprite2D.play("cortando")
		await get_tree().create_timer(5.0).timeout
		$AnimatedSprite2D.play("cortada")
		
		#dropa o graveto apos cortar
		var instance_graveto = node_graveto.instantiate()
		instance_graveto.position = $drop_graveto.position
		add_child(instance_graveto)
		
		#dropa a folha apos cortar
		var instance_folha = node_folha.instantiate()
		instance_folha.position = $drop_folha.position
		add_child(instance_folha)
		
