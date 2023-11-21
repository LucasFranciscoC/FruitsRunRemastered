extends VideoPlayer

var timer = Timer

func _ready():
	Global.fruits = 0
	timer()
	pass

func timer():
	timer = $Timer
	timer.wait_time = 15
	timer.start()
	pass

func _on_Timer_timeout():
	get_tree().change_scene("res://Levels/Main_scene.tscn")
	pass
