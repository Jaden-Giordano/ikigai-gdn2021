extends HBoxContainer

signal restart_clicked
signal return_clicked
signal quit_clicked

func _on_restart():
  emit_signal("restart_clicked")

func _on_return():
  emit_signal("return_clicked")

func _on_quit():
  emit_signal("quit_clicked")
