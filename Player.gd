extends Node2D

onready var life_state = get_node("LifeState")
onready var camera = get_node("Camera2D")

export(int) var lives = 9

func kill():
  lives -= 1
  toggle()

func toggle():
  life_state.toggle()
  camera.update_focus()
