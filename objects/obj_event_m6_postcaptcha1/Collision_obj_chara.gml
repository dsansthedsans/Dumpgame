
if (global.chara_move == 1 && global.chara_menu == 0 && global.chara_cutscene == 0)
{
	if (global.flag[2] == 1 && global.flag[15] == 1 && global.flag[16] == 0 && con == 0)
	{	
		global.chara_move = 0;
		global.chara_cutscene = 1;
		chara_stop();

		global.side_facing[0] = LEFT;
		if (x < (room_width / 2))
			global.side_facing[0] = RIGHT;
		side_change(0, 0, 0, -1, -1);
		side_stop(0);
		
		writer("event_m6_postcaptcha1", -1, -1);
		con = 1;
	}
	else if (con == 0)
		destroy(id);
}