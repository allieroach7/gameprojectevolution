draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Game over title
draw_set_colour(c_red);
draw_text_transformed(room_width / 2, room_height * 0.25, "GAME OVER", 3, 3, 0);

// Message
draw_set_colour(c_white);
draw_text_transformed(room_width / 2, room_height * 0.4, "Evolution has failed...", 1.5, 1.5, 0);

// Retry prompt
draw_set_colour(c_yellow);
draw_text_transformed(room_width / 2, room_height * 0.65, "Press ENTER to Try Again", 1.5, 1.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);