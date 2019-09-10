extends Node

var counter
var counterPerClick
var counterPerSecond

func _ready():
	self.counter = 0
	self.counterPerClick = 1
	self.counterPerSecond = 0.5
	$ClickerPanel.connect("update_counter", self, "updateCounter")

func updateCounter():
	self.counter += self.counterPerClick
	self.updateCounterLabel()

func _on_Timer_timeout():
	self.counter += self.counterPerSecond
	self.updateCounterLabel()

func updateCounterLabel():
	$ClickerPanel.updateCounterLabel(int(counter))
