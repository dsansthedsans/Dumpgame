
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

bubble_x = (x + sprite_width - 20);
bubble_y = (y + (sprite_height / 2));
if (controller.battle_group >= 7)
{	
	bubble_x = orig_x;
	bubble_y = (y - 8);
}

orig_def = controller.enemy_def[myself];
createbubble = 0;
startattack = 0;
returnmain = 0;
usedact = 0;
spared = 0;
event_user(0);

tookslime = 0;
punched = 0;