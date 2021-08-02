extends Node2D

signal level_complete

func _on_portal_entered():
  emit_signal("level_complete")
