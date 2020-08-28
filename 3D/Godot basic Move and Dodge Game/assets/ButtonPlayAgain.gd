extends Button


func _ready():
	pass


func _on_ButtonPlayAgain_pressed():
	get_tree().change_scene("res://assets/Menu.tscn")
