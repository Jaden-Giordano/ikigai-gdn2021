extends KinematicBody2D

const LifeState = preload("res://LifeState.gd")

export(float) var speed: float = 100.0
export(float) var jump_power: float = 500.0
export(float) var gravity: float = 1200.0

export(bool) var active: bool = false
export(String, "Alive", "Ghost") var type: String = LifeState.ALIVE

var velocity: Vector2 = Vector2.ZERO

func _ready():
  update_sprite()

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

func toggle():
  active = !active
  update_sprite()

func update_sprite():
  get_node("State/Inactive").visible = !active
  get_node("State/Active").visible = active
