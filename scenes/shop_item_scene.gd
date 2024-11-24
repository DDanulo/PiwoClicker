extends Node2D

var item: ShopItem

signal on_item_bought

func _on_item_shop_pressed() -> void:
	on_item_bought.emit(item)
