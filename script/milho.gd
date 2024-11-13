extends Area2D

var pode_colher : bool = false
var mouse_milho : bool = false
var encostou : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = 0
	crescer()
	Dados.sementes -= 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		queue_free()


func _on_mouse_entered() -> void:
	mouse_milho = true
	print("encostou")


func _on_body_entered(body: Node2D) -> void:
	encostou = true


func _on_body_exited(body: Node2D) -> void:
	encostou = false
