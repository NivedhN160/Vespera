extends Node

@onready var world_manager = $WorldManager
@onready var mastermind = $MastermindCore
@onready var player = $Player

func _ready():
    print("Vespera Main Initialized")
    if mastermind and player:
        mastermind.start_observing(player)

func _process(delta):
    pass