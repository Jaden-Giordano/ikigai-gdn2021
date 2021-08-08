extends HBoxContainer

signal restart_clicked
signal quit_clicked

func _on_restart():
  emit_signal("restart_clicked")

func _on_quit():
  emit_signal("quit_clicked")
