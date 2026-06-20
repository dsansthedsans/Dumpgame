
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[1] == 0 && global.flag[2] == 0 && con == 0)
	{
		marker(210, 115, spr_m6_sit, 1, 1, 1, 0, 0, 0, c_white, 0);
		m6 = thismarker;
		m6spd = 0.5;
		m6imgspd = 0.15;
		m6xpoint = 178;
		
		chara = obj_chara;
		chara_change(-1, 0, 0, 1, 0, 0, 1);
		chara_stop();
		
		con = 1;
	}
	else if (con == 0)
		destroy(id);
}