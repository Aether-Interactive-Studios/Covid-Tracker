extends Control

var storage = "user://"
var idt = "\n"
var location = storage + "Default.json"
var save = File.new()
var data




func _ready():
	if not save.file_exists(location):
		$HTTPRequest.connect("request_completed", self, "_on_request_completed")
		$HTTPRequest.request("https://covid-api.mmediagroup.fr/v1/cases")
		$HTTPRequest.request("https://localcoviddata.com/covid19/v1/high-level-policy?country=USA")
		
	else: #if save exists
		read()

func read():
	save.open(location, File.READ)
	data = parse_json(save.get_as_text())
	save.close()


func _on_request_completed(result, response_code, headers, body):
	var place
	var json = JSON.parse(body.get_string_from_utf8())
	var out = true

	data = json.result


	save.open(location, File.WRITE)
	save.store_string(to_json(data))
	save.close()
















#extends Control
#
#var storage = "user://"
#var idt = "\n"
#var location = storage + "Default.json"
#var save = File.new()
#var data
#func _ready():
#	if not save.file_exists(location):
#		$HTTPRequest.connect("request_completed", self, "_on_request_completed")
#		$HTTPRequest.request("https://covid-api.mmediagroup.fr/v1/cases")
#	else: #file exists
#		read()
#
#func read():
#	save.open(location, File.READ)
#	data = parse_json(save.get_as_text())
#	save.close()
#func write():
#
#	pass
#func _on_Button_pressed():
#	pass
#
#func _on_request_completed(result, response_code, headers, body):
#	var place
#	var json = JSON.parse(body.get_string_from_utf8())
#	var out = true
#
#	data = json.result
#
#
#	save.open(location, File.WRITE)
#	save.store_string(to_json(data))
#	save.close()
#
#	data = json.result
	
	
#	var search = ($LineEdit.text).capitalize()
#	if search == "Us" || search == "United States":
#		search = "US"		
#	for i in (json.result).keys():
#		if search == i:
#
#			out = true
#			break
#		else: 
#			out = false
#
#
#
#	if out:
#		place = json.result[search]["All"]
#
#		var text = $TextEdit.text 
#		print(text)
#		text = "Active Cases: " + str(place["confirmed"])
#
#		text += "\nDead: " + str(place["deaths"])
#
#		$TextEdit.text = text
#	else:
#		$TextEdit.text = "Invalid search"


#
#
#
#
#func _on_LineEdit_text_entered(new_text):
#	_on_Button_pressed()
#	pass # Replace with function body.







func _on_Button_pressed(state):
	print(state)
	pass # Replace with function body.
