extends CharacterBody3D

enum State { IDLE, CHASE, ATTACK }
var current_state = State.IDLE
var target: Node3D = null

func _physics_process(delta):
    match current_state:
        State.IDLE:
            pass
        State.CHASE:
            if target:
                var dir = (target.global_position - global_position).normalized()
                velocity = dir * 3.0
                move_and_slide()