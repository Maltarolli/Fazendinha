extends Area2D

var encostado : bool = false

func _ready() -> void:
	$balao.hide()



func _process(delta: float) -> void:
	vendas()


func vendas() -> void:
	if Input.is_action_just_released("space") and encostado and Dados.milho>= 1:
		Dados.milho -=1
		Dados.dinheiro += 5


func _on_body_entered(body: Node2D) -> void:
	encostado = true
	$balao.show()


func _on_body_exited(body: Node2D) -> void:
	encostado = false
	$balao.hide()
