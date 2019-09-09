extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	counter += 999;
	$Control/Rows/LabelsColumn/Counter.text = str("Doações: ", counter);
