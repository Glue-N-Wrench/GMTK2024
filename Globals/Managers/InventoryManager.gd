extends Node

var Buildings:Array[HouseInfo] = [
	#the index in this array will be the building's ID
	#HouseInfo.new(
		#"Bomb",
		#"this destroys rocks"
		#3,
		#preload(),
		#preload("res://Objects/Houses/base_house.tscn"),
	#),
	HouseInfo.new(
		"Alpha House",
		"2x2 house for tiny anchovies",
		2,
		preload("res://Objects/Houses/Textures/house_2x2_a.png"),
		preload("res://Objects/Houses/base_house.tscn"),
		2,
	),
	HouseInfo.new(
		"Beta House",
		"2x2 house for medium chad",
		1,
		preload("res://Objects/Houses/Textures/house_2x2_b.png"),
		preload("res://Objects/Houses/house_b.tscn"),
		2,
	),
	HouseInfo.new(
		"3x2 Charley House",
		"3x2 house for big catfish",
		1,
		preload("res://Objects/Houses/Textures/house_3x2_a.png"),
		preload("res://Objects/Houses/big_house_a.tscn"),
		1,
	),
]

signal inventoryUpdated # a new item, or an item was removed
signal inventoryCountUpdated # a change in count without a change in inventory items
var inventory = {
	#buildingID: count
	0:3,
	1:2,
	2:1,
}

func addItems(key, amount):
	if key in inventory:
		inventory[key] += amount
		inventoryCountUpdated.emit()
	else:
		inventory[key] = amount
		inventoryUpdated.emit()

func decrementItem(key):
	inventory[key] -= 1
	if inventory[key] == 0:
		inventory.erase(key)
		inventoryUpdated.emit()
	else:
		inventoryCountUpdated.emit()
