extends AnimationPlayer

var dia : bool = true

var tempo_animacao : float = 60.0


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	dia_noite()
	

func dia_noite() -> void:
	if dia:
		$".".play("noite")
		#Espera o mesmo tempo da animacao para nao bugar
		await get_tree().create_timer(tempo_animacao).timeout
		dia = false
	else: 
		$".".play("dia")
		#Espera o mesmo tempo da animacao para nao bugar
		await get_tree().create_timer(tempo_animacao).timeout
		dia = true
