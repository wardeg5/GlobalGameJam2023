extends Label

func toggle_visibility() -> void:
	$"../Timer".paused = true
	visible = visible
	text = "replacement"
	$"../../../NightMenu".visible = true
	$"../../../MainTheme".stop()
	$"../../../NightMenu/MenuMusic".play()

func _on_Timer_ready():
	text = str($"../Timer".time_left)# Replace with function body.

func _process(_delta : float) -> void:
	text = "Sunset: " + str(round($"../Timer".time_left))

