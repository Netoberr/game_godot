extends TouchScreenButton

func _on_Menu_pressed():
	Sfx._play("button1")
	# inicia o jogo
	Loader.goto_scene("res://scenes/main.tscn")
