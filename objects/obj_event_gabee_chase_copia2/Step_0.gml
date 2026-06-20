
if (con == 1)
{
	if (exists(chara_mover) == 1) || (exists(m6_mover) == 1)
	{
		chara.depth = -chara.bbox_bottom;
		m6.depth = -m6.bbox_bottom;
	}
	else
	{
		roundpos(chara);
		roundpos(m6);
		chara_stop();
		side_stop(0);
		alarm[2] = 45;
		con = 2;
	}
}
if (con == 3)
{
	writer("event_gabee_chase_0", -1, -1);
	con = 4;	
}
if (con == 4)
{
	if (exists(thiswriter) == 1)
	{
		if (thiswriter.page >= 2)
			global.side_facing[0] = UP;
		if (thiswriter.page >= 3)
			global.chara_facing = DOWN;
	}
	else
	{
		global.chara_move = 1;
		global.chara_facing = RIGHT;
		global.chara_cutscene = 0;
		side_change(0, 1, 0, DOWN, RIGHT);
		global.flag[59] = 1;
		con = 5;
	}
}











if (con == 5 && chara.x >= 720)
{
	chara_speed = chara.curspeed;
	chara_imgspeed = chara.curimgspeed;
	global.chara_move = 0;
	global.chara_facing = RIGHT;
	global.chara_cutscene = 1;
	
	side_change(0, 0, 0, -1, -1);
	global.side_facing[0] = RIGHT;
	side_stop(0);
	con = 6;
}
if (con == 6)
{	
	chara.x += chara_speed;
	chara.image_speed = chara_imgspeed;
	if (chara.x >= 810)
	{
		chara_stop();
		alarm[2] = 45;
		con = 8;
	}
}
if (con == 9)
{
	global.chara_facing = DOWN;
	alarm[2] = 30;
	con = 10;
}
if (con == 11)
{	
	global.chara_facing = LEFT;
	global.chara_cameramove = 0;
	cam_x = obj_GAME_CONTROLLER.cam_x;
	alarm[2] = 45;
	con = 12;
}
if (con == 13)
{
	if (cam_x <= (chara.x - ((chara.x - m6.x) / 2) - 160))
	{
		alarm[2] = 45;
		con = 14;
	}
	else
		cam_x -= 1;
	screenpos(cam_x, obj_GAME_CONTROLLER.cam_y);
}
if (con == 15)
{
	writer("event_gabee_chase_1", -1, -1);
	con = 16;
}
if (con == 16 && exists(thiswriter) == 0)
{
	global.side_facing[0] = UP;
	audio_play(snd_blt_launch, 0, 0);
	for (var i = 0; i < 6; i++)
		bullet[i] = -1;
	for (var i = 0; i < 3; i++)
	{
		marker((m6.x - 20 + (20 * i)), (obj_GAME_CONTROLLER.cam_y - 10), spr_battle_blt_kunai, 1, 1, 1, 0, 0, 0, c_white, (m6.depth + 1));
		thismarker.image_angle = point_direction(thismarker.x, thismarker.y, m6.x, m6.y);
		thismarker.direction = thismarker.image_angle;
		thismarker.speed = 6;
		bullet[i] = thismarker;
	}
	con = 17;
}
if (con == 17)
{
	with (bullet[1])
	{
		if (place_meeting(x, (y - 20), other.m6) == 1)
			other.con = 18;
	}
}
if (con == 18)
{
	global.chara_facing = LEFT;
	global.side_facing[0] = UP_SIT;
	for (var i = 0; i < 3; i++)
	{
		destroy(bullet[i]);
		bullet[i] = -1;
	}
	audio_play(snd_bigcut, 0, 0);
	shakescreen(3, 3);
	con = 19;
}
if (con == 19)
{
	m6.y += 4;
	if (m6.y >= 240)
	{
		m6.y = 240;
		audio_play(snd_screenshake, 0, 0);
		shakescreen(5, 5);
		alarm[2] = 45;
		con = 20;
	}
}












