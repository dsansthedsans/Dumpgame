
if (aftercon == 1 && exists(thismover) == 0)
{
	chara_stop();
	chara_facing(UP);
	party_stop(0);
	party_facing(0, UP);
	aftercon = 0;
}

if (con == 1)
{
	screenpos(0, cam_y);
	if (cam_y <= cam_targety[0])
	{
		alarm[2] = 30;
		con = 2;
	}
	else
		cam_y -= cam_spd;
}
if (con == 3)
{
	writer("event_m6_precaptcha2", -1, -1);
	con = 4;	
}
if (con == 4 && exists(thiswriter) == 0)
{
	screenpos(0, cam_y);
	if (cam_y >= cam_targety[1])
	{
		global.flag[35] = 1;
		chara_facing(DOWN);
		chara_change(1, 1, 1, 0, 1, 1, 1);
		party_change(0, 1, RIGHT);
		destroy(id);
	}
	else
		cam_y += cam_spd;
}