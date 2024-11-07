extends AnimationPlayer

var dia : bool = true

var tempo_animacao : float = 5


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	#dia_noite()
	

func dia_noite() -> void:
	if dia:
		$".".play("teste_noite")
		#Espera o mesmo tempo da animacao para nao bugar
		await get_tree().create_timer(tempo_animacao).timeout
		dia = false
		print("noite_acabou")
		
	else: 
		print("dia")
		$".".play("teste_dia")
		#Espera o mesmo tempo da animacao para nao bugar
		await get_tree().create_timer(tempo_animacao).timeout
		dia = true
		print("sia acabou")
