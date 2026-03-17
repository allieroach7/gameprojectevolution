if (room == rm_game) {
    shader_set(shd_underwater);
    shader_set_uniform_f(u_time, shader_time);
}

draw_self();

if (room == rm_game) {
    shader_reset();
}