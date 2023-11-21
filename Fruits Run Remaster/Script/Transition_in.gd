extends CanvasLayer

func change_scene(path):
	assert(get_tree().change_scene(path) == OK)
	pass
