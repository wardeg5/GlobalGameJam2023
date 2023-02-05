extends Node

export (PackedScene) var mob_scene


func _ready():
	randomize()


func _on_MobTimer_timeout():
	var mob = mob_scene.instance()

	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.unit_offset = randf()
	var player_position = $Player.transform.origin
	var dirtAreas = get_tree().get_nodes_in_group('DirtAreas')
	mob.initialize(mob_spawn_location.translation, player_position, dirtAreas)

	add_child(mob)
	mob.connect("squashed", $UserInterface/ScoreLabel, "_on_Mob_squashed")
