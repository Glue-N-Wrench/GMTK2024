extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	TurnManager.gameStarted.connect(on_game_started)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_game_started():
	play()
	print("we playing musica")
