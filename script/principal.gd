extends Node2D

var node_racao = preload("res://scene/racao_galinha.tscn")
var node_ovo = preload("res://scene/ovo.tscn")
var node_area_plantar = preload("res://scene/area_plantar.tscn")


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	racao()
	area_de_plantar()


#Area de plantar
func area_de_plantar() -> void:
	if Input.is_action_just_released("arar"):
		var instance = node_area_plantar.instantiate()
		instance.position = $Player.position
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
