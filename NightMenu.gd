extends Control




func _on_StoreButton_pressed():
	$StoreMenu.show()


func _on_NextDayButton_pressed():
	$MenuMusic.stop()
	$"../Roundtimer/Control/Timer".paused = false
	$".".hide()
	$"../MainTheme".play()
	
func _on_StoreMenu_ready():
	$StoreMenu.hide()


