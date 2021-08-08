extends Area2D

const Playable = preload("res://Playable.gd")

signal playable_touched

func _on_body_entered(body):
  if body is Playable and body.active:
    emit_signal("playable_touched")
