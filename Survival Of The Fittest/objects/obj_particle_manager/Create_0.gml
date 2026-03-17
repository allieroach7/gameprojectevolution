// Death particles
death_ps = part_system_create();
death_pt = part_type_create();
part_type_shape(death_pt, pt_shape_star);
part_type_size(death_pt, 0.2, 0.5, -0.02, 0);
part_type_life(death_pt, 20, 40);
part_type_speed(death_pt, 1, 3, 0, 0);
part_type_direction(death_pt, 0, 360, 0, 0);
part_type_colour3(death_pt, c_red, c_orange, c_yellow);
part_type_alpha3(death_pt, 1, 0.6, 0);

// Evolution particles
evolve_ps = part_system_create();
evolve_pt = part_type_create();
part_type_shape(evolve_pt, pt_shape_flare);
part_type_size(evolve_pt, 0.3, 0.8, -0.01, 0);
part_type_life(evolve_pt, 30, 60);
part_type_speed(evolve_pt, 0.5, 2, 0, 0);
part_type_direction(evolve_pt, 0, 360, 0, 0);
part_type_colour3(evolve_pt, c_lime, c_aqua, c_white);
part_type_alpha3(evolve_pt, 1, 0.8, 0);

// Player death particles
player_death_ps = part_system_create();
player_death_pt = part_type_create();
part_type_shape(player_death_pt, pt_shape_explosion);
part_type_size(player_death_pt, 0.3, 0.8, -0.01, 0);
part_type_life(player_death_pt, 30, 60);
part_type_speed(player_death_pt, 1, 4, 0, 0);
part_type_direction(player_death_pt, 0, 360, 0, 0);
part_type_colour3(player_death_pt, c_white, c_red, c_dkgray);
part_type_alpha3(player_death_pt, 1, 0.7, 0);