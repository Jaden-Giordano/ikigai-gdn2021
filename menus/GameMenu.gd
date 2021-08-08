extends CenterContainer

signal resume_clicked
signal quit_clicked

func _process(delta):
  if Input.is_action_just_pressed("menu"):
    _on_resume()

func _on_resume():
    emit_signal("resume_clicked")

func _on_quit():
    emit_signal("quit_clicked")
