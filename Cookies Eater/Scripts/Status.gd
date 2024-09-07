extends Node

const save_file = "user://CookiesEater_Data.save"


func _save_data():
	var the_save_data = {
		Highest_score = highest_score
	}
	var json = JSON.new()
	var json_string = json.stringify(the_save_data)
	var file = FileAccess.open(save_file,FileAccess.WRITE)
	file.store_line(json_string)
	file = null
	pass
	
	
func _load_data():
	var file = FileAccess.open(save_file,FileAccess.READ)
	if FileAccess.file_exists(save_file):
		var json = JSON.new()
		var parse_result = json.parse(file.get_line())
		var node_data = json.get_data()
		highest_score = node_data['Highest_score']
		return true
	return false
	pass
	
	
var scene:String = '':
	get:
		return scene
	set(path):
		scene = path

var score = 0:
	get:
		return score
	set(new_score):
		score = new_score
		
var highest_score = 0:
	get:
		return highest_score
	set(new_score):
		highest_score = max(highest_score,new_score)
