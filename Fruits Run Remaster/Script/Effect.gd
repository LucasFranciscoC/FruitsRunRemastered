extends Node2D

export var destroy_anim = ""

func _on_Anim_animation_finished(anim_name):
	if anim_name == destroy_anim:
		queue_free()
	pass
