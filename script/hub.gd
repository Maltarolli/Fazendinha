extends CanvasLayer

var tempo
var horas
var minutos
var segundos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$sementes_tomate.text = str("Sementes: ", Dados.sementes)
	$tomates.text = str("Tomates: ", Dados.tomates)
	$Hora.text = str(obter_hora())
	print()
	
func obter_hora() -> String:
	tempo = Time.get_datetime_dict_from_system()
	horas = "%02d"%tempo.hour
	minutos = "%02d"%tempo.minute
	segundos = "%02d"%tempo.second
	
	return str(horas, ":", minutos, ":", segundos)
