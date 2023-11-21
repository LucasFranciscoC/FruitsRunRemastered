extends Node2D

var time = 0

var random_gen = RandomNumberGenerator.new()

onready var bg_music = $Backgrund_music

#array com os itens na pasta
var segments = [
	preload("res://Levels/Room_rare.tscn"),
	preload("res://Levels/Room_0.tscn"),
	preload("res://Levels/Room_1.tscn"),
	preload("res://Levels/Room_2.tscn"),
	preload("res://Levels/Room_3.tscn"),
	preload("res://Levels/Room_4.tscn"),
	preload("res://Levels/Room_5.tscn"),
	preload("res://Levels/Room_6.tscn")
]

#função que conectar nova sena ao spawn
func _ready():
	bg_music.play()
	spawn_inst(1024, 0)
	random_gen.randomize()
	pass

func _physics_process(delta):
	for area in $Area.get_children():
		area.position.x -= Global.world_speed*delta*Global.world_speed_multiplier
		if area.position.x < -1024:
			spawn_inst(area.position.x+2048, 0)
			area.queue_free()
	pass

#função para instanciar as senas na variavel inst
func spawn_inst(x, y):
	var random_index = random_gen.randi() % len(segments)
	if random_index == 0 and rand_range(0,10) < 7:
		random_index += 1
	var inst = segments[random_index].instance()
	inst.position = Vector2(x , y)
	$Area.add_child(inst)
	return inst
	pass
