// Player variables
spd = 3;
hp = 100;
max_hp = 100;
dna_points = 0;
dna_to_evolve = 10;
evolution_stage = 0;
shoot_cooldown = 0;
shoot_delay = 15;
can_evolve = false;
sprite_index = spr_eukaryote;
enemies_killed = 0;
global.final_kills = 0;
is_dead = false;
u_time = shader_get_uniform(shd_underwater, "u_time");
shader_time = 0;

music_channel = -1;  // Store audio channel

// Start background music
if (!audio_is_playing(music_channel)) {
    music_channel = audio_play_sound(snd_gameStart, 1, true);
}