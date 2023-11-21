extends Node

var score_name = ""

#variavel global de item
var fruits = 0

var world_speed:float = 200
var world_speed_multiplier:float = 1

#sinal do collected
signal fruit_collected
func emit_fruit_collected():
	emit_signal("fruit_collected")
	pass

signal on_update_hp(damage)
func emit_player_hp(damage):#utilizado para emitir o sinal ja que o sinal é de responsibilidade do global
	emit_signal("on_update_hp", damage)
	pass
