extends Area2D

const LifeState = preload("res://LifeState.gd")
const Playable = preload("res://Playable.gd")

signal pressed

var pressed: bool = false
var type = LifeState.ALIVE

func _on_body_entered(node: Node):
  if !pressed and node is Playable and node.get_node("LifeState").current_state == type:
      emit_signal("pressed")
      pressed = true
