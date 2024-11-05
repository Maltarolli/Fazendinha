extends Area2D

var encostou : bool = false

func _ready() -> void:
	hide()
	
	

func _process(delta: float) -> void:
	$"../../hub/sementes_tomate".text = str("sementes: ", Dados.sementes)

#Verifica se o player encostou na semente
func _on_body_entered(body: Node2D) -> void:
	encostou = true
	while encostou:
		await  get_tree().create_timer(0.01).timeout
		print("Parte 1")
		if Dados.sementes >= 1 and Input.is_action_pressed("1"): 
			print("clicou")
			show()
			Dados.sementes -= 1
			while $AnimatedSprite2D.frame != 5:
				await get_tree().create_timer(3.0).timeout
				$AnimatedSprite2D.frame += 1


func _on_body_exited(body: Node2D) -> void:
	encostou = false
