// Erratic movement — changes direction randomly while chasing
erratic_timer++;

if (instance_exists(obj_player)) {
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);
    
    // Every 30 frames, add a random offset to direction
    if (erratic_timer >= 30) {
        erratic_dir = irandom_range(-45, 45);
        erratic_timer = 0;
    }
    
    _dir += erratic_dir;
    x += lengthdir_x(spd, _dir);
    y += lengthdir_y(spd, _dir);
}

if (hp <= 0) {
    instance_create_layer(x, y, "Instances", obj_dnaPoint);
	if (instance_exists(obj_player)) {
    obj_player.enemies_killed++;
}
    instance_destroy();
}