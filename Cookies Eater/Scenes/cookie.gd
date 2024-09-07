extends TextureButton

var goals = [0  ,5  ,10 ,20 ,30 ,40 ,50,60,70,80,90,100,2147483647]
var sizes = [360,300,250,200,160,120,90,75,60,50,40,30]
var cur_size = 360

# Called when the node enters the scene tree for the first time.
func _ready():
	cur_size = 360
	$".".texture_normal = load("res://Images/cookie_imgs/cookie_360.png")
	pass # Replace with function body.


func _resize():
	for i in range(len(goals)):
		if Status.score < goals[i+1]:
			cur_size = sizes[i]
			$".".texture_normal = load("res://Images/cookie_imgs/cookie_" + str(cur_size) + ".png")
			break
	pass


func _move():
	var x = randi()%(1280-cur_size)
	var y = randi()%(720-cur_size)
	self.position = Vector2i(x, y)
	pass


func _on_pressed():
	self.visible = false
	Status.score += 1
	$EatCookies.play()
	get_parent().get_node("Score").text = 'Score: ' + str(Status.score)
	_resize()
	_move()
	self.visible = true
	pass # Replace with function body.
