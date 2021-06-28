extends Control


func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	

func _on_Button_pressed():
	$HTTPRequest.request("https://covid-api.mmediagroup.fr/v1/cases")

func _on_request_completed(result, response_code, headers, body):
	var place
	var json = JSON.parse(body.get_string_from_utf8())
	var out = true
	
	var search = ($LineEdit.text).capitalize()
	if search == "Us" || search == "United States":
		search = "US"		
	for i in (json.result).keys():
		if search == i:
			
			out = true
			break
		else: 
			out = false
			
	
	
	if out:
		place = json.result[search]["All"]
		
		var text = $TextEdit.text 
		print(text)
		text = "Active Cases: " + str(place["confirmed"])
		
		text += "\nDead: " + str(place["Deaths"])
		
		$TextEdit.text = text
	else:
		$TextEdit.text = "Invalid search"






func _on_LineEdit_text_entered(new_text):
	_on_Button_pressed()
	pass # Replace with function body.
