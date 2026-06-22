# Fog of War Lite — Godot 4

Free Godot 4 addon for tile-based fog of war — reveal/hide cells with signals.

## Features (Lite — Free, max 64×64 grid)

- `setup(width, height)` — configure grid
- `reveal(cell)` / `hide_cell(cell)` / `is_revealed(cell)`
- `reveal_radius(center, radius)` — bulk reveal
- `reset_all()` / `revealed_cells()` / `revealed_count()`
- `save_state()` / `load_state()`
- Signals: `cell_revealed(cell)` / `cell_hidden(cell)`

## Quick Start

```gdscript
# Autoload: FogOfWar
FogOfWar.setup(50, 50)
FogOfWar.cell_revealed.connect(func(cell): update_tile(cell))
FogOfWar.reveal_radius(player_tile, 3)
```

## Upgrade to PRO

[Fog of War PRO](https://godot-forge.itch.io/fog-of-war-pro-godot) adds:
- Unlimited grid size
- **Visible** (currently seen) vs **Explored** (ever visited) — two separate states
- `update_vision(viewer_pos)` — auto-clear old visible, reveal new circle
- `exploration_percent()` — map completion tracking
- `reveal_all()` / `reset_visible()` (keep explored)
- `cell_explored` signal

---
Made with ♥ by [GodotForge](https://itch.io/profile/godot-forge)
