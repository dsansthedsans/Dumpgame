if (global.chara_move == true && global.chara_cutscene == false && global.flag[2] == true && global.flag[20] == false)
{
	if (global.flag[74] == false)
	{
		global.flag[74] = true;
		chara_change(-1, false, false, true, false, false, -1);
		chara_stop();
		party_change(0, -1, -1);
		party_facing(0, RIGHT);
		writer("event_m6_bowl");
		con = 1;
	}
	else if (con == 0)
		destroy(id);
}