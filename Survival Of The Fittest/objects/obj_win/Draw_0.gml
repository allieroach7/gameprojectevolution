draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Victory title
draw_set_colour(c_lime);
draw_text_transformed(room_width / 2, room_height * 0.15, "YOU ARE HUMAN!", 3, 3, 0);

// Subtitle
draw_set_colour(c_white);
draw_text_transformed(room_width / 2, room_height * 0.28, "You survived the evolutionary gauntlet!", 1.5, 1.5, 0);

// Stats
draw_set_colour(c_aqua);
draw_text(room_width / 2, room_height * 0.45, "- - - FINAL STATS - - -");

draw_set_colour(c_white);
draw_text(room_width / 2, room_height * 0.52, "Stages Completed: 6");

draw_text(room_width / 2, room_height * 0.58, "Enemies Defeated: " + string(global.final_kills))

// Play again prompt
draw_set_colour(c_yellow);
draw_text_transformed(room_width / 2, room_height * 0.78, "Press ENTER to Play Again", 1.5, 1.5, 0);

// Credits
draw_set_colour(c_gray);
draw_text(room_width / 2, room_height * 0.9, "Gold Standard Studios - Allie, Jeevith, Summer, Nathan");

draw_set_halign(fa_left);
draw_set_valign(fa_top);