extends Resource
class_name ShopItem

@export var name: String
@export var initialCost: int
@export var cost: int
@export var icon: Texture2D
@export var bpm: int

func calculate_cost(level: int):
	cost = initialCost + initialCost * (level * 0.5)
