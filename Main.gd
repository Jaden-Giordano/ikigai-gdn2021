extends Node2D

const MainMenu = preload("res://menus/MainMenu.tscn")
const MenuBG = preload("res://menus/MenuBackground.tscn")
const GameMenu = preload("res://menus/GameMenu.tscn")
const Controls = preload("res://menus/Controls.tscn")
const LivesCounter = preload("res://menus/LivesCounter.tscn")
const GameOver = preload("res://menus/GameOver.tscn")
const LevelComplete = preload("res://menus/LevelComplete.tscn")

onready var levels = get_node("Levels");
onready var ui = get_node("UI")

var playing = false
var ingame_menu = null
var main_menu = null
var menu_bg = null
var controls = null
var lives_counter = null
var game_over = null
var level_complete = null

func _ready():
  spawn_main_menu()
  menu_bg = MenuBG.instance()
  ui.add_child(menu_bg)
  Audio.play_bgm("MenuMusic")

func _process(delta):
  if playing and Input.is_action_just_pressed("menu") and !ingame_menu:
    spawn_menu()

func spawn_main_menu():
  main_menu = MainMenu.instance()
  main_menu.connect("play_clicked", self, "_on_play")
  main_menu.connect("controls_clicked", self, "_on_controls")
  main_menu.connect("quit_clicked", self, "_on_quit")
  ui.add_child(main_menu)

func destroy_main_menu():
  if main_menu:
    main_menu.queue_free()
    main_menu = null

func spawn_menu():
  Audio.fade_out_current()
  ingame_menu = GameMenu.instance()
  ingame_menu.connect("resume_clicked", self, "_on_resume")
  ingame_menu.connect("restart_clicked", self, "_on_restart")
  ingame_menu.connect("quit_clicked", self, "_on_quit")
  ui.add_child(ingame_menu)
  get_tree().paused = true;

func destroy_ingame_menu():
  if ingame_menu:
    ingame_menu.queue_free()
    ingame_menu = null

func _on_resume():
  if ingame_menu:
    Audio.play("MenuSelect")
    destroy_ingame_menu()
    get_tree().paused = false;
    Audio.fade_in_current()

func _on_play():
  Audio.play("MenuSelect")
  Audio.fade_in("BackgroundMusic")
  destroy_main_menu()
  menu_bg.queue_free()
  menu_bg = null
  lives_counter = LivesCounter.instance()
  ui.add_child(lives_counter)
  levels.start()
  playing = true

func _on_controls():
  Audio.play("MenuSelect")
  destroy_main_menu()
  controls = Controls.instance()
  controls.connect("back_clicked", self, "_on_back_to_main")
  ui.add_child(controls)

func _on_back_to_main():
  Audio.play("MenuSelect")
  controls.queue_free()
  controls = null
  spawn_main_menu()

func _on_restart():
  if game_over:
    game_over.queue_free()
    game_over = null
  destroy_ingame_menu()
  levels.restart()
  playing = true
  get_tree().paused = false

func _on_quit():
  print("AAAA")
  Audio.play("MenuSelect")
  get_tree().quit()

func _on_lives_update(new_lives):
  if new_lives <= 0:
    playing = false
    get_tree().paused = true
    game_over = GameOver.instance()
    game_over.connect("restart_clicked", self, "_on_restart")
    game_over.connect("quit_clicked", self, "_on_quit")
    ui.add_child(game_over)
  else:
    lives_counter.set_lives(new_lives)

func _on_level_complete():
  playing = false
  get_tree().paused = true
  level_complete = LevelComplete.instance()
  level_complete.connect("continue_clicked", self, "_on_continue")
  level_complete.connect("quit_clicked", self, "_on_quit")
  ui.add_child(level_complete)

func _on_continue():
  Audio.play("MenuSelect")
  levels.next_level()
  level_complete.queue_free()
  level_complete = null
  playing = true
  get_tree().paused = false
