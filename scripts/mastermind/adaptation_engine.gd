extends Node

var adaptation_level: int = 1

func apply_adaptation(playstyle: String) -> Dictionary:
    var rules = {}
    if playstyle == "aggressive":
        rules["enemy_damage_mult"] = 1.0 + (0.1 * adaptation_level)
        rules["spawn_rate"] = "high"
    elif playstyle == "stealthy":
        rules["enemy_perception"] = 1.5
    else:
        rules["enemy_health_mult"] = 1.1
    return rules