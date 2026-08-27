extends Node

var health: float = 100.0
var recent_locations: Array = []
var playstyle_tags: Dictionary = {}

func update_location(loc: Vector3):
    recent_locations.append(loc)
    if recent_locations.size() > 50:
        recent_locations.pop_front()

func get_memory_profile() -> Dictionary:
    return {
        "health": health,
        "locations": recent_locations,
        "tags": playstyle_tags
    }