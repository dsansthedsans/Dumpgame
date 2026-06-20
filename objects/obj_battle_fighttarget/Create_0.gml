
controller = obj_battle_controller;
target = controller.enemy_target;

side = choose(-1, 1);
missed = 0;
x = (controller.box_x + ((controller.box_w / 2) * side));
y = controller.box_y;
speed = 4;
if (side == 1)
	speed = -4;
depth = controller.battle_depth[4];
image_speed = 0;