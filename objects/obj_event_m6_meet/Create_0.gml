event_inherited();
depth = -room_height;
m6 = undefined;
cutout_active = false;
cutout_alpha = 1;
title_active = false;
title_text = ["Dumpster", "Friends"];
title_delay = [(60 * 0.5), round(60 * 1.75)];
title_length = 0;
confetti_active = false;
confetti_objects = [];
confetti_time = 180;
DEBUG_SKIP = (true * global.indebug);
if (DEBUG_SKIP == true)
{
	global.flag[66] = 2;
	global.flag[69] = 1;
}
if (global.flag[2] == false && global.flag[1] == false && global.flag[66] == 2 && global.flag[69] == true)
{
	con = 1;
	chara_facing(UP);
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	m6 = marker((room_width / 2), 135, spr_m6_d_talk, 1, 1, 1, 0, 0, 0, c_white, -160);
}
else
	instance_destroy();

