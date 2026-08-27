extends Node

func classify_playstyle(raw_data: Dictionary) -> String:
    if raw_data.has("attack") and typeof(raw_data["attack"]) == TYPE_INT and raw_data["attack"] > 10:
        return "aggressive"
    elif raw_data.has("stealth_kills"):
        return "stealthy"
    return "balanced"