extends Node

signal button_click

var _description
var _value

func init(description, value):
	self._description = description
	self._value = value
	
	self._updateDescriptionText()
	self._updateValueText()
	
func _updateDescriptionText():
	$HBoxContainer/Rows/Description.text = self._description
	
func _updateValueText():
	$HBoxContainer/Rows/Value.text = str(self._value)

func _on_Button_pressed():
	emit_signal("button_click", self._value)
	queue_free()
