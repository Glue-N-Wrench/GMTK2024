extends Node

const gridSize = Vector2i(64,64)
var gridLimitSides = 500 # limit left and right of center in pixels
const floor = 335 # pos of floor in pixels
var gridLimitTop = -160 # pos of vertical limit in pixels


func reset():
	gridLimitSides = 500
	gridLimitTop = -160
