extends Area2D

var pode_colher : bool = false
var mouse_milho : bool = false
var encostou : bool = false


func _ready() -> void:
	$AnimatedSprite2D.frame = 0
	crescer()
	Dados.sementes -= 1


func _process(delta: float) -> void:
	colher()


func crescer() -> void:
	while $AnimatedSprite2D.frame !=5:
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.frame += 1
		
func colher() -> void:
	if $AnimatedSprite2D.frame == 5:
		pode_colher = true
	if pode_colher and encostou and Input.is_action_just_released("click_left"):
		Dados.milho += 1
		queue_free()


func _on_mouse_entered() -> void:
	mouse_milho = true


func _on_body_entered(body: Node2D) -> void:
	encostou = true


func _on_body_exited(body: Node2D) -> void:
	encostou = false
