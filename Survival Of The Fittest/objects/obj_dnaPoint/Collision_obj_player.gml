audio_play_sound(snd_collect,1,false)

// Give player DNA points
with (other) {
    dna_points += 1;
}
instance_destroy();

