extends Control

var score : int = 0
var time_left : int = 3
var aim_score : int = 5

func _ready() -> void:
	$TimeLeftLabel.text = "Time left: " + str(time_left)
	$AimScoreLabel.text = "Aim score: " + str(aim_score)

func _on_increase_button_pressed() -> void:
	score += 1
	$ScoreLabel.text = "Score: " + str(score)
	Input.vibrate_handheld(125)
	if score == aim_score:
		get_tree().change_scene_to_file("res://game_win.tscn")

func _on_time_left_timer_timeout() -> void:
	time_left -= 1
	$TimeLeftLabel.text = "Time left: " + str(time_left)
	if time_left == 0: 
		get_tree().change_scene_to_file("res://game_over.tscn")
