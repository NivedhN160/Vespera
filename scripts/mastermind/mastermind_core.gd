extends Node

@onready var analyser = $BehaviourAnalyser
@onready var engine = $AdaptationEngine
@onready var spawner = "../WorldManager/AdaptiveSpawner"

var current_player_data: Dictionary = {}

func start_observing(player_node):
    if player_node.has_signal("action_performed"):
        player_node.connect("action_performed", Callable(self, "_on_player_action"))

func _on_player_action(action_type, context):
    current_player_data[action_type] = context
    update_model()

func update_model():
    if analyser and engine:
        var profile = analyser.classify_playstyle(current_player_data)
        issue_directives(profile)

func issue_directives(profile):
    if engine:
        var directives = engine.apply_adaptation(profile)
        if get_node_or_null(spawner):
            get_node(spawner).execute_directives(directives)