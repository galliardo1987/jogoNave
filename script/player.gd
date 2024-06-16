extends Area2D
const SPEED := 400
signal hit
@onready var screen_size = get_viewport_rect().size
@onready var collision = $collision

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("esquerda","direita","cima","baixo")
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
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
