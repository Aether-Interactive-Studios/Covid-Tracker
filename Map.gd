extends Control

var storage = "user://"
var idt = "\n"
var location = storage + "Default.json"
var save = File.new()
var data


func httpreq():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$HTTPRequest.request("https://energ.ee/covid19-us-api/states.json")


func _ready():
	if not save.file_exists(location):
		$Buttons.visible = false
		httpreq()
#		$HTTPRequest.request("https://covid-api.mmediagroup.fr/v1/cases")
#		$HTTPRequest.request("https://localcoviddata.com/covid19/v1/high-level-policy?country=USA")

		
		
	else: #if save exists
		read()
		$Buttons.visible = true
		

func read():
	save.open(location, File.READ)
	data = parse_json(save.get_as_text())
	save.close()
	


func _on_request_completed(result, response_code, headers, body):
	print("done")
	var place
	var json = JSON.parse(body.get_string_from_utf8())
	var out = true

	data = json.result
	

	save.open(location, File.WRITE)
	save.store_string(to_json(data))
	save.close()
	read()
	$Buttons.visible = true
	








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
	$Buttons/ME.visible = false
	print(state)
	var disp = $Disp
	
	disp.visible= true
#	disp.text = state
#	print(data[state][-1])
	var infodata = state + " " + str(data[state][-1]["date"]) + " Confirmed cases: " + str(data[state][-1]['confirmed'])  + "  Deaths: " + str(data[state][-1]['deaths'] + "\n")
	
#	var output = data[state][-1]["date"]
#	$Disp/Label.text = infodata
	var wholetext = ""
	for x in range(1,90):
		var idx = (-1 * x)
		infodata = state + " " + str(data[state][idx]["date"]) + " Confirmed cases: " + str(data[state][idx]['confirmed'])  + "  Deaths: " + str(data[state][idx]['deaths'] + "\n")
		wholetext += infodata
		
		
		
		$Disp/Label.text = wholetext
#	print(data[state].length())
	
	pass # Replace with function body.


func _on_Refresh_pressed():
	httpreq()
	pass # Replace with function body.


func _on_X_pressed():
	$Disp.visible = false
	$Buttons/ME.visible = true
	pass # Replace with function body.
