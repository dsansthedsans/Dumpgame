
if (con == 1)
{
	chara.depth = -chara.bbox_bottom;
	m6.depth = -m6.bbox_bottom;
	
	if (exists(obj_movetopoint) == 0)
	{
		chara.x = 150;
		chara.y = 110;
		chara_facing(UP);
		chara_stop();
		
		m6.x = 170;
		m6.y = 110;
		party_facing(0, UP);
		party_stop(0);
		
		alarm[2] = 60;
		con = 5;
	}
}
if (con == 6)
{
	global.flag[40] = 1;
	shakescreen(4, 0);
	audio_play(snd_impact, 0, VOLUME_SOUND);
	alarm[2] = 80;
	con = 7;
}
if (con == 8)
{
	writer("event_m6_dummydoor", -1, -1);
	con = 9;
}
if (con == 9 && exists(thiswriter) == 0)
{
	global.chara_curhp = global.chara_maxhp;
	chara_facing(DOWN);
	chara_change(-1, 1, 1, 0, 1, 1, 1);
	
	party_change(0, 1, RIGHT);
	//party_change(0, 1, 0, RIGHT, LEFT);
	
	destroy(id);
}