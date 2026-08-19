event_inherited();
chara = obj_chara;
DEBUG_SKIP = (false * global.indebug);
if (DEBUG_SKIP == true)
{
	global.flag[66] = 1;
	global.flag[69] = 1;
}
if (global.flag[2] == false && global.flag[66] < 1 && global.flag[69] == 0)
{
	for (var t = 0; t < 3; t++)
		thing_object[t] = marker(0, 0, spr_event_rhonhey_battle_thing_0, 1, 1, 1, 0, 0, 0, c_white, -room_height);
	with (thing_object[0])
	{
		x = 40;
		y = (980 - 90);
		direction = 180;
		image_alpha = 0.5;
	}
	with (thing_object[1])
	{
		x = 260;
		y = 580;
		direction = 90;
		image_alpha = 0.5;
	}
	with (thing_object[2])
	{
		x = 160;
		y = (80 + 10);
		direction = 270;
		sprite_index = spr_event_rhonhey_battle_thing_1;
		image_speed = 1;
		image_blend = c_black;
	}
	switch (global.flag[66])
	{
		case 0:
		con = 1;
		break;
		case 0.25:
		con = 2;
		destroy(thing_object[0]);
		break;
		case 0.5:
		con = 3;
		destroy(thing_object[0]);
		destroy(thing_object[1]);
		break;
	}
}
else if (global.flag[2] == false && global.flag[66] >= 1 && global.flag[66] < 2 && global.flag[69] == 1)
{
	screenpos(0, 0);
	alarm[2] = 90;
	chara_facing(UP);
	chara_change(-1, false, false, true, false, false, false);
	chara.x = (room_width / 2);
	chara.y = global.chara_lasty;
	if (DEBUG_SKIP == true)
		chara.y = (200 + (chara.sprite_height / 2));
	m6 = marker((room_width / 2), 160, spr_m6_d_talk, 1, 1, 1, 0, 0, 0, c_white, -160);
}
else
	destroy(id);