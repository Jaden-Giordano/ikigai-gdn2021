extends HBoxContainer

signal quit_clicked
signal return_clicked

func _on_quit():
  emit_signal("quit_clicked")

func _on_return():
  emit_signal("return_clicked")
