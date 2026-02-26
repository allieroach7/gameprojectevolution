spawn_timer++;

if (spawn_timer >= spawn_rate) {
    spawn_timer = 0;
    
    // Pick a random edge of the room to spawn from
    var _side = irandom(3);
    var _sx, _sy;
    
    switch (_side) {
        case 0: _sx = irandom(room_width); _sy = 0; break;           // top
        case 1: _sx = irandom(room_width); _sy = room_height; break; // bottom
        case 2: _sx = 0; _sy = irandom(room_height); break;          // left
        case 3: _sx = room_width; _sy = irandom(room_height); break; // right
    }
    
    instance_create_layer(_sx, _sy, "Instances", obj_enemy);
}