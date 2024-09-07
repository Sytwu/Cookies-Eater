extends Control

var Timer_time_left
var CountDown_time_left
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("Menu"):
		"""
		Timer_time_left = $"../Timer".time_left
		CountDown_time_left = $"../CountDown".time_left
		if $"../Timer".timeout:
			$"../CountDown".stop()
		else:
			$"../Timer".stop()
		"""
		self.visible = true
	pass
	

func _on_continue_button_pressed():
	$Pop.play()
	await $Pop.finished
	self.visible = false
	"""
	if $"../Timer".is_stopped():
		$"../Timer".wait_time = Timer_time_left
		$"../Timer".start()
	else:
		$"../CountDown".wait_time = CountDown_time_left
		$"../CountDown".start()
	"""
	pass # Replace with function body.


func _on_exit_button_pressed():
	$Pop.play()
	await $Pop.finished
	get_tree().quit()
	pass # Replace with function body.


func _on_setting_button_pressed():
	$Pop.play()
	await $Pop.finished
	pass # Replace with function body.


func _on_home_page_button_pressed():
	$Pop.play()
	await $Pop.finished
	Status.scene = "res://Scenes/start_scene.tscn"
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
	pass # Replace with function body.
