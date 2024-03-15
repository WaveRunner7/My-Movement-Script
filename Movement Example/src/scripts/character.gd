extends CharacterBody3D

@export var gravity = 1.2 # "jump for some reason will not work so i took it out for now."
@export var input_axis = 0 # "I later found out that collions between two concave shapes are not supported so...."
@export var move_speed = 1.7 # "at least it works. -_-"
@export var jump_power = 23


@export var death_y_zone = -20
@export var deaths = 0


func _ready():
	position = Vector3(0,10,0)

func _unhandled_input(_event):
	get_input_axis(_event)




func _physics_process(_delta):
	movement_physics()
	

func jump_physics():
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_pressed("jump"):
			velocity.y = jump_power
	else:
		check_if_ded()
		velocity.y -= gravity

func check_if_ded():
	if position.y < death_y_zone:
		velocity = Vector3(0,0,0)
		position = Vector3(0,10,0)
		deaths += 1


func get_input_axis(_event):
	input_axis = Input.get_axis("move_left", "move_right")


func calculate_axis():
	velocity.x += (input_axis * move_speed)


func velocity_decay():
	velocity.x = (velocity.x * .85)



func movement_physics():
	
	calculate_axis()
	
	move_and_slide()
	
	jump_physics()
	
	velocity_decay()
