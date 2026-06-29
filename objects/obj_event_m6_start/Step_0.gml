
if (con == 1)
{
	m6.vspeed = -0.2;
	if (m6.y <= (120 - 15))
	{
		m6.y = floor(m6.y);
		m6.vspeed = 0;
		alarm[4] = 15;
		con = 2;
	}
}
if (con == 2.25)
{
	surprise(m6);
	audio_play(snd_surprise, 0, VOLUME_SOUND);
	chara_facing(UP);
	alarm[3] = 45;
	con = 2.5;
}
if (con == 3)
{
	if (exists(thissurprise) == 1)
		destroy(thissurprise);
	m6.vspeed = 0.9;
	if (m6.y >= 119)
	{
		m6.y = round(m6.y);
		m6.vspeed = 0;
		m6.hspeed = -0.3;
		m6.sprite_index = spr_m6_d_talk;
		con = 4;
	}
}
if (con == 4 && m6.x <= m6xpoint)
{
	m6.x = m6xpoint;
	m6.hspeed = 0;
	m6.image_speed = 0;
	m6.image_index = 0;
	alarm[2] = 45;
	con = 5;
}
if (con == 6)
{
	writer("event_m6_start_0", -1, -1);
	con = 7;
}
if (con == 7 && exists(thiswriter) == 0)
{
	global.flag[1] = 0.5;
	alarm[2] = 45;
	con = 8;
}
if (con == 9)
{
	m6.sprite_index = spr_m6_l;	
	alarm[2] = 30;
	con = 10;
}
if (con == 11)
{
	m6.hspeed = -m6spd;
	m6.image_speed = m6imgspd;
	m6.image_index = 1;
	con = 12;
}
if (con == 12 && m6.x <= (room_width / 2))
{
	m6.x = (room_width / 2);
	m6.hspeed = 0;
	m6.image_speed = 0;
	m6.image_index = 0;
	alarm[2] = 45;
	con = 13;
}
if (con == 14)
{
	m6.x -= 1;
	m6.sprite_index = spr_m6_d_talk;
	alarm[2] = 30;
	con = 15;
}
if (con == 16)
{
	global.flag[1] = 0.75;
	writer("event_m6_start_1", -1, -1);
	con = 18;
}
if (con == 18 && exists(thiswriter) == 0)
{
	global.flag[1] = 0.5;
	alarm[3] = 60;
	con = 18.5;
}
if (con == 19)
{
	m6.sprite_index = spr_m6_r;
	alarm[3] = 45;
	con = 19.5;
}
if (con == 20)
{
	m6.hspeed = (m6spd / 1.5);
	m6.image_speed = m6imgspd;
	m6.image_index = 1;
	con = 21;
}
if (con == 21 && m6.x >= m6xpoint)
{
	m6.hspeed = 0;
	m6.image_speed = 0;
	m6.image_index = 0;
	m6.sprite_index = spr_m6_r_talk;
	alarm[2] = 45;
	con = 22;
}
if (con == 23)
{
	writer("event_m6_start_2", -1, -1);
	con = 24;
}
if (con == 24 && exists(thiswriter) == 0)
{
	m6.hspeed = -(m6spd * 2);
	m6.image_speed = (m6imgspd * 2);
	m6.image_index = 1;
	m6.sprite_index = spr_m6_l;
	con = 25;
}	
if (con == 25 && m6.x <= (room_width / 2))
{
	m6.x = (room_width / 2);
	m6.hspeed = 0;
	m6.image_speed = 0;
	m6.image_index = 0;
	m6.sprite_index = spr_m6_d_talk;
	writer("event_m6_start_3", -1, -1);
	con = 26;
}
if (con == 26)
{
	if (exists(thiswriter) == 1)
	{
		if (thiswriter.page >= (8 + thiswriter.question_result[8]) && thiswriter.question_result[8] > 0)
			global.flag[1] = 0.75;
	}
	else
	{
		m6.depth = -999;
		m6.hspeed = -(m6spd * 1.5);
		m6.image_speed = (m6imgspd * 1.5);
		m6.image_index = 1;
		m6.sprite_index = spr_m6_l;
		con = 27;
	}
}
if (con == 27 && m6.x <= (chara.x - 20))
{
	m6.x = (chara.x - 20);
	m6.hspeed = 0;
	m6.vspeed = (m6spd * 1.5);
	m6.sprite_index = spr_m6_d;
	
	if (m6.y >= (chara.y - 20))
		chara_facing(LEFT);
	
	if (m6.y >= chara.y)
	{
		m6.y = chara.y;
		m6.vspeed = 0;
		m6.image_speed = 0;
		m6.image_index = 0;
		alarm[2] = 30;
		con = 29;	
	}
}
if (con == 30)
{
	m6.sprite_index = spr_m6_r_talk;
	alarm[2] = 30;
	con = 31;
}
if (con == 32)
{
	writer("event_m6_start_4", -1, -1);
	con = 33;
}
if (con == 33 && exists(thiswriter) == 0)
{	
	party_create(m6.x, m6.y, "m6", LEFT);
	global.flag[2] = 1;
	
	alarm[2] = 5;
	con = 35;
}
if (con == 36)
{
	chara_facing(DOWN);
	//party_change(0, 1, 0, LEFT, RIGHT);
	alarm[2] = 1;
	con = 37;
}
if (con == 38)
{
	global.flag[1] = 1;
	chara_change(-1, 1, 1, 0, 1, 1, 1);
	destroy(m6);
	destroy(id);
	con = 39;
}