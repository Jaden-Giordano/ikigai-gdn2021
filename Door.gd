extends StaticBody2D

onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")

func _open():
  collision_shape.set_deferred("disabled", true)
