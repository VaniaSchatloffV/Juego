extends RigidBody2D

@export var Velocidad_min : int
@export var Velocidad_max : int
var malo = ["virus", "virusrojo"]

func _ready():
	$AnimatedSprite2D.animation = malo[randi() % malo.size()]
	
	if $AnimatedSprite2D.animation == "virus":
		$CollisionShape2D.scale.x == 1
		$CollisionShape2D.scale.y == 1


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.
