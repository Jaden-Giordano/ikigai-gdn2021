extends PanelContainer

onready var counter = get_node("HBoxContainer/Count")

func set_lives(new_lives: int):
  counter.text = String(new_lives)
