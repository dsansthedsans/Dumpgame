
dmg = obj_battle_fighttarget.dmg;
controller = obj_battle_controller;
target = controller.enemy_target;

curhp = ((controller.enemy_curhp[target] / controller.enemy_maxhp[target]) * controller.enemy_obj[target].hpwidth);
maxhp = ((controller.enemy_maxhp[target] / controller.enemy_maxhp[target]) * controller.enemy_obj[target].hpwidth);
bardmg = ((dmg / controller.enemy_maxhp[target]) * controller.enemy_obj[target].hpwidth);
curhp_width = (curhp + bardmg);

myh = 14;

myx = (controller.enemy_obj[target].orig_x - (maxhp / 2));
if (controller.enemy_type[target] == 6) // Broken Clock
	myx = (controller.enemy_obj[target].orig_x - maxhp);
	
myy = (controller.enemy_obj[target].orig_y - controller.enemy_obj[target].sprite_height - 20 - myh);
myalpha = 1;
mycolor_cur = 4845488;
mycolor_max = c_dkgrey;
mycolor_dmg = 4209120;

fade = 0;
drawbar = 1;
if (dmg <= 0)
{
	dmg = get_text("battle_fight_0");
	drawbar = 0;
	mycolor_dmg = c_ltgrey;

}

if (controller.enemy_type[target] == -2000) || (controller.enemy_type[target] == 6) || (controller.enemy_type[target] == 1000) // Toilet, Broken Clock
	myy = 220;

x = 0;
y = 0;
depth = controller.battle_depth[2];
xstart = 0;
ystart = 0;
vspeed = -2;
gravity = 0.125;
gravity_direction = 270;
alarm[0] = 60;

