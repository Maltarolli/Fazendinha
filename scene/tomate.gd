extends Area2D


func _ready() -> void:
	hide()
	
	

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	show()
	while $AnimatedSprite2D.frame != 5:
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame += 1
