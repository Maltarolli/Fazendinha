extends Area2D

var encostou : bool = false
var tem_planta : bool = false

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	$"../../hub/sementes_tomate".text = str("sementes: ", Dados.sementes, " tomates: ", Dados.tomates)
	if Dados.sementes >= 1 and encostou and Input.is_action_pressed("space") and tem_planta == false: 
		tem_planta = true
		show()
		Dados.sementes -= 1
		while $AnimatedSprite2D.frame != 5:
			await get_tree().create_timer(3.0).timeout
			$AnimatedSprite2D.frame += 1
	cresceu()


#Verifica se o player encostou na semente.
func _on_body_entered(body: Node2D) -> void:
	encostou = true

#Verifica se o player desencostou da semente.
func _on_body_exited(body: Node2D) -> void:
	encostou = false

func cresceu() -> void:
	if $AnimatedSprite2D.frame == 5 and encostou and Input.is_action_pressed("space") and tem_planta:
		Dados.tomates += 1
		hide()
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(0.5).timeout
		tem_planta = false
		