/*
num = 0;
zz = 0;
ii = 0;
aftercon = 1;
		
		

if (con >= 21 && con % 2 == 1 && con <= 31)
{
	var _y = (chara.y - chara.sprite_height - 30);
	if (zz == 1)
		_y = (chara.y + 30)
	marker((chara.x - 20 + (20 * ii)), _y, spr_battle_blt_kunai, 0, 1, 1, 0, 0, 0, c_white, (chara.depth - 1));
	thismarker.image_angle = point_direction(thismarker.x, thismarker.y, chara.x, (chara.y - (chara.sprite_height / 2)));
	thismarker.direction = thismarker.image_angle;
	bullet[num] = thismarker;
	
	if (ii == 2)
	{
		global.chara_facing = UP;
		if (zz == 1)
			global.chara_facing = DOWN;
	}
	
	ii += 1;
	if (ii == 3)
	{
		ii = 0;
		zz = 1;
	}
	num += 1;
	
	audio_play(snd_blt_appear, 0, 0);
	alarm[2] = 6;
	con += 1;
	
	// 21, 23, 25, 27, 29, 31
}
if (con == 33)
{
	alarm[2] = 24;
	con = 34;
}
if (con == 35)
{
	for (var i = 0; i < 6; i++)
		bullet[i].speed = 6;
	audio_play(snd_blt_launch, 0, 0);
	con = 36;
}
if (con == 36)
{
	chara.x -= chara.rspeed;
	chara.image_speed = chara.rimgspeed;
	global.chara_facing = LEFT;
	if (chara.x <= 760)
	{
		chara_stop();
		alarm[2] = 15;
		con = 37;
	}
}
if (con == 38)
{
	global.chara_facing = RIGHT;
}

if (aftercon == 1)
{
	for (var i = 0; i < 6; i++)
	{
		if (bullet[i] != -1)
			bullet[i].image_alpha += 0.1;
	}	
}
*/











/*
if (con == 35)
{
	for (var i = 0; i < 6; i++)
		bullet[i].speed = 6;
	audio_play(snd_blt_launch, 0, 0);
	chara.speed = -4;
	chara.friction = 0.12;
	chara.image_speed = 0.35;
	global.chara_facing = RIGHT;
	con = 36;
}
if (con == 36 && chara.speed >= -0.25)
{
	chara.speed = 0;
	chara.friction = 0;
	chara_stop();
	debug(chara.x);
}
*/


/*
if (con == 5 && chara.x >= 720)
{
	global.chara_move = 0;
	global.chara_facing = RIGHT;
	global.chara_cutscene = 1;
	chara_stop();
	
	side_change(0, 0, 0, -1, -1);
	global.side_facing[0] = RIGHT;
	movetopoint(780, 200, 45, m6);
	m6.image_speed = 0.35;
	m6_mover = thismover;
	con = 6;
}
if (con == 6)
{
	if (exists(m6_mover) == 1)
		m6.depth = -m6.bbox_bottom;
	else
	{
		roundpos(m6);
		side_stop(0);
		alarm[2] = 45;
		con = 7;
	}
}
*/











/*
if (con == 8)
{
	writer("event_gabee_chase_1", -1, -1);
	con = 9;
}
if (con == 9 && exists(thiswriter) == 0)
{
	alarm[2] = 45;
	con = 10;
}
if (con == 11)
{
	global.side_facing[0] = DOWN;
	alarm[2] = 45;
	con = 12;
}
if (con == 13)
{
	global.side_facing[0] = LEFT;
	alarm[2] = 45;
	con = 14;
}
if (con == 15)
{
	writer("event_gabee_chase_2", -1, -1);
	con = 16;	
}
if (con == 16 && exists(thiswriter) == 0)
{
	global.chara_facing = UP;
	global.side_facing[0] = UP;
	audio_play(snd_blt_launch, 0, 0);
	for (var i = 0; i < 3; i++)
	{
		marker((m6.x - 20 + (20 * i)), (obj_GAME_CONTROLLER.cam_y - 10), spr_battle_blt_kunai, 1, 1, 1, 0, 0, 0, c_white, (m6.depth + 1));
		thismarker.image_angle = point_direction(thismarker.x, thismarker.y, m6.x, m6.y);
		thismarker.direction = thismarker.image_angle;
		thismarker.speed = 6;
		bullet[i] = thismarker;
	}
	con = 17;
}
if (con == 17)
{
	with (bullet[1])
	{
		if (place_meeting(x, (y - 20), other.m6) == 1)
			other.con = 18;
	}
}
if (con == 18)
{
	global.side_facing[0] = UP_SIT;
	for (var i = 0; i < 3; i++)
		destroy(bullet[i]);
	audio_play(snd_bigcut, 0, 0);
	shakescreen(3, 3);
	con = 19;
}
if (con == 19)
{
	m6.y += 4;
	if (m6.y >= 240)
	{
		m6.y = 240;
		audio_play(snd_screenshake, 0, 0);
		shakescreen(5, 5);
		alarm[2] = 60;
		con = 20;
	}
}






*/













