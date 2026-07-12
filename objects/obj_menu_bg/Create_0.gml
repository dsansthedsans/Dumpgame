
depth = -100;
image_alpha = 0;
controller = obj_menu_controller;
if (room == room_over)
	controller = obj_over_controller;

acid_siner = 0;
trash_color = merge_color(c_white, global.c_dump, 0.35);

alarm[0] = 1;
