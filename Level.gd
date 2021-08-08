extends Node2D

signal level_complete
signal death

func _on_portal_entered():
  emit_signal("level_complete")

func _on_death(lives):
  emit_signal("death", lives)
