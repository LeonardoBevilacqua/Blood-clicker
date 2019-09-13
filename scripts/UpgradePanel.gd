extends Node

signal update_counter_per_second

var upgradeButton = preload("res://scenes/components/UpgradeButton.tscn")

func _ready():
	for i in range(5):
		var bt = upgradeButton.instance()
		
		bt.init(str("teste ", i), i)
		bt.connect("button_click", self, "buttonClick")
		
		$Control/MarginContainer/VBoxContainer.add_child(bt)

func buttonClick(value):
	emit_signal("update_counter_per_second", value)
