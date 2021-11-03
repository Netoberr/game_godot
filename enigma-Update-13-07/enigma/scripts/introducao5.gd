extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_next_pressed():
	Sfx._play("button1")
	# inicia o jogo
	Loader.goto_scene("res://scenes/main.tscn")


func _on_previous_pressed():
	Sfx._play("button1")
	# inicia o jogo
	Loader.goto_scene("res://scenes/introducao4.tscn")
