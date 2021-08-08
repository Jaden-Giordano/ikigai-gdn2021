extends Node2D

export(float) var fade_in_duration: float = 0.5
export(float) var fade_out_duration: float = 1.5

var fading_in = false
var fading_out = false
var fade_timer: float = 0.0

var queue = null
var current_bgm = null

onready var bgm_bus: int = AudioServer.get_bus_index("BGM")
onready var audio_node = get_node("/root/Main/Audio")

func _process(delta):
  if (fading_in or fading_out) and fade_timer <= 0:
    fading_in = false
    fading_out = false
  elif fading_in or fading_out:
    fade_timer -= delta
    if fade_timer < 0: fade_timer = 0
    
    var current_db = 0
    if fading_in:
      current_db = 72 * ((fade_in_duration - fade_timer) / fade_in_duration) - 72
    elif fading_out:
      current_db = 72 * (fade_timer / fade_out_duration) - 72
    AudioServer.set_bus_volume_db(bgm_bus, current_db)

func play(sound: String, from = 0.0):
  audio_node.get_node(sound).play(from)

func play_bgm(sound: String):
  stop_bgm()
  current_bgm = audio_node.get_node(sound)
  current_bgm.play()

func fade_in(sound: String):
  fading_in = true
  fade_timer = fade_in_duration
  AudioServer.set_bus_volume_db(bgm_bus, -72)
  play_bgm(sound)

func fade_in_current():
  fading_in = true
  fade_timer = fade_in_duration
  AudioServer.set_bus_volume_db(bgm_bus, -72)

func fade_out_current():
  fading_out = true
  fade_timer = fade_out_duration
  AudioServer.set_bus_volume_db(bgm_bus, 0)

func stop(sound: String):
  audio_node.get_node(sound).stop()

func stop_bgm():
  if current_bgm:
    current_bgm.stop()
    current_bgm = null

func reset_bgm_volume():
  AudioServer.set_bus_volume_db(bgm_bus, 0)
