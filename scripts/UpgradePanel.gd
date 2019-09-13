extends Node

signal update_counter_per_second

var upgradeButton = preload("res://scenes/components/UpgradeButton.tscn")
var _counter = 0

func _ready():
	for i in range(5):
		var bt = upgradeButton.instance()
		
		bt.init(str("teste ", i+1), i+1, i+1)
		bt.connect("button_click", self, "_button_click")
		
		$Control/MarginContainer/VBoxContainer.add_child(bt)

func _button_click(button):
	if (int(_counter) < button._price):
		print("sem creditos")
	else:
		emit_signal("update_counter_per_second", button._price, button._value)
		button.queue_free()
	
func set_counter(counter):
	self._counter = counter
