@tool
extends EditorPlugin

func _enable_plugin() -> void:
	add_autoload_singleton("FogOfWar", "res://addons/fog_of_war_lite/fog_of_war.gd")

func _disable_plugin() -> void:
	remove_autoload_singleton("FogOfWar")
