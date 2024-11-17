extends Node2D

var node = preload("res://scene/milho.tscn")
var node_racao = preload("res://scene/racao_galinha.tscn")
var node_ovo = preload("res://scene/ovo.tscn")


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	plantar()
	racao()


# planta milho
func plantar() -> void:
	if Input.is_action_just_released("click_left") and Dados.sementes >= 1:
		var instance = node.instantiate()
		instance.position = get_global_mouse_position()
		add_child(instance)
		
		
#coloca ração
func racao() -> void: 
	if Input.is_action_just_released("space"):
		var instance = node_racao.instantiate()
		instance.position = $Player.position
		add_child(instance)
		await get_tree().create_timer(5.0).timeout
		instance.queue_free()
		ovo()
		
		
#colocar ovo depois de comer a ração
func ovo() -> void:
	var instance = node_ovo.instantiate()
	instance.position = $galinha.position
	add_child(instance)
