extends Area2D

var inventario_aberto : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".hide()
	
	
func _process(delta: float) -> void:
	$dinheiro.text = str("R$ ", Dados.dinheiro)
	
	#Exibir vegetais
	exibir_item(Dados.tomates + Dados.milho, $item_vegetais)
	$item_vegetais/Label_quant_vegetais.text = str(Dados.tomates + Dados.milho)
	
	#Exibir sementes
	exibir_item(Dados.sementes, $item_sementes)
	$item_sementes/Label_quant_sementes.text = str(Dados.sementes)
	
	#Exibir ovos
	exibir_item(Dados.ovo, $item_ovo)
	$item_ovo/Label_quant_ovo.text = str(Dados.ovo)
	
	#Exibir folhas secas
	exibir_item(Dados.folha, $item_folha)
	$item_folha/Label_quant_folha.text = str(Dados.folha)
	
	#Exibir gravetos
	exibir_item(Dados.graveto, $item_graveto)
	$item_graveto/Label_quant_graveto.text = str(Dados.graveto)


#Função de input, caso aperte i e o invetario esteja fechado ele abre e o inverso acontece
func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("i") and inventario_aberto == false:
		$".".show()
		inventario_aberto = true
	elif Input.is_action_just_released("i") and inventario_aberto:
		$".".hide()
		inventario_aberto = false


#função para quando se tem um item ele seja exibido, tanto a sprite tanto a informação, e caso nao tenha
#ele sera escondido 
func exibir_item(item, sprite) -> void:
	if item >= 1:
		sprite.show()
	else: 
		sprite.hide()
