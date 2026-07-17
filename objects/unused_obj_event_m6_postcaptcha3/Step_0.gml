
if (con == 1)
{
	chara.y -= 2;
	if (chara.y <= 340)
	{
		chara.image_speed = chara.wimgspeed;
		con = 2;
	}
}
if (con == 2)
{
	chara.y -= 1;
	chara.depth = -chara.bbox_bottom;
	if (chara.y <= 310)
	{
		movetopoint(150, 290, 30, chara);
		
		side_change(0, 0, 0, -1, -1);
		movetopoint(170, 290, 30, m6);
		con = 3;
	}
}
if (con == 3 && exists(obj_movetopoint) == 0)
{
	chara.x = 150;
	chara.y = 290;
	chara_stop();
	
	m6.x = 170;
	m6.y = 290;
	side_stop(0);
	
	alarm[2] = 60;
	con = 6;
}
if (con == 7)
{
	writer("event_m6_postcaptcha3", -1, -1);
	global.side_facing[0] = LEFT;
	con = 8;
}
if (con == 8 && exists(thiswriter) == 0)
{
	if (obj_captcha3.timer[0] >= 30 && global.achievement[ACHIEVEMENT_PUZZLEMASTER] == 0)
	{
		global.achievement[ACHIEVEMENT_PUZZLEMASTER] = 1;
		create_notification("puzzlemaster");
	}
			
	global.flag[53] = 1;
	global.chara_move = 1;
	global.chara_facing = DOWN;
	global.chara_cutscene = 0;
	global.chara_openmenu = 1;
	global.chara_canpause = 1;
	side_change(0, 1, 0, RIGHT, LEFT);
	destroy(id);
}


























