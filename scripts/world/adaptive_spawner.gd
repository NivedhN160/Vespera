extends Node

@export var enemy_scene: PackedScene

func execute_directives(directives: Dictionary):
    if directives.get("spawn_rate") == "high":
        spawn_threat()

func spawn_threat():
    if enemy_scene:
        var enemy = enemy_scene.instantiate()
        add_child(enemy)