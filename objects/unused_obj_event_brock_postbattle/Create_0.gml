
event_inherited();

if (global.flag[37] == 1 && global.flag[39] == 0 && con == 0)
{
	altcon = 1;
	m6time = 30;
	chara = obj_chara;
	if (global.flag[38] == 0)
	{
		marker(160, 121, spr_npc_brock, 1, 1, 1, 0, 0, 0, c_white, -999);
		brock = thismarker;
		brocksiner = 0;
		aftercon = 1;
		con = 1;
	}
	else
	{
		alarm[3] = 80;
		alarm[2] = 260;
		con = 9.5;
	}
	
	gate_spr = spr_overworld_sidegate;
	gate_w = sprite_get_width(gate_spr);
	gate_x[0] = 40;
	gate_y[0] = 80;
	gate_x[1] = 270;
	gate_y[1] = 80;
	gate_yamt = 1;
	
	global.flag_skipboss = 0;
}
else if (con == 0)
	instance_destroy();