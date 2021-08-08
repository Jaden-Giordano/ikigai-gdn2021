extends HBoxContainer

signal continue_clicked
signal quit_clicked

var quit_confirm = false

onready var quit = get_node("VBoxContainer/Quit")

func _on_quit():
  if quit_confirm:
    emit_signal("quit_clicked")
  else:
    quit_confirm = true
    quit.text = "Are you sure?"

func _on_continue():
  emit_signal("continue_clicked")
