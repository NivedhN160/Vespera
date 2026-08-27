extends Node

func apply_world_changes(directives: Dictionary):
    if directives.has("fog_density"):
        print("Adjusting environment fog...")