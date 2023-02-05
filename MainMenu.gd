extends Control

func _ready():
	pass

func _on_StartButton_pressed():
	$MenuButton.play()
	get_tree().change_scene("res://Main.tscn")
	$TitleMusic.stop()
	

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_HowTo_pressed():
	$HowToPlay.visible = true
	$Assets.visible = false
	$Credit.visible = false

func _on_Credits_pressed():
	$Assets.visible = true
	$Credit.visible = true
	$HowToPlay.visible = false
