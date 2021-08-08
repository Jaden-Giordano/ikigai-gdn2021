extends Area2D

const Playable = preload("res://Playable.gd")

signal pressed

var pressed: bool = false

func _on_body_entered(node: Node):
  if !pressed and node is Playable:
      emit_signal("pressed")
      pressed = true
