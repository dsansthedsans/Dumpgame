event_inherited();
chara = obj_chara;
if (global.flag[66] < 3)
{
	con = (global.flag[66] + 1);
	for (var t = 0; t < 3; t++)
		thing_object[t] = marker(0, 0, spr_event_rhonhey_thing, 1, 1, 1, 0, clamp((t - 1), 0, 1), 0, c_white, 0);
	with (thing_object[0])
	{
		x = 40;
		y = (980 - 90);
		direction = 180;
		image_alpha = 0.35;
	}
	with (thing_object[1])
	{
		x = 260;
		y = 580;
		direction = 90;
		image_alpha = 0.35;
	}
	with (thing_object[2])
	{
		x = 160;
		y = 80;
		direction = 270;
		image_index = 1;
		image_blend = c_black;
	}
}
else
	destroy(id);