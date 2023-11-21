extends ColorRect

var hp = 200


func _ready():
	$Bar.rect_size.x = hp
	Global.connect("on_update_hp", self, "update_bar")
	pass

func update_bar(damage):
	hp += damage
	$Bar.rect_size.x = hp
	if hp == 0:
		Global.world_speed_multiplier = 1
		get_tree().change_scene("res://Scenes/Save_score.tscn")
	pass
