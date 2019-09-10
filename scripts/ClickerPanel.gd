extends Node

signal update_counter

func _on_Button_pressed():
	emit_signal("update_counter")

func updateCounterLabel(counter):
	$Control/Rows/LabelsColumn/Counter.text = str("Doações: ", counter)
