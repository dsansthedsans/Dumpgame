event_inherited();
chara = obj_chara;
if (global.flag[66] < 1)
{
	for (var t = 0; t < 3; t++)
		thing_object[t] = marker(0, 0, spr_event_rhonhey_thing_0, 1, 1, 1, 0, 0, 0, c_white, -room_height);
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
		sprite_index = spr_event_rhonhey_thing_1;
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
else
	destroy(id);