extends Node2D
const new_spider = preload("res://assets/scenes/spider.tscn")
const new_flower = preload("res://assets/scenes/flower.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = ""
var life = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func add_Flower():
	var flower = new_flower.instance()
	flower.position.x = int(rand_range(0,720))
	flower.position.y = 0
	get_node("spawn").add_child(flower)
	pass
func add_Spider():
	var spider = new_spider.instance()
	spider.position.x = int(rand_range(0,720))
	spider.position.y=0
	get_node("spawn").add_child(spider)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	changeScore()
	changeLife()

func _on_timerSpider_timeout():
	
	add_Spider()
	 # Replace with function body.


func _on_timerFlower_timeout():
	add_Flower()
	 # Replace with function body.

func changeScore():
	get_node("bar/text").text = str(get_node("bee").score)
func changeLife():
	life = get_node("bee").life
	if life == 3:
		get_node("gameover").hide()
		pass
	elif life == 2:
		get_node("bar/3").hide()
	elif life == 1:
		get_node("bar/2").hide()
	else:
		get_node("bar/1").hide()
		get_node("bee").hide()
		get_node("gameover").show()
		


func _on_restart_timeout():
	if life == 0:
		get_tree().reload_current_scene()
