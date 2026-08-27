extends CharacterBody3D

@export var speed := 5.0
@export var jump_velocity := 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

signal action_performed(action_type, context)

func _physics_process(delta):
    if not is_on_floor():
        velocity.y -= gravity * delta

    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = jump_velocity
        record_action("jump", {"location": global_position})

    var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        velocity.x = direction.x * speed
        velocity.z = direction.z * speed
        record_action("move", {"direction": direction})
    else:
        velocity.x = move_toward(velocity.x, 0, speed)
        velocity.z = move_toward(velocity.z, 0, speed)

    move_and_slide()

func record_action(action_type: String, context: Dictionary):
    emit_signal("action_performed", action_type, context)