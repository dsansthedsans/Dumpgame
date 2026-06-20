
if (global.chara_move == 1 && global.chara_menu == 0 && global.chara_cutscene == 0)
{
	if (global.flag[2] == 1 && global.flag[34] == 1 && global.flag[42] == 0 && con == 0)
	{
		chara = obj_chara;
		global.chara_move = 0;
		global.chara_cutscene = 1;
		chara_stop();
		
		m6 = global.side[0];
		side_change(0, 0, 0, -1, -1);
		side_stop(0);
		
		writer("event_m6_postcaptcha2", -1, -1);
		con = 1;
	}
	else if (con == 0)
		instance_destroy();
}