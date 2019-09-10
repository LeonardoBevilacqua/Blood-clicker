extends Node

var counter
var counterPerClick
var counterPerSecond

func _ready():
	self.counter = 0
	self.counterPerClick = 1
	self.counterPerSecond = 0.5
	
	$ClickerPanel.connect("update_counter", self, "updateCounterByClick")
	self.updateCounterPerSecondLabel()

func updateCounter(value):
	self.counter += value
	self.updateCounterLabel()

func updateCounterByClick():
	updateCounter(self.counterPerClick)

func _on_Timer_timeout():
	updateCounter(self.counterPerSecond)

func updateCounterLabel():
	$ClickerPanel.updateCounterLabel(int(self.counter))
	
func updateCounterPerSecondLabel():
	$ClickerPanel.updateCounterPerSecondLabel(self.counterPerSecond)

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

