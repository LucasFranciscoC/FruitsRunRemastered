extends Sprite
class_name PlayerTexture
#instancia a animação a variavel anamation
onready var animation: AnimationPlayer = get_node("%Anim")

var current_anim = ""

onready var raycast: RayCast2D = get_node("%RayCast")
onready var raycast2: RayCast2D = get_node("%RayCast2")

#função para o animações do player
func animate(velocity: Vector2) -> void:
	verify_orientation(velocity.x)
	if !is_grunded():
		vertical_behavior(velocity.y)
		return
	horizontal_behavior(velocity.x)
	pass

#função para flipar o sprite do personagem
func verify_orientation(speed: float) -> void:
	if speed > 0:
		flip_h = false
	if speed <- Global.world_speed*Global.world_speed_multiplier:
		flip_h = true
	pass

#animação de jump
func vertical_behavior(speed: float) -> void:
	if speed > 0:
		play_anim("Fall")
	if speed < 0:
		play_anim("Jump")
	pass

#função para saber quando esta andando ou parado
func horizontal_behavior(speed: float) -> void:
	if !(abs(speed - (Global.world_speed * Global.world_speed_multiplier * -1)) < 0.000001):
		play_anim("Run")
		return
	play_anim("Idle")
	pass

func play_anim(new_animation):
	if new_animation != current_anim:
		current_anim = new_animation
		animation.play(current_anim)
	pass

func is_grunded():
	if raycast.is_colliding() || raycast2.is_colliding():
		return true
	return false
	pass
