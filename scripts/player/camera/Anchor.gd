extends CharacterBody3D


@export var speed = 15.0
@export var boundary = 15
@export var mouse_margin = 5

func _physics_process(delta):
	var viewport_size = get_viewport().get_visible_rect().size
	var mouse_coords = get_viewport().get_mouse_position()
	var input_vector = Vector2(0, 0)

	if mouse_coords.x < boundary:
		input_vector.x = -1
	elif mouse_coords.x > viewport_size.x - boundary:
		input_vector.x = 1
	if mouse_coords.y < boundary:
		input_vector.y = -1
	elif mouse_coords.y > viewport_size.y - boundary:
		input_vector.y = 1

	var direction = (transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

