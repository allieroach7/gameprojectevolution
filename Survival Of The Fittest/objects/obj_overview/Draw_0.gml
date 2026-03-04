draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(-1);
draw_set_colour(c_white);
draw_text(room_width / 2, room_height / 3, "SURVIVAL OF THE FITTEST");

draw_set_colour(c_lime);
draw_text(room_width / 2, room_height / 2, "Press ENTER to Start");

draw_set_colour(c_gray);
draw_text(room_width / 2, room_height * 0.65, "WASD to move | Mouse to aim | Click/Q to shoot");

draw_set_halign(fa_left);
draw_set_valign(fa_top);