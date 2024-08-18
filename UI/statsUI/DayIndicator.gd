extends TextureRect

func _ready():
	TurnManager.updateDay.connect(_on_day_update)

func _on_day_update():
	$Label.text = "Day\n"+str(TurnManager.dayCount)

func _process(delta):
	$Sun.rotation = -(TurnManager.roundTimer / TurnManager.roundTime) * TAU
