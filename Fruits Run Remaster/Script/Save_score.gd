extends Control

var player_name = 'None'
var name_list = []
var name_list_size = 0

onready var death_sfx = $Death_sfx

func _ready():
	death_sfx.play()
	yield(death_sfx, "finished")
	$Music.play()
	get_score()
	$Score/Text_score.text = "Seu Score: "+str(Global.fruits)
	pass

func _on_HTTP_get_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var dict = json.result
	dict = dict["dreamlo"]
	dict = dict["leaderboard"]
	dict = dict["entry"]
	name_list_size = len(dict)
	for i in range(name_list_size):
		var page = dict[i]
		name_list.append(page["name"])
	pass

func _on_Name_player_text_changed(new_text):
	player_name = new_text
	pass

func _on_Save_button_pressed():
	if player_name != 'None':
		var valid = true
		for i in range(name_list_size):
			if player_name == name_list[i]:
				valid = false
				break
		if valid:
			Global.score_name = player_name
			get_tree().change_scene("res://Scenes/Geme_leaderboard.tscn")
		else:
			print("Nome invalido")
	pass

func get_score():
	$HTTP_get.request("http://dreamlo.com/lb/65563b288f40bb1054bfbde2/json")
