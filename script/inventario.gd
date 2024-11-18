extends Area2D

var inventario_aberto : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$dinheiro.text = str("R$ ", Dados.dinheiro)
	$item_vegetais/Label_quant_vegetais.text = str(Dados.tomates + Dados.milho)
	$item_sementes/Label_quant_sementes.text = str(Dados.sementes)
	$item_ovo/Label_quant_ovo.text = str(Dados.ovo)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("i") and inventario_aberto == false:
		$".".show()
		inventario_aberto = true
	elif Input.is_action_just_released("i") and inventario_aberto:
		$".".hide()
		inventario_aberto = false
