draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
draw_set_colour(c_lime);
draw_text_transformed(room_width / 2, room_height * 0.2, "SURVIVAL OF THE FITTEST", 3, 3, 0);

// Subtitle
draw_set_colour(c_white);
draw_text_transformed(room_width / 2, room_height * 0.33, "Can you evolve from microorganism to human?", 1.5, 1.5, 0);

// Team name
draw_set_colour(c_gray);
draw_text(room_width / 2, room_height * 0.45, "Gold Standard Studios");

// Controls
draw_set_colour(c_aqua);
draw_text(room_width / 2, room_height * 0.58, "WASD - Move");
draw_text(room_width / 2, room_height * 0.63, "Mouse - Aim");
draw_text(room_width / 2, room_height * 0.68, "Left Click / Q - Shoot");
draw_text(room_width / 2, room_height * 0.73, "E - Evolve (when ready)");

// Start prompt
draw_set_colour(c_yellow);
draw_text_transformed(room_width / 2, room_height * 0.87, "Press ENTER to Start", 1.5, 1.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);