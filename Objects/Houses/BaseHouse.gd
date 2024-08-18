@tool
extends Node2D
class_name House

@export var junk:bool = false
@export var cost:int = 1
@export var refund:int = 1
@export var fish_capacity: int = 1;
@export var max_fish_size: int = 0;
@export var distToGround:int = 64 #in pixels #used for "in the floor" calculation
var current_fish = {
	0:[]
};
@export var shape:Shape2D

func _ready():
	$Area2D/CollisionPolygon2D.polygon = shape.points
	FishManager.fishUpdated.connect(_on_fish_updated)
	$FishDetails.extraText = "max: "+str(fish_capacity)

func _on_fish_updated():
	var newDict = {}
	for size in current_fish:
		newDict[size] = current_fish[size].size()
	$FishDetails.fishData = newDict


func _on_area_2d_mouse_entered():
	if !junk:
		$FishDetails.visible = true

func _on_area_2d_mouse_exited():
	$FishDetails.visible = false
