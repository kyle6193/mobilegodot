extends Control

var score : int = 0
var time_left : int = 3
var aim_score : int = 5

func _ready() -> void:
	$TimeLeftLabel.text = "Time left: " + str(time_left) # The $ targets an element in the scene (like TimeLeftLabel) then you just reassign a string and concatenate the above var. 
	$AimScoreLabel.text = "Aim score: " + str(aim_score) # As the above vars are "type" int, you can to conver them to strings to be concatenated.

func _on_increase_button_pressed() -> void:
	score += 1
	$ScoreLabel.text = "Score: " + str(score)
	Input.vibrate_handheld(125) #Unlikely to use this. It's how you make a cellphone vibrate. 
	if score == aim_score:
		get_tree().change_scene_to_file("res://game_win.tscn")

func _on_time_left_timer_timeout() -> void:
	time_left -= 1
	$TimeLeftLabel.text = "Time left: " + str(time_left)
	if time_left == 0: 
		get_tree().change_scene_to_file("res://game_over.tscn")
# The timer's Wait Time is set to 1 second, so this function will be called every second
# Each second, the time_left variable is decremented by 1 and the label is updated