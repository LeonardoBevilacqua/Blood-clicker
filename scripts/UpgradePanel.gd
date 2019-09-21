extends Node

signal update_counter_per_second

var upgradeButton = preload("res://scenes/components/UpgradeButton.tscn")
var _counter = 0

var buttons = []

func _ready():
	self._generate_buttons(self._load_upgrades())

func _button_click(button):
	if (int(_counter) >= button._price):
		emit_signal("update_counter_per_second", button._price, button._value)
		button._price *= 2
		button._value *= 2
		button.set_price_text()
	
func set_counter(counter):
	self._counter = counter
	self._set_buttons_status()
	
func _load_upgrades():
	var file = File.new()
	file.open("res://resources/upgrades.json", file.READ)
	
	var json = parse_json(file.get_as_text())
	file.close()
	
	return json.upgrades
	
func _generate_buttons(upgrades):
	for upgrade in upgrades:
		var button = upgradeButton.instance()
		
		button.init(upgrade.description, upgrade.value, upgrade.price)
		button.connect("button_click", self, "_button_click")
		
		if upgrade.price > _counter:
			button.get_node("HBoxContainer/Button").disabled = true
			button.get_node("HBoxContainer/Rows").hide()
		
		buttons.append(button)
		
		$Control/MarginContainer/ScrollContainer/VBoxContainer.add_child(button)

func _set_buttons_status():
	for button in buttons:
		if !is_instance_valid(button):
			buttons.erase(button)
			continue
		
		if _counter >= button._price:
			button.get_node("HBoxContainer/Button").disabled = false
			button.get_node("HBoxContainer/Rows").show()
		elif _counter < button._price:
			button.get_node("HBoxContainer/Button").disabled = true






