extends Camera2D

export(float) var smoothing = 1.0

onready var focus: Node2D = get_node("../LifeState").get_current()

func _process(delta):
  if focus:
    position = lerp(position, focus.position, delta)

func update_focus():
  focus = get_node("../LifeState").get_current()
