extends Area2D

const Playable = preload("res://Playable.gd")

signal entered

func _on_body_entered(body):
  if body is Playable:
    emit_signal("entered")
