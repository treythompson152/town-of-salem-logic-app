extends Control

var NUM_OF_PLAYERS : int
var TURN_ORDER = ["Intern", "Witch", "Magic Frog", "Mafia", 
				 "Escort", "Veteran", "Volunteer", "Vigilante", "Jailor", "Prosecutor", 
				 "Doctor", "Bodyguard", "Escort", "Jester", "Arsonist", "Plaguebearer", 
				 "Serial Killer", "Investigator", "Spy", "Intern"]
var PLAYER_NAMES = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameSetup.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_button_pressed():
	$TitleScreen.hide()
	$GameSetup.show()

func _on_submit_number_pressed():
	var numPlayerInput = $GameSetup/NumberOfPlayers/NumPlayerInput
	NUM_OF_PLAYERS = numPlayerInput.text.to_int()
	$GameSetup/NumberOfPlayers.hide()
	startGettingNames()
	
func startGettingNames():
	$GameSetup/NameAssigner.show()
	$GameSetup/NameAssigner/AskName.text = "Player " + str(PLAYER_NAMES.size() + 1) + " Name?"

func _on_submit_name_pressed():
	var namePlayerInput = $GameSetup/NameAssigner/NameInput
	var playerName = namePlayerInput.text
	namePlayerInput.clear()
	PLAYER_NAMES.append(playerName)
	if(PLAYER_NAMES.size() != NUM_OF_PLAYERS):
		$GameSetup/NameAssigner/AskName.text = "Player " + str(PLAYER_NAMES.size() + 1) + " Name?"
	else:
		pass #start game
