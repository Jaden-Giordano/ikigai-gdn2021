extends Node2D

signal death

onready var life_state = get_node("LifeState")
onready var camera = get_node("Camera2D")

export(int) var lives = 9

func kill():
  lives -= 1
  emit_signal("death", lives)
  toggle(true)

func toggle(death = false):
  life_state.toggle(death)
  camera.update_focus()
