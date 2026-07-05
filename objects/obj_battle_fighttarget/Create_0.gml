
controller = obj_battle_controller;
target = controller.enemy_target;
xscale = 0.5;
yscale = 0.5;
scalespd = 0.5;
blend = 1;
blendspd = scalespd/4;
side = choose(-1, 1);
missed = 0;
x = (controller.box_x + ((controller.box_w / 2) * side));
y = controller.box_y;
speed = 2;
accel = 0.075;
if (side == 1)
{
	speed *= -1;
	accel *= -1;
}
depth = controller.battle_depth[4];
image_speed = 0;
