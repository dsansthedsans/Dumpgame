event_inherited();
depth = -room_height;
m6 = undefined;
m6_stepstage = 1;
m6_stepsound = 0;
cutout_active = false;
cutout_alpha = 1;
cutout_alphaTarget = 1;
cutout_alphaSpeed = 0.075;
title_active = false;
title_text = ["Dumpster", "Friends"];
title_delay = [(60 * 0.5), round(60 * 1.75)];
title_length = 0;
confetti_active = false;
confetti_objects = [];
confetti_time = 180;
teach_active = false;
teach_activePage = undefined;
teachBg_sprite = spr_event_m6_meet_teach;
teachBg_offsetX = 0;
teachBg_offsetY = 0;
teachBg_offsetSpeed = 0.125;
teachBg_alpha = 0;
teachBg_alphaTarget = (0.5 + 0.125);
teachBg_alphaSpeed = 0.025;
teachInfo_sprite = spr_event_m6_meet_teachIcon_placeholder;
teachInfo_length = 0;
teachInfo_lengthMax = 3;
teachInfo_alpha = [0, 0, 0];
teachInfo_alphaTarget = [1, 1, 1];
teachInfo_alphaSpeed = 0.05;
teachInfo_textColor = [(#748CAB), (#4986B7), merge_color(c_yellow, c_white, 0.5)];
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
	party_create(-20, -20, "m6", -1);
	m6 = global.party[0];
	//m6 = marker((room_width / 2), 135, spr_m6_d_defaultTalk, 1, 1, 1, 0, 0, 0, c_white, -160);
}
else
	instance_destroy();

