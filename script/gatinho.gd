extends Area2D

var aleatorio : int

func _ready() -> void:
	pass

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
	
