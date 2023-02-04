signal squashed

extends KinematicBody

# Minimum speed of the mob in meters per second.
export var min_speed = 2
# Maximum speed of the mob in meters per second.
export var max_speed = 3

var velocity = Vector3.ZERO


func _physics_process(_delta):
	move_and_slide(velocity)
	if velocity.x >0:
		$AnimationPlayer.play("Walk")
func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(rand_range(-PI / 3, PI / 4	))

	var random_speed = rand_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)


#func _on_VisibilityNotifier_screen_exited():
	#queue_free()

func squash():
	get_node("CollisionShape").disabled = true
	emit_signal("squashed")
	# kill mob
	#queue_free()
	velocity.y=0
	velocity.x=0
	velocity.z=0
	#set_rotation(Vector3(0,0,0))
	$metarig.rotate_x(-120)
	#translation.y -= 0.1
	$AnimationPlayer.play("Fall")


