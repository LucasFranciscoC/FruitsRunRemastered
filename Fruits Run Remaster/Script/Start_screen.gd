extends Node2D

onready var music = $Music
onready var click_sfx = $Click_button_SFX

func _ready():
	music.play()
	pass

func _on_Start_button_pressed():
	click_sfx.play()
	yield(click_sfx, "finished")
	get_tree().change_scene("res://Scenes/CutScene.tscn")
	pass

func _on_Option_button_pressed():
	click_sfx.play()
	yield(click_sfx, "finished")
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass

func _on_Quit_button_pressed():
	click_sfx.play()
	yield(click_sfx, "finished")
	get_tree().quit()
	pass
