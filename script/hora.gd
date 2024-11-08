extends Label

var tempo
var hora
var minuto
var segundo


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tempo = Time.get_datetime_dict_from_system()
	hora = "%02d"%tempo.hour
	minuto = "%02d"%tempo.minute
	segundo = "%02d"%tempo.second
	
	text = str(hora, ":", minuto,":", segundo)
