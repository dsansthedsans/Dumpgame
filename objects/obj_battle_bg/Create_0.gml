
controller = obj_battle_controller;
depth = controller.battle_depth[8];
image_speed = 0;
image_alpha = 1;
image_xscale = 2;
image_yscale = 2;
if (controller.battle_bg != -1)
	sprite_index = controller.battle_bg;
else
	destroy(id);