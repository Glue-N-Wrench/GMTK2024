extends Window
#The big gimic with this option menu is that it doesn't change global options untill you press apply

var selectedSoundOptions = OptionsMan.soundSettings.duplicate(true)
const soundControl = preload("res://UI/Options/sound_control.tscn")

func _ready():
	#==build sound options ==
	for option in selectedSoundOptions:
		var newControl = soundControl.instantiate()
		newControl.name = option
		$TabContainer/SoundSettings.add_child(newControl)
		newControl.get_node('Label').text = option
		newControl.get_node('MuteBtn').button_pressed = selectedSoundOptions[option]['mute']
		newControl.get_node('Slider').value = selectedSoundOptions[option]['value']


func resetOptions():
	#undo changes back to the global settings
	for option in selectedSoundOptions:
		var settingNode = $TabContainer/SoundSettings.get_node(option)
		settingNode.get_node('MuteBtn').button_pressed = selectedSoundOptions[option]['mute']
		settingNode.get_node('Slider').value = selectedSoundOptions[option]['value']

func _on_apply_but_pressed():
	#==apply sound options ==
	for option in selectedSoundOptions:
		var settingNode = $TabContainer/SoundSettings.get_node(option)
		OptionsMan.soundSettings[option]['mute'] = settingNode.get_node('MuteBtn').button_pressed
		OptionsMan.soundSettings[option]['value'] = settingNode.get_node('Slider').value
	OptionsMan.applySettings()

func _on_close_but_pressed():
	resetOptions()
	hide()

func _on_option_btn_pressed():
	#this needs to be connect to a signal from outside the menu
	show()

