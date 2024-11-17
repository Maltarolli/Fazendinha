extends Area2D

var aleatorio : int

func _ready() -> void:
	$coracao.hide()

func _process(delta: float) -> void:
	animacao()


func animacao() -> void:
	if Dados.entrou_na_casa:
		aleatorio = (randi_range(1,4))
		if aleatorio == 1:
			$AnimatedSprite2D.play("idle")
		elif aleatorio ==2:
			$AnimatedSprite2D.play("bravo")
		elif aleatorio ==3:
			$AnimatedSprite2D.play("brincando")
		elif aleatorio ==4:
			$AnimatedSprite2D.play("dormindo")
		
		Dados.entrou_na_casa = false
	
	


func _on_body_entered(body: Node2D) -> void:
	$coracao.show()
	await get_tree().create_timer(5.0).timeout
	$coracao.hide()
