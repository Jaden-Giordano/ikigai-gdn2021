extends Node2D

onready var levels = get_node("Levels");

# Called when the node enters the scene tree for the first time.
func _ready():
  levels.start_scene(0)
