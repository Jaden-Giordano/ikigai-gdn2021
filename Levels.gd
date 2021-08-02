extends Node2D

export(Array, PackedScene) var scenes

var current_scene: Node
var current_scene_index: int

func start_scene(index: int):
  if current_scene:
    current_scene.queue_free()

  current_scene = scenes[index].instance()
  add_child(current_scene)
  current_scene_index = index
  current_scene.connect('level_complete', self, "_on_level_complete")

func _on_level_complete():
  if current_scene_index + 1 < scenes.size():
    start_scene(current_scene_index + 1)
  else:
    print("FINSIHED")
