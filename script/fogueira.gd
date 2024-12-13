extends Area2D


func _ready() -> void:
	$balao.hide()
	$fogueira_acessa.hide()


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	$balao.show()
	$balao/Label.text = str("Fazer fogueira?")
	await  get_tree().create_timer(1.0).timeout
	$balao/Label.text = str("Graveto e folha")
	fogueira_acessa()


func _on_body_exited(body: Node2D) -> void:
	$balao.hide()
	

func fogueira_acessa() -> void:
	if Dados.graveto >= 1 and Dados.folha >= 1:
		Dados.graveto -= 1
		Dados.folha -= 1
		$fogueira_acessa.show()
		$fogueira_acessa.play("fogueira")
		$pedra.hide()
		$balao.hide()
		await get_tree().create_timer(5.0).timeout
		$fogueira_acessa.hide()
		$pedra.show()
