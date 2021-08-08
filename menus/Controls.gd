extends VBoxContainer

signal back_clicked

func _on_back():
  emit_signal("back_clicked")
