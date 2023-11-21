extends Control

onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX")
onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")
onready var click_sfx = $Click_button_SFX

func _on_Mute_music_pressed():
	AudioServer.set_bus_mute(MUSIC_BUS_ID, true)
	click_sfx.play()
	yield(click_sfx, "finished")
	pass

func _on_Mute_SFX_pressed():
	AudioServer.set_bus_mute(SFX_BUS_ID, true)
	click_sfx.play()
	yield(click_sfx, "finished")
	pass

func _on_Play_music_pressed():
	AudioServer.set_bus_mute(MUSIC_BUS_ID, false)
	click_sfx.play()
	yield(click_sfx, "finished")
	pass

func _on_Play_SFX_pressed():
	AudioServer.set_bus_mute(SFX_BUS_ID, false)
	click_sfx.play()
	yield(click_sfx, "finished")
	pass

func _on_Back_button_pressed():
	click_sfx.play()
	yield(click_sfx, "finished")
	get_tree().change_scene("res://Scenes/Start_screen.tscn")
	pass
