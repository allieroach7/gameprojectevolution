// Slow chase toward player
if (instance_exists(obj_player)) {
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);
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