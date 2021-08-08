extends Node2D

const GameMenu = preload("res://GameMenu.tscn")

onready var levels = get_node("Levels");
onready var ui = get_node("UI")
onready var audio = get_node("Audio")

var playing = false
var ingame_menu = null

func _process(delta):
  if playing and Input.is_action_just_pressed("menu") and !ingame_menu:
    spawn_menu()

func spawn_menu():
  ingame_menu = GameMenu.instance()
  ingame_menu.connect("resume_clicked", self, "_on_resume")
  ingame_menu.connect("quit_clicked", self, "_on_quit")
  get_tree().paused = true;
  ui.add_child(ingame_menu)

func _on_resume():
  if ingame_menu:
    audio.play("menu_select")
    ingame_menu.queue_free()
    ingame_menu = null
    get_tree().paused = false;

func _on_play():
  audio.play("menu_select")
  levels.start_scene(0)
  ui.get_node("MainMenu").queue_free()
  playing = true

func _on_quit():
  audio.play("menu_select")
  get_tree().quit()
