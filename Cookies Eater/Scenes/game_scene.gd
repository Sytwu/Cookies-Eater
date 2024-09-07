extends Control

var start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Status.score = 0
	start = false
	$CanvasLayer/InGameMenu.visible = false
	$CanvasLayer/Timer.wait_time = 3
	$CanvasLayer/CountDown.wait_time = 90
	get_viewport().set_content_scale_size(Vector2i(1280,720))
	$CanvasLayer/Score.text = 'Score: ' + str(Status.score)
	$CanvasLayer/Timer.start()
	pass # Replace with function body.


func _show_timer():
	$CanvasLayer/Mask.visible = not start
	$CanvasLayer/TimerLabel.visible = not start
	$CanvasLayer/TimerLabel.text = "[center]%d" % (int($CanvasLayer/Timer.time_left)+1)
	$CanvasLayer/TimeLeft.text = "Time: %02d:%02d" % _time_left()
	pass


func _process(delta):
	_show_timer()
	await get_tree().create_timer(0.1).timeout
	pass


func _on_timer_timeout():
	start = true
	$CanvasLayer/CountDown.start()
	pass # Replace with function body.


func _time_left():
	var time_left = $CanvasLayer/CountDown.time_left
	var minute = floor(time_left/60)
	var second = int(time_left)%60
	return [minute,second]


func _on_count_down_timeout():
	Status.scene = "res://Scenes/end_scene.tscn"
	get_tree().change_scene_to_file("res://Scenes/end_scene.tscn")
	pass # Replace with function body.

