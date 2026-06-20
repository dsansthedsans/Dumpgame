
if (altcon == 1 && ((exists(obj_room_transition) == 0) || (exists(obj_room_transition) == 1 && obj_room_transition.setmove == 1)))
{
	global.chara_move = 0;
	global.chara_facing = UP;
	global.chara_cutscene = 0;
	altcon = 0;
}	
if (con == 1)
{
	alarm[2] = 60;
	con = 2;	
}
if (con == 3 && gate_y[0] == 180)
{
	alarm[2] = 60;
	con = 4;
}
if (con == 5)
{
	global.chara_cutscene = 1;
	writer("event_bc_postbattle_0", -1, -1);
	con = 9;
}
if (con == 9 && exists(thiswriter) == 0)
{
	bc.hspeed = 4;
	if (bc.x >= (room_width + 20))
	{
		bc.hspeed = 0;
		alarm[2] = 120;
		aftercon = 0;
		con = 10;
	}	
}
if (con == 11)
{	
	global.chara_cutscene = 1;
	marker(-20, 160, spr_m6_r, 1, 1, 1, 0.25, 1, 0, c_white, -999);
	m6 = thismarker;
	m6.hspeed = 2;
	con = 12;
}
if (con == 12 && m6.x >= (chara.x - 20))
{
	m6.x = (chara.x - 20);
	m6.hspeed = 0;
	m6.image_speed = 0;
	m6.image_index = 0;
	alarm[2] = m6time;
	con = 13;
}
if (con == 14) || (con == 16) || (con == 18) || (con == 20) || (con == 22)
{
	var _spr = m6.sprite_index;
	
	if (con == 14)
		_spr = spr_m6_u;
	else if (con == 16)
		_spr = spr_m6_d;
	else if (con == 18)
		_spr = spr_m6_l;
	else if (con == 20)
		_spr = spr_m6_r;
		
	m6.sprite_index = _spr;
	
	alarm[2] = m6time;
	con += 1;
	if (con == 23)
		con += 2;
}
if (con == 26)
{
	m6.sprite_index = spr_m6_d_talk;
	alarm[2] = 45;
	con = 27;
}
if (con == 28)
{
	writer("event_bc_postbattle_1", -1, -1);
	mee6dist = abs(chara.y - m6.y)
	con = 29;
}
if (con == 29 && exists(thiswriter) == 0)
{
	m6.vspeed = 1;
	m6.image_speed = 0.25;
	m6.sprite_index = spr_m6_d;
	
	var _curdist = abs(chara.y - m6.y);
	if (_curdist <= (mee6dist / 2))
		global.chara_facing = LEFT;
	
	if (m6.y >= chara.y)
	{
		m6.vspeed = 0;
		m6.image_speed = 0;
		m6.image_index = 0;
		m6.y = chara.y;
		alarm[4] = 30;
		con = 30;
	}
}
if (con == 30.25)
{
	m6.sprite_index = spr_m6_r_talk;
	alarm[3] = 30;
	con = 32.5;
}
if (con == 33)
{
	writer("event_bc_postbattle_2", -1, -1);
	con = 34;	
}
if (con == 34 && exists(thiswriter) == 0)
{	
	global.flag[2] = 1;
	side_create(m6.x, m6.y, "m6");
	side_change(0, 0, 0, -1, -1);
	
	alarm[2] = 5;
	con = 35;
}
if (con == 36)
{
	global.chara_facing = DOWN;
	side_change(0, 1, 0, LEFT, RIGHT);
	alarm[2] = 1;
	con = 37;	
}
if (con == 38)
{
	global.flag[39] = 1;
	global.chara_move = 1;
	global.chara_cutscene = 0;
	global.chara_interact = 1;
	global.chara_encounter = 0;
	
	global.achievement[ACHIEVEMENT_BCWIN] = 1;
	create_notification("bcwin");
	
	var _snd = -1;
	if (global.chara_murder == 3)
		_snd = snd_murder;
	else if (global.chara_murder == 2)
		_snd = snd_murder_cancel;
	if (_snd != -1)
		audio_play(_snd, 0, 0);
	
	destroy(m6);
	if (global.flag[38] == 0)
		destroy(bc);
	destroy(id);
	
	con = 39;
}

// bc movement
if (aftercon == 1)
{
	bcsiner += 0.1;
	bc.vspeed = (sin(bcsiner) * 0.25);	
}