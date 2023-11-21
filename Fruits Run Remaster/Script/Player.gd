extends KinematicBody2D
#Classe do player
class_name Player

#intanciando a textura do player
onready var sprite: Sprite = get_node("Text")
onready var jump_sfx = $Jump_SFX

var velocity: Vector2

#variaveis de movimentação
export(int) var move_speed
export(int) var jump_speed
export(int) var gravity_speed

var health = 100
var max_health = 100

signal player_stats_changed

#funcção para movimentação em geral, pulo, esquerda e direita
func _physics_process(delta: float) -> void:
	move()
	jump()
	velocity.x -= Global.world_speed*Global.world_speed_multiplier
	velocity = move_and_slide(velocity, Vector2.UP)
	sprite.animate(velocity)
	pass

#função para se movimentar
func move() -> void:
	velocity.x = (move_speed * Global.world_speed_multiplier) * get_direction()
	pass

#função para se movimentar com as setas
func get_direction() -> float:
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	pass

#função para detectar que pulou
func jump() -> void:
	velocity.y += gravity_speed
	
	#if para saber se quando precionado o spaço vai pular
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = -jump_speed
	if Input.is_action_just_pressed("ui_select"):
		jump_sfx.play()
	pass

func _on_Fall_collision_body_entered(body):
	if body.name == "Fall_zone":
		Global.emit_player_hp(-50)
		position = Vector2(200, -5)
	pass

func collected_sfx():
	$Collected_SFX.play()
