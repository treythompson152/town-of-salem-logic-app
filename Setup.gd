# SetupScene.gd

extends Control

signal start_game(int num_players, Array player_names)

var num_players_input : LineEdit
var player_name_input : LineEdit
var player_names : Array = []

func _ready():
	num_players_input = $NumPlayersInput  # Assuming you have a LineEdit node named NumPlayersInput in your scene
	player_name_input = $PlayersNameInput  # Assuming you have a LineEdit node named PlayerNameInput in your scene

func _on_start_button_pressed():
	# Get the number of players from the user input
	var num_players : int = num_players_input.text.to_int()

	# Ask for player names
	for i in range(num_players):
		var player_name : String = get_player_name_from_user()
		player_names.append(player_name)

	# Emit the signal with the gathered information
	emit_signal("start_game", num_players, player_names)

	# Transition to the MainGameScene
	get_tree().change_scene("res://MainGameScene.tscn")

func get_player_name_from_user() -> String:
	# This function can be customized based on your UI for getting player names
	# For simplicity, it uses a blocking popup for demonstration purposes
	var popup : Popup = Popup.new()
	popup.dialog_text = "Enter Player Name:"
	popup.add_button("OK")
	popup.show_modal()
	return popup.text_input.text
