// Chase the player
if (instance_exists(obj_player)) {
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);
    x += lengthdir_x(spd, _dir);
    y += lengthdir_y(spd, _dir);
}

// Destroy enemy when HP hits 0
if (hp <= 0) {
    // Drop a DNA point where the enemy died
    instance_create_layer(x, y, "Instances", obj_dnaPoint);
    instance_destroy();
}