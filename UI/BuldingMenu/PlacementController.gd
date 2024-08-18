extends Node2D

var selectedObject:House = null
var validPlace:bool = false

@onready var Houses = {
	0: preload("res://Objects/Houses/base_house.tscn")
	}

# Called when the node enters the scene tree for the first time.
func makeSelection(selection:int):
	if selectedObject != null:
			selectedObject.queue_free()
	selectedObject = Houses[selection].instantiate()
	add_child(selectedObject)

func _unhandled_input(event):
	# Mouse in viewport coordinates.
	if selectedObject != null:
		if event is InputEventMouseButton and validPlace == true:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				remove_child(selectedObject)
				get_tree().root.add_child(selectedObject)
				selectedObject.set_process(true)
				selectedObject.position = get_viewport().get_camera_2d().get_global_mouse_position()
				selectedObject.modulate = Color.WHITE
				FishManager.addHouse(selectedObject)
				selectedObject = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position = get_viewport().get_mouse_position()+get_viewport().get_camera_2d().position
	if selectedObject != null:
		selectedObject.get_node("FishDetails").visible = false #this is really scrappy, find a way to not need this later
		position = get_global_mouse_position()
		#TODO: restrict position to grid
		if global_position.y+selectedObject.distToGround > 300:
			selectedObject.modulate = Color(1,0,0,0.5)#red
			validPlace = false
			return
		var overlaps = selectedObject.get_node('Area2D').get_overlapping_areas()
		if overlaps.size() == 0:
			selectedObject.modulate = Color(0,1,0,0.5)#blue
			validPlace = true
		else:
			selectedObject.modulate = Color(1,0,0,0.5)#red
			validPlace = false
