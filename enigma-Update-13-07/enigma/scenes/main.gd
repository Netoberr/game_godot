extends Node2D

func _ready():
	_loadData()

func _loadData(onlyPlacar=false):
	var level = Game.readData("level", "1")
	var pontos = Game.readData("pontos", 0)
	
	$placar/level.text = str(level)
	$placar/pontos.text = str(pontos)
	
	if onlyPlacar:
		$anim.play("placar")
	else:
		$anim.play("start")
		yield($anim, "animation_finished")
		$Control.show()
	
func _on_btnPlay_pressed():
	Sfx._play("button1")
	# inicia o jogo
	Loader.goto_scene("res://scenes/level.tscn")

func _on_btnReset_pressed():
	# reset game
	Game.deleteFileSave()
	# salva o jogo na variavel local
	Game.saveData({
		"level": 1,
		"pontos": 0
		}, "overwrite")
func _on_btnHistoria_pressed():
	Sfx._play("button1")
	# inicia o jogo
	Loader.goto_scene("res://scenes/Dialogo.tscn")
	
	# atualiza o arquivo do jogo com o save
	Game.onlySaveData()
	
	$anim.play("reset")
	
	# espera a animação acabar
	yield($anim, "animation_finished")
	_loadData(true)
	#Loader.goto_scene("res://scenes/main.tscn")


func _on_btnHistoria_released():
	pass # Replace with function body.
	
func _on_Continue_pressed():
	Sfx._play("button1")
	# inicia o jogo
	Loader.goto_scene("res://scenes/historia_parte_2.tscn")
	
	# atualiza o arquivo do jogo com o save
	Game.onlySaveData()
	
	$anim.play("reset")
	
	# espera a animação acabar
	yield($anim, "animation_finished")
	_loadData(true)
	#Loader.goto_scene("res://scenes/main.tscn")


func _on_Continue_released():
	pass # Replace with function body.
