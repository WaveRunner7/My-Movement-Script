extends Node3D



@export var camera_tween = "blank"

@onready var viewport_camera_node = $"2D View/Camera"
@onready var camera_node = $Camera
@onready var Character = $Character

@export var interpolation_amount = 0.22


func _process(_delta):
	assign_and_interpolate_camera()


func make_camera_tween():
		camera_tween = get_tree().create_tween()


func assign_and_interpolate_camera():
	make_camera_tween()
	
	camera_node.position = Vector3((Character.position.x +1.5), (Character.position.y +4), 6)
	viewport_camera_node.position = Vector3(Character.position.x, 4, 6)
	
	camera_tween.tween_property(camera_node, "position", camera_node.position, interpolation_amount)
	camera_tween.tween_property(viewport_camera_node, "position", viewport_camera_node.position, interpolation_amount)
