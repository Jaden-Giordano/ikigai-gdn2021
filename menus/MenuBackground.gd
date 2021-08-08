extends ParallaxBackground

export(float) var scroll_speed = 1.0

var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.

func _process(delta):
  if scroll_offset.x > 125: direction = -1
  elif scroll_offset.x < -125: direction = 1

  scroll_offset += Vector2(1, 1) * scroll_speed * direction * delta
