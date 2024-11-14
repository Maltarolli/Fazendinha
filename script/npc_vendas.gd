extends Area2D

var encostado : bool = false

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	vendas()


func vendas() -> void:
	if encostado and Dados.milho>= 1:
		encostado = false
		Dados.milho -=1
		Dados.dinheiro += 5


func _on_body_entered(body: Node2D) -> void:
	encostado = true


func _on_body_exited(body: Node2D) -> void:
	encostado = false
