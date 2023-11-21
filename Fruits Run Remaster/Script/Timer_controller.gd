extends CanvasLayer

var time = 0

func _process(delta):
	time += delta
	if time >= 10:
		if Global.world_speed_multiplier < 3:
			Global.world_speed_multiplier += 0.1
			time = 0
	pass
