extends Label

func update_score():
	text = "000" + String(Global.fruits)
	if Global.fruits >= 10:
		text = "00" + String(Global.fruits)
	pass

func _ready():
	Global.connect("fruit_collected",self,"update_score")
	pass
