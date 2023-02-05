extends Node

export (PackedScene) var mob_scene

var dayCount = 0

func _ready():
	randomize()
	$NightMenu.hide()
	$MainTheme.play()


func _on_MobTimer_timeout():
	var mob = mob_scene.instance()

	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.unit_offset = randf()
	var player_position = $Player.transform.origin
	mob.initialize(mob_spawn_location.translation, player_position)

	add_child(mob)
	mob.connect("squashed", $UserInterface/ScoreLabel, "_on_Mob_squashed")


#func _on_StoreMenu_ready():
#	$StoreMenu.hide() # Replace with function body.


func _on_VBoxContainer_draw():
	dayCount += 1
	$NightMenu/RichTextLabel.text = "End of Day " + str(dayCount)
