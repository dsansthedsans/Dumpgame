
if (con == 1 && exists(m6) == 1)
{
	chara.x -= 10;
	chara.y += 10;
	chara.vspeed = -0.75;
	chara.image_speed = 0.2;
	chara.image_index = 1;
	
	m6.x += 10;
	m6.y += 10;
	m6.vspeed = -0.75;
	m6.image_speed = 0.2;
	m6.image_index = 1;
	m6.sprite_index = spr_m6_u;
	party_change(0, -1, -1);
	party_facing(0, UP);
	maxy = (1320 + 10);
	
	con = 2;
}
if (con == 2)
{
	m6.depth = -m6.bbox_bottom;
	if (chara.y <= maxy && m6.y <= maxy)
	{
		chara.y = maxy;
		chara.vspeed = 0;
		chara_stop();
	
		m6.y = maxy;
		m6.vspeed = 0;
		party_stop(0);
	
		alarm[2] = 30;
		con = 3;
	}
}
if (con == 4)
{
	writer("event_m6_precaptcha3", -1, -1);
	con = 5;
}
if (con == 5 && instance_exists(thiswriter) == 0)
{
	global.flag[52] = 1;
	chara_change(-1, true, true, false, true, true, true);
	chara_facing(DOWN);
	party_change(0, 1, RIGHT);
	destroy(id);
}










