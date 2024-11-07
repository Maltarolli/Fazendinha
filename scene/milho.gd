extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = 0
	crescer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func crescer() -> void:
	while $AnimatedSprite2D.frame !=5:
		await get_tree().create_timer(5.0).timeout
		$AnimatedSprite2D.frame += 1
