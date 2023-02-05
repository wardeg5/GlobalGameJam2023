signal squashed

extends KinematicBody

# Minimum speed of the mob in meters per second.
export var min_speed = 2
# Maximum speed of the mob in meters per second.
export var max_speed = 3

var velocity = Vector3.ZERO

var dirts = []
var inDirt = false
var diedinDirt = false

func _physics_process(_delta):
	move_and_slide(velocity)
	if velocity.x !=0:
		$AnimationPlayer.play("Walk")
	inDirt = false
	for dirt in dirts:
		if dirt.overlaps_body(self):
			inDirt = true
			break

func initialize(start_position, player_position, dirtAreas):
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(rand_range(-PI / 3, PI / 4	))
	dirts = dirtAreas
	_set_velocity()
	get_node("DeathOrStandup").connect('timeout', self, '_on_timer_timeout')

#func _on_VisibilityNotifier_screen_exited():
	#queue_free()

func squash():
	get_node("CollisionShape").disabled = true
	print('in dirt:', inDirt)
	if inDirt:
		emit_signal("squashed")
		diedinDirt = true
	print(diedinDirt)
	get_node('DeathOrStandup').start(3)
	# kill mob
	#queue_free()
	velocity.y=0
	velocity.x=0
	velocity.z=0
	#set_rotation(Vector3(0,0,0))
	$metarig.rotate_x(-120)
	#translation.y -= 0.1
	$AnimationPlayer.play("Fall")

func _on_timer_timeout():
	if diedinDirt:
		#spawn a veggie
		print('veggie time!')
		$metarig/Skeleton/Cube.visible = false
		$MeshInstance/Carrot.visible = true
		$mobPop.play()
	else:
		#pop back up and carry on
		$metarig.rotate_x(120)
		_set_velocity()

func _set_velocity():
	var random_speed = rand_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

