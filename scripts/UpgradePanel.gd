extends Node

signal update_counter_per_second

var upgradeButton = preload("res://scenes/components/UpgradeButton.tscn")
onready var infoPanel = $Control/InfoPanel

var _counter = 0

var infos = []
var buttons = []

func _ready():
	self._generate_buttons(self._load_json("upgrades").upgrades)
	infos = self._load_json("info")

func _button_click(button):
	if (int(_counter) >= button._price):
		emit_signal("update_counter_per_second", button._price, button._value)
		button._price *= 2
		button._value *= 2
		button.set_price_text()
		self._show_InfoPanel()
	
func set_counter(counter):
	self._counter = counter
	self._set_buttons_status()
	
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
			
func _show_InfoPanel():
	randomize()
	var index = randi() % infos.size()
	print(index)
	infoPanel.get_node("Animation").play("show")
	infoPanel.get_node("Row/Icon").texture = load(infos[index].icon)
	infoPanel.get_node("Row/Text").text = infos[index].text
	
	infoPanel.get_node("Timer").start(10)

func _on_InfoPanel_timeout():
	infoPanel.get_node("Animation").play("hide")
	
func _load_json(filename):
	var file = File.new()
	file.open("res://resources/" + filename + ".json", file.READ)
	
	var json = parse_json(file.get_as_text())
	file.close()
	
	return json
