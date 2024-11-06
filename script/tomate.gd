extends Area2D

var encostou : bool = false


func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	$"../../hub/sementes_tomate".text = str("sementes: ", Dados.sementes)
	if Dados.sementes >= 1 and Input.is_action_pressed("space"): 
			show()
			Dados.sementes -= 1
			while $AnimatedSprite2D.frame != 5:
				await get_tree().create_timer(3.0).timeout
				$AnimatedSprite2D.frame += 1


#Verifica se o player encostou na semente.
func _on_body_entered(body: Node2D) -> void:
	encostou = true

#Verifica se o player desencostou da semente.
func _on_body_exited(body: Node2D) -> void:
	encostou = false
