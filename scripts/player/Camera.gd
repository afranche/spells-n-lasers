extends Camera3D

@export var lock_camera: bool = false
@export var boundary: int = 50
@export var distance: float = 2.0

@onready var PlayerNode = get_node("../Player")
@onready var FreeLookAnchorNode = get_node("../FreeLookCameraAnchor")

# Called when the node enters the scene tree for the first time.
func _ready():
	var anchor = PlayerNode if lock_camera else FreeLookAnchorNode
	look_at_from_position(Vector3(anchor.global_position.x + distance, anchor.global_position.y + distance * 2, anchor.global_position.z + distance), anchor.global_position)

func _process(delta):
	var anchor = PlayerNode if lock_camera else FreeLookAnchorNode 
	look_at_from_position(Vector3(anchor.global_position.x + distance, anchor.global_position.y + distance * 2, anchor.global_position.z + distance), anchor.global_position)

func _input(event):
	if event.is_action_pressed("sal_camera_lock"):
		FreeLookAnchorNode.global_position = PlayerNode.global_position 
		lock_camera = !lock_camera
	if event.is_action_pressed("sal_camera_zoom_in"):
		distance -= 0.1
	elif event.is_action_pressed("sal_camera_zoom_out"):
		distance += 0.1
	print(distance)
