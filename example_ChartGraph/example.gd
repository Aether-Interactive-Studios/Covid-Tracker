extends Control

onready var chart_node = get_node('chart')
onready var fps_label = get_node('benchmark/fps')
onready var points_label = get_node('benchmark/points')

func _ready():
  chart_node.initialize(chart_node.LABELS_TO_SHOW.NO_LABEL,
  {
	Deaths = Color(1.0, 0.18, 0.18),
	Confirmed = Color(0.58, 0.92, 0.07),
	interet = Color(0.5, 0.22, 0.6)
  })
  reset(1,2,3)
#  reset()
  set_process(true)

func _process(_delta):
  fps_label.set_text('FPS: %02d' % [Engine.get_frames_per_second()])
  points_label.set_text('NB POINTS: %d' % [chart_node.current_data.size() * 3.0])

func reset(confirmed, deaths, day):
#	for x in 10:
#		chart_node.create_new_point({
#		label = str(x),
#		values = {
#
#		Deaths = x*x+1,
#		Confirmed = x*x
#
#	}
#  })
	var recent = 0
	for x in 1:
#		if day == recent:
#			label = str(day)
#			recent = day
		chart_node.create_new_point({
		
		label = str(day),
			
		
		
		
		values = {
			
		Deaths = int(deaths),
		
		Confirmed = int(confirmed)
		
	}})
#		print(deaths)




