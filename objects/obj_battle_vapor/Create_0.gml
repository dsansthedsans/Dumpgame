
controller = obj_battle_controller;
target = controller.enemy_target;
x = controller.enemy_obj[target].x;
y = (controller.enemy_obj[target].y);
depth = controller.enemy_obj[target].depth;
sprite_index = controller.enemy_obj[target].sprite_index;
image_index = controller.enemy_obj[target].image_index;
image_xscale = 2;
image_yscale = 2;
audio_play(snd_enemy_vaporized, 0, VOLUME_SOUND);