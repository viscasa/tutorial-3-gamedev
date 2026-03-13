extends AudioStreamPlayer2D

func _ready():
	finished.connect(_on_finished)

func _on_finished():
	if not playing:
		play()
