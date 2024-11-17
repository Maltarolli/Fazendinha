extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.show()
	$AnimatedSprite2D/dialogo_cama/AnimationPlayer.play("escrita_cama")


func _on_body_exited(body: Node2D) -> void:
	$AnimatedSprite2D.hide()
