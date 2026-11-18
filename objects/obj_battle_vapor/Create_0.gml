mode = 1;
/*
0 = particles are internal objects (uses surface and buffer)
1 = particles are external objects (uses surface and buffer)
2 = particles aren't objects, they are drawings (uses surface and buffer)
3 = particles aren't objects, they are drawings, but ignores columns (doesn't use surface or buffer)
*/
if (os_browser != browser_not_a_browser)
	mode = 3;
stage = 0;
control = obj_battle_controller;
x = control.enemy_obj[control.enemy_target].x;
y = (control.enemy_obj[control.enemy_target].y);
depth = control.enemy_obj[control.enemy_target].depth;
sprite_index = control.enemy_obj[control.enemy_target].sprite_index;
image_index = control.enemy_obj[control.enemy_target].image_index;
image_xscale = 2;
image_yscale = 2;
audio_play(snd_launchVapor, 0, VOLUME_SOUND);