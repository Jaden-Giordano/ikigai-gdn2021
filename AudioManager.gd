extends Node2D

onready var sounds: Dictionary = {
  'menu_select': get_node("MenuSelect"),
}

func play(sound: String, from = 0.0):
  sounds[sound].play(from)
