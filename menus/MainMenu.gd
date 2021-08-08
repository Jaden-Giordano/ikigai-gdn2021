extends CenterContainer

signal play_clicked
signal controls_clicked
signal quit_clicked

func _on_play():
    emit_signal("play_clicked")

func _on_controls():
    emit_signal("controls_clicked")

func _on_quit():
    emit_signal("quit_clicked")
