extends Label

var coints = 0

func _ready():
	text = String(coints)

func _on_coin_coinCollected():
	coints = coints + 1
	_ready()
	if coints == 5:
		$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene("res://assets/YouWin.tscn")
