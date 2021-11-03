extends Control

var dialog = [
	'Olá, meu nome é Ada! Eu sou uma cientista muito renomada aqui na cidade.',
	'Eu estou precisando de alguém que me ajude a encontrar o meu tesouro precioso que perdi em uma de minha aventuras... e alguém como você seria ideal para o caso!',
	'Preciso que entre na máquina do tempo que desenvolvi para achar meu tesouro, porém não sei bem ao certo aonde e nem em qual período o perdi',
	'Para conseguir viajar para outros períodos, você precisará antes resolver cada enigma que aparecer... mas acredito que isso seja fácil para alguém inteligente como você!',
	'Tudo pronto? Então vamos nessa!',
]

var dialog_index = 0
var finished = false


func _ready():
	load_dialog()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
		
func _on_Continue_pressed():
		load_dialog()
		

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
	
	
