extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(float) var speed: float = 100.0
export(float) var jump_power: float = 500.0
export(float) var gravity: float = 1200.0

export(bool) var active: bool = false

var velocity: Vector2 = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
  velocity.x = 0;

  # Only handle input if its active
  if active:
    if Input.is_action_pressed("left"):
      velocity.x = -speed
    if Input.is_action_pressed("right"):
      velocity.x = speed

    if Input.is_action_just_pressed("jump") and is_on_floor():
      velocity.y = -jump_power

  if velocity.y < 1000:
    velocity.y += gravity * delta

  velocity = move_and_slide(velocity, Vector2.UP)
