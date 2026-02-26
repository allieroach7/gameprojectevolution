// Health bar
draw_set_colour(c_red);
draw_rectangle(10, 10, 10 + (200 * (hp / max_hp)), 30, false);
draw_set_colour(c_white);
draw_rectangle(10, 10, 210, 30, true);

// DNA points
draw_set_colour(c_lime);
draw_text(10, 40, "DNA: " + string(dna_points) + " / " + string(dna_to_evolve));

// Evolution stage
draw_text(10, 60, "Stage: " + string(evolution_stage));