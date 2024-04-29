extends CharacterBody3D

const SPEED = 20.0
const ACCELERATION = 20
const FRICTION = 2
const JUMP_VELOCITY = 5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") # gravity from project settings 
const MOUSE_SENSITIVITY = 0.3 # advanced lab task -- tweak mouse sensitivity
@onready var body = $"." # advanced lab task -- reference to character body
var camera_x_rotation = 0 # keeps track of how much we move the camera along the x-axis (so to not overturn) 

func _physics_process(delta):
 apply_gravity(delta)
 move_and_slide()
func apply_gravity(delta):
 if not is_on_floor():
  velocity.y -= gravity*delta
	
func movement(delta):
 var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
 var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
 if direction:
  apply_velocity(direction, delta)
 else:
  apply_friction(direction, delta)
# velocity with acceleration
func apply_velocity(direction, delta):
 velocity.x = move_toward(velocity.x, direction.x * SPEED, ACCELERATION * delta)
 velocity.z = move_toward(velocity.z, direction.z * SPEED, ACCELERATION * delta)
# deceleration through friction
func apply_friction(direction, delta):
 velocity.x = move_toward(velocity.x, 0, FRICTION)
 velocity.z = move_toward(velocity.z, 0, FRICTION)

func apply_jump():
 if is_on_floor():
  if Input.is_action_just_pressed("ui_accept"):
   velocity.y = JUMP_VELOCITY 

func _input(event):
 if event is InputEventMouseMotion:
  body.rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENSITIVITY))
 # only move camera up or down if it is within the 90 degree boundary (so to not overturn)
 var x_delta = event.relative.y * MOUSE_SENSITIVITY
 if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90:
  head.rotate_z(deg_to_rad(-x_delta))
  camera_x_rotation += x_delta 

func _ready():
 Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
 if Input.is_action_just_pressed("ui_cancel"):
  Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) 
