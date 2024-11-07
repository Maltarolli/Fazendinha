extends Node2D

var node = preload("res://scene/milho.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	plantar()

func plantar() -> void:
	if Input.is_action_just_released("space") and Dados.sementes >= 1:
		Dados.sementes -= 1
		var instance = node.instantiate()
		instance.position = get_global_mouse_position()
		add_child(instance)
