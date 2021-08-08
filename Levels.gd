extends Node2D

signal lives_update
signal level_complete

export(Array, PackedScene) var scenes

var current_scene: Node
var current_scene_index: int

func start():
  start_scene(0)

func restart():
  start_scene(current_scene_index)

func next_level():
  if current_scene_index + 1 < scenes.size():
    start_scene(current_scene_index + 1)
  else:
    print("FINSIHED")

func start_scene(index: int):
  if current_scene:
    current_scene.queue_free()

  emit_signal("lives_update", 9)

  current_scene = scenes[index].instance()
  current_scene.connect('level_complete', self, "_on_level_complete")
  current_scene.connect('death', self, "_on_death")
  add_child(current_scene)
  current_scene_index = index

func _on_level_complete():
  emit_signal("level_complete")

func _on_death(lives):
  emit_signal("lives_update", lives)
