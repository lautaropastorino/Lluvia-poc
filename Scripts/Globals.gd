extends Node

var pause = false

var song_1 = preload("res://sounds/music/ogg/song_1.ogg")
var song_2 = preload("res://sounds/music/ogg/song_2.ogg")
var song_3 = preload("res://sounds/music/ogg/song_3.ogg")
var song_4 = preload("res://sounds/music/ogg/song_4.ogg")
var song_5 = preload("res://sounds/music/ogg/song_5.ogg")
var song_6 = preload("res://sounds/music/ogg/song_6.ogg")
var songs = [
	song_1,
	song_2,
	song_3,
	song_4,
	song_5,
	song_6,
]
var music
var song_index = 0

func set_pause(value):
	pause = value

func get_pause():
	return pause

func _ready():
	music = AudioStreamPlayer.new()
	music.stream = songs[0]
	music.set_bus("Music")
	add_child(music)
	music.play()

func _process(delta):
	if not music.is_playing():
		if song_index == 5:
			song_index = 0
		else:
			song_index += 1
		music.stream = songs[song_index]
		music.play()

	
