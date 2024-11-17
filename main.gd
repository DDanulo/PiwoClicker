extends Node2D

@onready var button := $Button
@onready var label := $Label
@onready var text_edit := $TextEdit

var n := 0  # Инициализация переменной

# Функция для сохранения значения n в файл
func save_number():
	var config := ConfigFile.new()  # Создаем новый объект ConfigFile
	config.set_value("Settings", "saved_number", n)  # Устанавливаем значение для ключа в секции "Settings"
	config.save("C:/Users/hamon/Desktop/Saves/save_file.cfg")  # Сохраняем файл на рабочем столе
	#test test

# Функция для загрузки значения n из файла
func load_number():
	var config := ConfigFile.new()  # Создаем новый объект ConfigFile
	var err := config.load("C:/Users/hamon/Desktop/Saves/save_file.cfg")  # Загружаем файл с рабочего стола
	if err == OK:  # Проверяем, успешно ли загружен файл
		n = config.get_value("Settings", "saved_number", 0)  # Получаем значение, если оно существует; по умолчанию - 0
	else:
		print("Ошибка загрузки файла: ", err)

func _ready() -> void:
	load_number()  # Загружаем значение при запуске
	label.text = str(n)

func _process(delta: float) -> void:
	label.text = str(n)

func _on_texture_button_pressed() -> void:
	n += 1
	save_number()  # Сохраняем значение каждый раз при изменении
