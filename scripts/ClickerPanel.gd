extends Node

signal update_counter

onready var labels = $Control/Rows/LabelsColumn

func _on_Button_pressed():
	emit_signal("update_counter")

func updateCounterLabel(counter):
	
	labels.get_node("Counter").text = str("Doações: ", counter)

func updateCounterPerSecondLabel(counterPerSecond):
	labels.get_node("CounterPerSecond").text = str("Doações por segundo: ", counterPerSecond)