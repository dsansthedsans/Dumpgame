
active = 1;
controller = obj_battle_controller;
depth = controller.battle_depth[1];
image_speed = 0;
image_xscale = 2;
image_yscale = 2;

orig_x = x;
orig_y = y;
x -= (sprite_width / 2);
y -= sprite_height;
normal_x = x;
normal_y = y;

body = -1;
body_xdif = 0;
body_ydif = 0;

bubble_x = (x + (sprite_width / 2) + 12);
bubble_y = (y + 6);
thiswriter = 0;

orig_def = controller.enemy_def[myself];
createbubble = 0;
startattack = 0;
returnmain = 0;
usedact = 0;
spared = 0;
event_user(0);

geno = 0;
convince = 0;
bubbledelay = 0;
fightattempt = 0;

skip = 0;
if (global.indebug == true && global.debug_hud == true)
	skip = 1;
if (skip == 1)
{
	convince = 5;
	controller.enemy_spare[myself] = 100;
}