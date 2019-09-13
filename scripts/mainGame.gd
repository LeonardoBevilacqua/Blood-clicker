extends Node

var counter: float
var counterPerClick: int
var counterPerSecond: float

func _ready():
    # initialize the variables
	self.counter = 0
	self.counterPerClick = 1
	self.counterPerSecond = 0
    
    # connect the custom signals
	$ClickerPanel.connect("update_counter", self, "_update_counter")
	$UpgradePanel.connect("update_counter_per_second", self, "_update_counter_per_second")

# set the counter value and update the display text
func _set_counter(value):
	self.counter += value
	# set the counter value from upgradePanel
	$UpgradePanel.set_counter(self.counter)
	# update counter label text
	self._set_counter_label_text()

# set the counter per second value and update the display text
func _set_counter_per_second(value):
	self.counterPerSecond += value
	self._set_counter_per_second_label_text()

# set the counter when clicked
func _update_counter():
	_set_counter(self.counterPerClick)
    
# set the counter per second when clicked
func _update_counter_per_second(price, value):
	self._set_counter_per_second(value)
	self._set_counter(-price)

# set the counter every second
func _on_Timer_timeout():
	_set_counter(self.counterPerSecond)

# set the counter label text
func _set_counter_label_text():
	$ClickerPanel.set_counter_label_text(int(self.counter))

# set the counter per second label text
func _set_counter_per_second_label_text():
	$ClickerPanel.set_counter_per_second_label_text(self.counterPerSecond)

func save():
	print("salvando")
	var save = {
		"counter" : self.counter,
		"counterPerSecond" : self.counterPerSecond,
		"counterPerClick" : self.counterPerClick
	}
	
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(save))
	save_game.close()