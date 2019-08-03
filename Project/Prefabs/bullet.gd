extends Area2D
class_name Bullet

var movement_vector = Vector2(1, 0)
var SPEED = 1000

func _ready():
	rotation = movement_vector.angle()

func _process(delta):
	position += movement_vector*SPEED*delta

func _on_bullet_body_entered(body):
	if body in get_tree().get_nodes_in_group("enemies") :
		body.damage()
		
	if not(body == get_node("../player")) :
		
		var poof = load("res://Prefabs/poof.tscn").instance()
		poof.rotation = movement_vector.angle()
		poof.position = position
		poof.get_node("Particles2D").emitting = true
		get_node("..").add_child(poof)
		
		queue_free()
