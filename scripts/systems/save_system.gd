extends Node

const SAVE_PATH = "user://vespera_save.json"

func save_game(data: Dictionary):
    var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
    if file:
        file.store_string(JSON.stringify(data))

func load_game() -> Dictionary:
    if FileAccess.file_exists(SAVE_PATH):
        var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
        var data = JSON.parse_string(file.get_as_text())
        if typeof(data) == TYPE_DICTIONARY:
            return data
    return {}