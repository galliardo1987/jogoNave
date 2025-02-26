extends Area2D

signal hit
const SPEED := 400
@onready var screen_size = get_viewport_rect().size
@onready var anim = $anim
@onready var collision = $collision

func _ready():
	hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("esquerda","direita","cima","baixo")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	if velocity.x != 0:
		anim.play("idle")
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body):
	hide()
	hit.emit()
	collision.set_deferred("disabled", true)

func start_pos(pos):
	position = pos
	show()
	collision.disabled = false
