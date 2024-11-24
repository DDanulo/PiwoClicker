extends Node2D

@export var shopItemList: Array[ShopItem]  
const ItemShopScene = preload("res://scenes/shop_item_scene.tscn")

var player: Player

func _ready() -> void:
	showItems()
	player = Player.new() #TODO REMOVE PLACEHOLDER, INSTANTIATE PLAYER CLASS IN MAIN SCREEN 
	player.beer = 20

func showItems():
	for i in range(shopItemList.size()):
		shopItemList[i].calculate_cost(0)
		var instance = ItemShopScene.instantiate()
		instance.get_child(0).get_child(0).texture = shopItemList[i].icon
		instance.position.x = 100 + i*100
		instance.position.y = 100
		instance.get_child(0).get_child(1).text = shopItemList[i].name
		instance.on_item_bought.connect(buy_item)
		instance.item = shopItemList[i]
		self.add_child(instance)

func buy_item(item: ShopItem):
	if !player.itemsBought.has(item):
		player.itemsBought[item] = 0
	if player.beer > item.cost:
		player.itemsBought[item] += 1
		player.beer -= item.cost
		item.calculate_cost(player.itemsBought[item])
		print("item cost ", item.cost)
		print("player beer ",player.beer)
		print("amount of items of this type player has ",player.itemsBought[item])
	else:
		print("Not enough money")
