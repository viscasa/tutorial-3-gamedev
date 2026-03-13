extends Node2D

@onready var sprite = $AnimatedSprite2D
@onready var audio_player = $AudioStreamPlayer2D
@onready var click_area = $ClickArea
@onready var label = $Label
@onready var toggle_sfx = $ToggleSFX

var is_player_in_area = false
var is_playing = false

func _ready():
	label.hide()
	
	click_area.body_entered.connect(_on_click_area_body_entered)
	click_area.body_exited.connect(_on_click_area_body_exited)
	audio_player.finished.connect(_on_audio_finished)
	
	is_playing = audio_player.playing
	var theme_song = get_tree().current_scene.get_node_or_null("ThemeSong") if get_tree().current_scene else null
	if not theme_song:
		theme_song = get_tree().root.find_child("ThemeSong", true, false)
		
	if is_playing:
		sprite.play("playing")
		if theme_song:
			theme_song.stop()
	else:
		sprite.play("default")

func _unhandled_input(event):
	if is_player_in_area and event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_F:
			toggle_boombox()

func toggle_boombox():
	if toggle_sfx:
		toggle_sfx.play()
		
	is_playing = not is_playing
	var theme_song = get_tree().current_scene.get_node_or_null("ThemeSong") if get_tree().current_scene else null
	if not theme_song:
		theme_song = get_tree().root.find_child("ThemeSong", true, false)
		
	if is_playing:
		sprite.play("playing")
		audio_player.play()
		if theme_song:
			theme_song.stop()
	else:
		sprite.play("default")
		audio_player.stop()
		if theme_song:
			theme_song.play()

func _on_audio_finished():
	if is_playing:
		audio_player.play()

func _on_click_area_body_entered(body):
	if body.name == "Player":
		is_player_in_area = true
		label.show()

func _on_click_area_body_exited(body):
	if body.name == "Player":
		is_player_in_area = false
		label.hide()
