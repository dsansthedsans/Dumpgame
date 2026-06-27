
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[2] == 1 && global.flag[15] == 1 && global.flag[16] == 0 && con == 0)
	{	
		chara_change(-1, 0, 0, 1, 0, 0, 1);
		chara_stop();
		party_change(0, -1, -1);
		party_stop(0);
		party_facing(0, LEFT);
		if (x < (room_width / 2))
			party_facing(0, RIGHT);
		writer("event_m6_postcaptcha1", -1, -1);
		con = 1;
	}
	else if (con == 0)
		destroy(id);
}