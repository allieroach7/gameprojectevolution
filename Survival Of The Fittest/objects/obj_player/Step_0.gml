// --- DEATH CHECK ---
if (hp <= 0) {
    show_message("You have been eliminated! Game Over.");
    game_restart();
}

// --- PLAYER MOVEMENT ---
var _hmove = 0;
var _vmove = 0;

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) _hmove = -1;
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) _hmove = 1;
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) _vmove = -1;
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) _vmove = 1;

// Normalize diagonal movement
if (_hmove != 0 && _vmove != 0) {
    _hmove *= 0.707;
    _vmove *= 0.707;
}

x += _hmove * spd;
y += _vmove * spd;

// Keep player inside the room
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

// --- SHOOTING (Q key) ---
if (shoot_cooldown > 0) shoot_cooldown--;

if (keyboard_check_pressed(ord("Q")) && shoot_cooldown <= 0) {
    var _bullet = instance_create_layer(x, y, "Instances", obj_playerBullet);
    
    // Shoot in the direction player is facing
    if (_hmove != 0 || _vmove != 0) {
        _bullet.direction = point_direction(0, 0, _hmove, _vmove);
    } else {
        _bullet.direction = 0; // default: shoot right
    }
    
    _bullet.speed = 6;
    shoot_cooldown = shoot_delay;
}

// --- EVOLUTION CHECK ---
if (dna_points >= dna_to_evolve) {
    dna_points = 0;
    evolution_stage++;
    
    // Power up with each evolution
    spd += 0.5;
    max_hp += 25;
    hp = max_hp;
    shoot_delay = max(5, shoot_delay - 2);
    
    // Win condition — reached human form
    if (evolution_stage >= 5) {
        show_message("You evolved into a human! You win!");
        game_restart();
    }
}