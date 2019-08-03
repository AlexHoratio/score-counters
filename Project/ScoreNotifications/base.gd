extends Node2D

signal disappear

func _ready():
	pass
	
func _process(delta):
	modulate.a -= delta*2
	if(modulate.a <= 0):
		emit_signal("disappear")
	
func set_score(value: int) -> void:
	$Label.text = "+" + str(value)
	modulate.a = 1
	
func get_score() -> int:
	return int($Label.text.right(1))