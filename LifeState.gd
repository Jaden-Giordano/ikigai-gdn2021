extends Node2D

const ALIVE = "Alive"
const GHOST = "Ghost"

var current_state = ALIVE

onready var camera = get_node("../Camera2D")
onready var states = {
  ALIVE: get_node("Alive"),
  GHOST: get_node("Ghost"),
}

func toggle():
  states[current_state].toggle();
  current_state = GHOST if current_state == ALIVE else ALIVE
  states[current_state].toggle();

func get_current():
  return states[current_state]
