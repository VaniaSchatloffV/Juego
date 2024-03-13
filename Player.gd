extends Area2D

@export var Velocidad : int
var movimiento = Vector2()
var limite
signal golpe


#< >
#Esto es un comentario :D
func _ready():
	#hide()
	limite = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movimiento = Vector2() #reinicia el valor, evita que nuestro personaje se escape
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1 
	if Input.is_action_pressed("ui_left"):	
		movimiento.x -= 1 
	if Input.is_action_pressed("ui_down"):
		movimiento.y += 1 
	if Input.is_action_pressed("ui_up"):	
		movimiento.y -= 1 
	if movimiento.length() > 0:
		movimiento = movimiento.normalized() * Velocidad # se normaliza la velocidad por diagonales
		
	position += movimiento * delta #Update movement
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	
	if movimiento.x != 0:
		$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_h = movimiento.x < 0
	elif movimiento.y != 0:
		$AnimatedSprite2D.animation = "jump"
		#$AnimatedSprite2D.flip_v = movimiento.y < 0
	else:
		$AnimatedSprite2D.animation = "idle"


func _on_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
	
	
	
	
