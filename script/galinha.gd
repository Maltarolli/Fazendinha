extends Area2D

var encostou : bool
var node = preload("res://scene/racao_galinha.tscn")

func _ready() -> void:
	await get_tree().create_timer(5.0).timeout
	$AnimationPlayer.play("andando_baixo")
	$AnimatedSprite2D.play("andando_baixo")
	await get_tree().create_timer(5.0).timeout
	$AnimatedSprite2D.play("parada_baixo")
	


func _process(delta: float) -> void:
	pass


		


func _on_body_entered(body: Node2D) -> void:
	encostou = true
