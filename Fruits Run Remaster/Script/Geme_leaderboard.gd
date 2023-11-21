extends Node2D

var score_text = ""

var timer = Timer

func _ready():
	add_score()
	pass

func add_score():
	$HTTP_add.request("http://dreamlo.com/lb/8XAob23fTUeLyTpmOVBi_A7Bizez5F5kWyEQuL9Vgkcg/add/"+Global.score_name+"/"+ str(Global.fruits))
	pass


func get_score():
	$HTTP_get.request("http://dreamlo.com/lb/65563b288f40bb1054bfbde2/json")
	timer = $Timer
	timer.wait_time = 8
	timer.start()
	pass

func _on_HTTP_add_request_completed(result, response_code, headers, body):
	get_score()
	pass


func _on_HTTP_get_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var dict = json.result
	dict = dict["dreamlo"]
	dict = dict["leaderboard"]
	dict = dict["entry"]
	var size = len(dict)
	for i in range(size):
		var page = dict[i]
		score_text += "Player: "+page["name"]+" Score: "+str(page["score"])+"\n"
		$Painel_score.text = score_text
	pass

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Start_screen.tscn")
	pass
