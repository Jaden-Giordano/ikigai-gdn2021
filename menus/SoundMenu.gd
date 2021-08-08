extends HBoxContainer

export(Texture) var music_enabled
export(Texture) var music_disabled
export(Texture) var fx_enabled
export(Texture) var fx_disabled

onready var music_bus: int = AudioServer.get_bus_index("Music")
onready var fx_bus: int = AudioServer.get_bus_index("FX")

onready var music: TextureButton = get_node("Music")
onready var fx: TextureButton = get_node("FX")

var music_muted: bool = false
var fx_muted: bool = false

func _on_music_toggle():
  music_muted = !music_muted
  var new_db = -72 if music_muted else 0
  AudioServer.set_bus_volume_db(music_bus, new_db)
  music.texture_normal = music_disabled if music_muted else music_enabled


func _on_fx_toggle():
  fx_muted = !fx_muted
  var new_db = -72 if fx_muted else 0
  AudioServer.set_bus_volume_db(fx_bus, new_db)
  fx.texture_normal = fx_disabled if fx_muted else fx_enabled
