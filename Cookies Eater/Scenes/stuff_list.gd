extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_back_button_pressed():
	$CanvasLayer/Pop.play()
	await $CanvasLayer/Pop.finished
	Status.scene = "res://Scenes/start_scene.tscn"
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
	pass # Replace with function body.
