dmg = undefined;
if (variable_instance_exists(id, "sparedmg") == false)
    dmg = obj_battle_fighttarget.dmg;
controller = obj_battle_controller;
target = controller.enemy_target;

myh = 14;
myx = (controller.enemy_obj[target].orig_x - round(controller.enemy_obj[target].hpwidth / 2));
if (controller.enemy_type[target] == 6) // Broken Clock
	myx = (controller.enemy_obj[target].orig_x - controller.enemy_obj[target].hpwidth);
myy = (controller.enemy_obj[target].orig_y - controller.enemy_obj[target].sprite_height - 20 - myh);
myalpha = 0;
fade = 0;
drawbar = 1;
if (dmg != undefined)
{
    maxhp = controller.enemy_maxhp[target]; // max health points
    curhp = controller.enemy_curhp[target]; // current health points
    apphp = (controller.enemy_curhp[target] + dmg); // apparent health points
    mycolor_cur = controller.level_curbarcolor[0];
    mycolor_max = controller.level_maxbarcolor[0];
    mycolor_num = mycolor_max;
    if (dmg <= 0)
    {
        dmg = text_get("battle_fight_0");
       	if (controller.enemy_type[target] != 5 && controller.battle_group >= 7) || (controller.enemy_type[target] == 4)
       		myy = 240;
       	drawbar = 0;
       	mycolor_num = global.c_gray;
    }
}
else if (dmg == undefined)
{
    var _sign = "";
    mycolor_num = global.c_gray;
    if (sparedmg > 0)
    {
        mycolor_num = global.c_dump;
        _sign = "+";   
    }
    else if (sparedmg < 0)
    {
        mycolor_num = global.c_red;
        _sign = "-";    
    }
    dmg = $"{_sign}{abs(sparedmg)}%";
    maxhp = 100;
    apphp = controller.enemy_spare[target];
    curhp = clamp((controller.enemy_spare[target] + sparedmg), 0, maxhp);
	mycolor_cur = controller.level_curbarcolor[1];
    mycolor_max = controller.level_maxbarcolor[1];
    
}
if (controller.enemy_type[target] == 6) || (controller.enemy_type[target] == 1000) || (controller.enemy_type[target] == 2000) // Broken Clock, TROLLFACE, Toilet
	myy = 220;
x = 0;
y = 0;
depth = controller.battle_depth[2];
xstart = 0;
ystart = 0;
vspeed = (-2 * global.visualeff);
gravity = 0.125;
gravity_direction = 270;
alarm[0] = 60;