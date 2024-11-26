extends Area2D

var node = preload("res://scene/milho.tscn")
var area_plantar : bool = false
var ja_plantou : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	plantar()


# planta milho
func plantar() -> void:
	if Input.is_action_just_released("click_left") and Dados.sementes >= 1 and area_plantar and ja_plantou == false:
		var instance = node.instantiate()
		instance.position = $ColorRect.position
		add_child(instance)
		ja_plantou = true
		
	if ja_plantou == true:
		await get_tree().create_timer(3.0).timeout
		ja_plantou = false
			


func _on_body_entered(body: Node2D) -> void:
	area_plantar = true


func _on_body_exited(body: Node2D) -> void:
	area_plantar = false
