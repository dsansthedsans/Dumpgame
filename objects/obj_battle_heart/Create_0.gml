
controller = obj_battle_controller;
depth = controller.battle_depth[7];
image_alpha = 1;
image_speed = 0;
image_index = 0;
image_blend = global.c_dump;

wspeed = 2;
curspeed = wspeed;

invtime = 0;

create(x, y, obj_battle_grazeheart);
graze = thisobj;
graze.depth = depth;