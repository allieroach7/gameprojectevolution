// Health bar
draw_set_colour(c_red);
draw_rectangle(10, 10, 10 + (200 * (hp / max_hp)), 30, false);
draw_set_colour(c_white);
draw_rectangle(10, 10, 210, 30, true);

// DNA points
draw_set_colour(c_lime);
draw_text(220, 10, "DNA: " + string(dna_points) + " / " + string(dna_to_evolve));

// Evolution stage
draw_text(220, 30, "Stage: " + string(evolution_stage + 1));

// Evolution prompt
if (can_evolve) {
    draw_set_colour(c_yellow);
    draw_text(220, 50, "Press E to EVOLVE!");
}

// --- MINIMAP ---
var _map_w = 200;
var _map_h = 112;
var _map_x = display_get_gui_width() - _map_w - 10;
var _map_y = 10;

// Map background
draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(_map_x, _map_y, _map_x + _map_w, _map_y + _map_h, false);
draw_set_alpha(1);

// Map border
draw_set_colour(c_white);
draw_rectangle(_map_x, _map_y, _map_x + _map_w, _map_y + _map_h, true);

// Scale factors
var _sx = _map_w / room_width;
var _sy = _map_h / room_height;

// Draw player on minimap
draw_set_colour(c_lime);
draw_circle(_map_x + (x * _sx), _map_y + (y * _sy), 3, false);

// Draw enemies on minimap
draw_set_colour(c_red);
with (obj_enemy_parent) {
    draw_circle(_map_x + (x * _sx), _map_y + (y * _sy), 2, false);
}

// Draw DNA points on minimap
draw_set_colour(c_yellow);
with (obj_dnaPoint) {
    draw_circle(_map_x + (x * _sx), _map_y + (y * _sy), 1, false);
}