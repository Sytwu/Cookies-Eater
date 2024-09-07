extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Status._load_data()
	if Status.highest_score < 100:
		$CanvasLayer/Title.text = '[center]Cookie Eater'
		$CanvasLayer/BackGround2.visible = false
	else:
		$CanvasLayer/Title.text = '[right]Bad Tako    '
		$CanvasLayer/BackGround2.visible = true
		
	Status.scene = "res://Scenes/start_scene.tscn"
	get_viewport().set_content_scale_size(Vector2i(1280,720))
	pass # Replace with function body.


func _on_start_button_pressed():
	$CanvasLayer/Pop.play()
	await $CanvasLayer/Pop.finished
	Status.scene = "res://Scenes/game_scene.tscn"
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
	pass # Replace with function body.


func _on_stuff_button_pressed():
	$CanvasLayer/Pop.play()
	await $CanvasLayer/Pop.finished
	Status.scene = "res://Scenes/stuff_list.tscn"
	get_tree().change_scene_to_file("res://Scenes/stuff_list.tscn")
	pass # Replace with function body.


func _on_exit_button_pressed():
	$CanvasLayer/Pop.play()
	await $CanvasLayer/Pop.finished
	get_tree().quit()
	pass # Replace with function body.
