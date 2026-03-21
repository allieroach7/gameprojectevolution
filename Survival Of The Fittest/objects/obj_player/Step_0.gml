
// Hide player in non-game rooms
if (room != rm_game && room != rm_game_land) {
    instance_destroy();
    exit;
}

// --- DEATH CHECK ---
if (hp <= 0 && !is_dead) {
    is_dead = true;
    if (instance_exists(obj_particle_manager)) {
        part_particles_create(obj_particle_manager.player_death_ps, x, y, obj_particle_manager.player_death_pt, 30);
    }
    alarm[0] = 60;
    visible = false;
    spd = 0;
	audio_stop_sound(snd_gameStart);
	audio_play_sound(snd_die,40,false);
}

if (is_dead) {
    exit;
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

// Horizontal movement with wall collision
var _new_x = x + (_hmove * spd);
if (!place_meeting(_new_x, y, obj_wall)) {
    x = _new_x;
}

// Vertical movement with wall collision
var _new_y = y + (_vmove * spd);
if (!place_meeting(x, _new_y, obj_wall)) {
    y = _new_y;
}

// Keep player inside the room
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);


// --- CAMERA FOLLOW ---
if (view_enabled) {
    var _cam = view_camera[0];
    var _cx = x - (camera_get_view_width(_cam) / 2);
    var _cy = y - (camera_get_view_height(_cam) / 2);
    
    // Clamp camera to room bounds
    _cx = clamp(_cx, 0, room_width - camera_get_view_width(_cam));
    _cy = clamp(_cy, 0, room_height - camera_get_view_height(_cam));
    
    camera_set_view_pos(_cam, _cx, _cy);
}

// Shader timer
shader_time += 0.016;

// --- SHOOTING (mouse click or Q key) ---
if (shoot_cooldown > 0) shoot_cooldown--;
if ((mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("Q"))) && shoot_cooldown <= 0) {
    var _bullet = instance_create_layer(x, y, "Instances", obj_playerBullet);
    _bullet.direction = point_direction(x, y, mouse_x, mouse_y);
    _bullet.speed = 6;
    shoot_cooldown = shoot_delay;
    
    // Change projectile sprite based on level
    if (room == rm_game) {
        _bullet.sprite_index = spr_bubble;
    } else {
        _bullet.sprite_index = spr_leaf;
    }
}

// --- EVOLUTION CHECK ---
if (dna_points >= dna_to_evolve) {
    can_evolve = true;
}

if (can_evolve && keyboard_check_pressed(ord("E"))) {
    can_evolve = false;
    dna_points = 0;
    evolution_stage++;
	audio_play_sound(snd_evolve, 1, false);
	
	// Evolution particles
if (instance_exists(obj_particle_manager)) {
    part_particles_create(obj_particle_manager.evolve_ps, x, y, obj_particle_manager.evolve_pt, 30);
}
    
    // Power up with each evolution
    spd += 0.5;
    max_hp += 25;
    hp = max_hp;
    shoot_delay = max(5, shoot_delay - 2);
    
    // Change sprite based on evolution stage
  switch (evolution_stage) {
    case 1: sprite_index = spr_fish; break;
    case 2: sprite_index = spr_fishLegs; break;
    case 3: sprite_index = spr_salamander; break;
    case 4: sprite_index = spr_monkey; break;
}
    
    // Transition to land level at stage 3
    if (evolution_stage == 3 && room == rm_game) {
        room_goto(rm_game_land);
    }
    
    // Win condition — reached human form
    if (evolution_stage >= 5) {
    global.final_kills = enemies_killed;
	audio_stop_sound(snd_gameStart);
    room_goto(rm_win);
}
}



// --- CHEAT CODES (for testing) ---

// Press 1 — Full health
if (keyboard_check_pressed(ord("1"))) {
    hp = max_hp;
}

// Press 2 — Get 10 DNA points instantly
if (keyboard_check_pressed(ord("2"))) {
    dna_points += 10;
}

// Press 3 — Skip to next evolution stage
if (keyboard_check_pressed(ord("3"))) {
    evolution_stage++;
    spd += 0.5;
    max_hp += 25;
    hp = max_hp;
    shoot_delay = max(5, shoot_delay - 2);
    
 switch (evolution_stage) {
    case 1: sprite_index = spr_fish; break;
    case 2: sprite_index = spr_fishLegs; break;
    case 3: sprite_index = spr_salamander; break;
    case 4: sprite_index = spr_monkey; break;
	case 5: audio_stop_sound(snd_gameStart);
}
    
    if (evolution_stage == 3 && room == rm_game) {
        room_goto(rm_game_land);
    }
    
    if (evolution_stage >= 5) {
    global.final_kills = enemies_killed;
    room_goto(rm_win);
}
}

// Press 4 — Instant win
if (keyboard_check_pressed(ord("4"))) {
    global.final_kills = enemies_killed;
    room_goto(rm_win);
}

// Press 5 — Instant death
if (keyboard_check_pressed(ord("5"))) {
    room_goto(rm_gameover);
	audio_stop_sound(snd_gameStart);
}

// Press 6 — Kill all enemies on screen
if (keyboard_check_pressed(ord("6"))) {
        instance_destroy(obj_enemy_parent);
}