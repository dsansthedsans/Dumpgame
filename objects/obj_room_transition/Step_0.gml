if (con == 1)
{
	alpha += alpha_amt;
	if (alpha >= 1) 
	{
		room_goto(rr);
		global.inbattle = 0;
		alpha = 1;
		con = 2;
	}
}
if (con == 2)
{
	if (altcon == 1 && room == rr)
	{
		if (exists(chara) == 1)
		{
			if (xx != -1)
				chara.x = xx;
			if (yy != -1)
				chara.y = yy;
			chara.depth = -chara.bbox_bottom;
		}
		altcon = 2;
	}
	else if (altcon == 2)
	{
		if (exists(chara) == 1 && global.chara_cutscene == 0 && alpha <= 0.5)
		{
			chara_change(-1, 1, 1, -1, 1, 1, -1);
			altcon = 3;
		}
	}
	else
		altcon += 0.1;
	if (altcon >= 2)
		alpha -= alpha_amt;
	if (alpha <= 0)
	{
		global.leavingbattle = 0;
		debug("--- Changed rooms with obj_room_transition");
		destroy(id);	
	}
}