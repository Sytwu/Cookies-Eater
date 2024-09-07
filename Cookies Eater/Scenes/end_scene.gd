extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Status.highest_score = max(Status.highest_score,Status.score)
	Status._save_data()
	var n = Status.score
	var m = Status.highest_score
	var result = "[center]你總共吃了 %d 塊餅乾\n\n[center] 最高紀錄 %d 塊餅乾" % [n,m]
	$CanvasLayer/Result.text = result
	$CanvasLayer/Takodachi.texture = load("res://Images/Tako"+str(min(2,floor(n/50)))+".jpg")
	pass # Replace with function body.


func _on_replay_button_pressed():
	$CanvasLayer/Pop.play()
	await $CanvasLayer/Pop.finished
	Status.scene = "res://Scenes/game_scene.tscn"
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
	pass # Replace with function body.


func _on_home_page_button_pressed():
	$CanvasLayer/Pop.play()
	await $CanvasLayer/Pop.finished
	Status.scene = "res://Scenes/start_scene.tscn"
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
	pass # Replace with function body.
