hp = 50;
spd = 1.5;

// Scale with player evolution
if (instance_exists(obj_player)) {
    hp += obj_player.evolution_stage * 15;
    spd += obj_player.evolution_stage * 0.3;
}