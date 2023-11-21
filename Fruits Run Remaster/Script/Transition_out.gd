extends CanvasLayer

func _ready():
	$Trasition_fx.interpolate_property($Overlay, "progress", 1.0, 0.0, 1.0, Tween.TRANS_QUINT, Tween.EASE_IN_OUT)
	$Trasition_fx.start()
	pass
