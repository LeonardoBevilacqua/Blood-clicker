extends Node

signal button_click

var _description
var _value
var _price

func init(description, value, price):
	self._description = description
	self._value = value
	self._price = price
	
	self._updateDescriptionText()
	self._updatePriceText()
	
func _updateDescriptionText():
	$HBoxContainer/Rows/Description.text = self._description
	
func _updatePriceText():
	$HBoxContainer/Rows/Price.text = str(self._price)

func _on_Button_pressed():
	emit_signal("button_click", self)
