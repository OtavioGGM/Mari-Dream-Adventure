extends Sprite

var cloud_speed = Vector2(20, 0)

func _process(delta):
	position.x -= cloud_speed.x * delta
	
	if position.x + texture.get_width() < 0:
		position.x = get_viewport_rect().size.x
