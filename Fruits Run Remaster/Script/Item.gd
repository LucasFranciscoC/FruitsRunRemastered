extends Area2D

#variaveis valor de cada item
export var banana_value = 3
export var apple_value = 1

export(ItemTypes.Types) var type = ItemTypes.Types.Banana

var value = 0

#atribui o objeto na pasta ao sprite
var sprite_apple = preload("res://Sprits/Itens/Apple.png")
var sprite_banana = preload("res://Sprits/Itens/Bananas.png")

var collected_effect = preload("res://Prefabs/Collected.tscn")

#função para setar as texturas de cada item
func _ready():
	if type == ItemTypes.Types.Banana:
		$Texture.texture = sprite_banana
		value = banana_value
	elif type == ItemTypes.Types.Apple:
		$Texture.texture = sprite_apple
		value = apple_value
	pass

#função para intanciar o objeto e referir ele a uma variavel / collected
func _on_Item_body_entered(body):
	if body.name == "Player" or "Player_gyro":
		Global.fruits += value
		Global.emit_fruit_collected()
		body.collected_sfx()
		
		var effect = collected_effect.instance()
		get_parent().add_child(effect)
		effect.position = position
		queue_free()
	pass
