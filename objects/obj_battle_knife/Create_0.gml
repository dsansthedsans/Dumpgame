
controller = obj_battle_controller;
target = controller.enemy_target;
enemy = controller.enemy_obj[target];
enemyx = enemy.x;
enemyy = enemy.y;

x = enemy.orig_x;
y = (enemy.orig_y - (enemy.sprite_height / 2));

depth = controller.battle_depth[2];
image_blend = 4209120;

// set scale
targetx = obj_battle_fighttarget.x;
if (targetx > 320)
	targetx = (640 - obj_battle_fighttarget.x);
truescale = (1.6 * (targetx / 320));
apparentscale = 1;
if (truescale > 1)
	apparentscale = 1.6;
if (truescale < 1 && truescale > 0.5)
{
	apparentscale = 1;
	image_speed = 1.5;
}
if (truescale < 0.5 && truescale > 0) || (truescale <= 0)
{
	apparentscale = 0.5;
	image_speed = 2;
}
image_xscale = apparentscale;
image_yscale = apparentscale;

sound_pitch = 1;

// custom
if (controller.enemy_type[target] == 6 && controller.enemy_spare[target] >= 100)
{
	x = enemy.body.x;
	y = enemy.body.y;
	image_speed = 0.75;
	image_xscale = 1.8;
	image_yscale = 1.8;
	sound_pitch = 0.75;
}

audio_play(snd_battle_knife_hit, 0, VOLUME_SOUND, , , , sound_pitch);

// other
/*
if (global.enemy_dodge[target] == 1) || (global.enemy_type[target] == 6)
{
	image_speed = 1;
	image_xscale = 1.6;
	image_yscale = 1.6;
}
if (global.enemy_type[target] == 6)
{
	if (global.enemy_obj[target].killable == 0)
	{
		x = (global.enemy_obj[target].orig_x + irandom_range(-150, 150));	
		y = (global.enemy_obj[target].orig_y + irandom_range(-150, 150));	
	}
	else
	{
		x = round(enemyx);
		y = round(enemyy - 10);	
	}
}
if (global.enemy_type[target] == 1000)
	y = round(global.enemy_obj[global.mytarget].y + sprite_get_height(global.enemy_obj[global.mytarget].sprite_index) + 40);
*/


