// Destroy enemy when HP hits 0
if (hp <= 0) {
    if (instance_exists(obj_player)) {
        obj_player.enemies_killed++;
    }
    
    if (instance_exists(obj_particle_manager)) {
        part_particles_create(obj_particle_manager.death_ps, x, y, obj_particle_manager.death_pt, 15);
    }
    
    instance_create_layer(x, y, "Instances", obj_dnaPoint);
    instance_destroy();
}

// Default movement — chase player with wall collision
if (instance_exists(obj_player)) {
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);
    var _new_x = x + lengthdir_x(spd, _dir);
    var _new_y = y + lengthdir_y(spd, _dir);
    
    if (!place_meeting(_new_x, y, obj_wall)) {
        x = _new_x;
    }
    if (!place_meeting(x, _new_y, obj_wall)) {
        y = _new_y;
    }
}