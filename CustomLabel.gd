extends Label

func toggle_visibility() -> void:
	visible = not visible
	text = "replacement"


func _on_Timer_ready():
	text = str($"../Timer".time_left)# Replace with function body.

func _process(_delta : float) -> void:
	text = "Time Left: " + str(round($"../Timer".time_left))

