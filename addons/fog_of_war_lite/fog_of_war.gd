extends Node

const MAX_SIZE := 64

signal cell_revealed(cell: Vector2i)
signal cell_hidden(cell: Vector2i)

var _width: int = 32
var _height: int = 32
var _revealed: Dictionary = {}

func setup(width: int, height: int) -> void:
	_width = mini(width, MAX_SIZE)
	_height = mini(height, MAX_SIZE)
	_revealed.clear()

func reveal(cell: Vector2i) -> void:
	if not _in_bounds(cell):
		return
	if not _revealed.has(cell):
		_revealed[cell] = true
		emit_signal("cell_revealed", cell)

func hide_cell(cell: Vector2i) -> void:
	if _revealed.has(cell):
		_revealed.erase(cell)
		emit_signal("cell_hidden", cell)

func is_revealed(cell: Vector2i) -> bool:
	return _revealed.has(cell)

func reveal_radius(center: Vector2i, radius: int) -> void:
	for x in range(center.x - radius, center.x + radius + 1):
		for y in range(center.y - radius, center.y + radius + 1):
			var cell := Vector2i(x, y)
			if center.distance_to(cell) <= radius:
				reveal(cell)

func reset_all() -> void:
	var cells: Array = _revealed.keys()
	_revealed.clear()
	for cell in cells:
		emit_signal("cell_hidden", cell)

func revealed_cells() -> Array:
	return _revealed.keys()

func revealed_count() -> int:
	return _revealed.size()

func total_cells() -> int:
	return _width * _height

func save_state() -> Dictionary:
	var cells: Array = []
	for cell in _revealed.keys():
		cells.append([cell.x, cell.y])
	return {"w": _width, "h": _height, "cells": cells}

func load_state(data: Dictionary) -> void:
	_width = data.get("w", _width)
	_height = data.get("h", _height)
	_revealed.clear()
	for arr in data.get("cells", []):
		_revealed[Vector2i(arr[0], arr[1])] = true

func _in_bounds(cell: Vector2i) -> bool:
	return cell.x >= 0 and cell.x < _width and cell.y >= 0 and cell.y < _height
