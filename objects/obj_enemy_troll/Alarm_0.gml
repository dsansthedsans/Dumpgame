
active = 1;
controller = obj_battle_controller;
depth = controller.battle_depth[1];
image_speed = 0;
image_xscale = 2;
image_yscale = 2;

orig_x = x;
orig_y = y;
//x -= (sprite_width / 2);
//y -= sprite_height;
normal_x = x;
normal_y = y;

body = -1;
body_xdif = (sprite_width / 2);
body_ydif = sprite_height;

//bubble_x = (x + sprite_width - 20);
//bubble_y = (y + (sprite_height / 2));
bubble_x = (x + (sprite_width / 2) + 20);
bubble_y = (y - sprite_height);
if (controller.battle_group == 0)
{	
	
}

orig_def = controller.enemy_def[myself];
createbubble = 0;
startattack = 0;
returnmain = 0;
usedact = 0;
spared = 0;
event_user(0);