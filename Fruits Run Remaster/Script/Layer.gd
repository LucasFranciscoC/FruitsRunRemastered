extends ParallaxLayer

# Propriedades do script
export var speed: float = 1.0

# Função chamada a cada quadro
func _process(delta: float) -> void:
	# Obtenha a posição atual do ParallaxLayer
	var current_offset = motion_offset

	# Atualize a posição com base na velocidade e no tempo delta
	current_offset.x += speed * delta * Global.world_speed_multiplier

	# Atribua a nova posição ao ParallaxLayer
	motion_offset = current_offset
	pass
