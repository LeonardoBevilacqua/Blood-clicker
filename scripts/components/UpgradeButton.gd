extends Node

signal button_click

var _description
var _value
var _price

func init(description, value, price):
	self._description = description
	self._value = value
	self._price = price
	
	self._set_description_text()
	self._set_price_text()
	
func _set_description_text():
	$HBoxContainer/Rows/Description.text = self._description
	
func _set_price_text():
	$HBoxContainer/Rows/Price.text = str(self._price)

func _on_Button_pressed():
	emit_signal("button_click", self)
