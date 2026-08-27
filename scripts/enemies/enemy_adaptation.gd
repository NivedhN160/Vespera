extends Node

var damage_mult := 1.0
var health_mult := 1.0

func apply_mastermind_buffs(rules: Dictionary):
    if rules.has("enemy_damage_mult"):
        damage_mult = rules["enemy_damage_mult"]
    if rules.has("enemy_health_mult"):
        health_mult = rules["enemy_health_mult"]