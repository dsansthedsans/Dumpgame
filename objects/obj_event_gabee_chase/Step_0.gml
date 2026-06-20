
// first dialog
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
		party_stop(0);
		alarm[2] = 60;
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
		chara_facing(RIGHT);
		party_facing(0, RIGHT);
		if (thiswriter.page >= 3)
			chara_facing(DOWN);
		if (thiswriter.page >= 2 && thiswriter.page != 4)
			party_facing(0, UP);
	}
	else
	{
		chara_facing(RIGHT);
		chara_change(-1, 1, 1, 0, 1, 1, 1);
		party_change(0, 1, DOWN);
		global.flag[59] = 1;
		con = 5;
	}
}

// second dialog/chase start
if (con == 5 && chara.x >= 720)
{
	chara_speed = chara.curspeed;
	chara_imgspeed = chara.curimgspeed;
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	chara_facing(RIGHT);
	
	party_change(0, -1, -1);
	party_facing(0, RIGHT);
	party_stop(0);
	con = 6;
}
if (con == 6)
{	
	chara.x += chara_speed;
	chara.image_speed = chara_imgspeed;
	if (chara.x >= 810)
	{
		chara_stop();
		alarm[2] = 60;
		con = 8;
	}
}
if (con == 9)
{
	chara_facing(DOWN);
	alarm[2] = 60;
	con = 10;
}
if (con == 11)
{	
	chara_facing(LEFT);
	chara_change(-1, -1, -1, -1, -1, -1, 0);
	cam_x = obj_GAME_CONTROLLER.cam_x;
	alarm[2] = 60;
	con = 12;
}
if (con == 13)
{
	if (cam_x <= (chara.x - ((chara.x - m6.x) / 2) - 160))
	{
		cam_x = round(cam_x);
		alarm[2] = 45;
		con = 14;
	}
	else
		cam_x -= 0.65;
	screenpos(cam_x, obj_GAME_CONTROLLER.cam_y);
}
if (con == 15)
{
	writer("event_gabee_chase_1", -1, -1);
	con = 16;
}
if (con == 16 && exists(thiswriter) == 0)
{
	audio_play(snd_blt_launch, 0, VOLUME_SOUND);
	for (var i = 0; i < 6; i++)
		bullet[i] = -1;
	for (var i = 0; i < 3; i++)
	{
		marker((m6.x - 20 + (20 * i)), (obj_GAME_CONTROLLER.cam_y - 10), spr_battle_blt_kunai, 1, 1, 1, 0, 0, 0, c_white, (m6.depth + 1));
		thismarker.image_angle = point_direction(thismarker.x, thismarker.y, m6.x, m6.y);
		thismarker.direction = thismarker.image_angle;
		thismarker.speed = 5;
		bullet[i] = thismarker;
	}
	con = 17;
}
if (con == 17)
{
	with (bullet[1])
	{
		if (y >= (other.m6.y - 80))
			party_facing(0, UP);
		if (place_meeting(x, (y - 20), other.m6) == 1)
			other.con = 18;
	}
}
if (con == 18)
{
	chara_facing(LEFT);
	m6.facing = -1;
	m6.sprite_index = spr_m6_u_sit;
	for (var i = 0; i < 3; i++)
	{
		destroy(bullet[i]);
		bullet[i] = -1;
	}
	audio_play(snd_bigcut, 0, VOLUME_SOUND);
	shakescreen(3, 3);
	con = 19;
}
if (con == 19)
{
	m6.y += 4;
	if (m6.y >= 240)
	{
		num = 0;
		zz = 0;
		ii = 0;
		aftercon = 1;
		
		m6.y = 240;
		m6.depth = -m6.bbox_bottom;
		m6.sprite_index = spr_m6_broken;
		with (m6)
			shakeobj_small();
		audio_play(snd_screenshake, 0, VOLUME_SOUND);
		shakescreen(5, 5);
		
		create((m6.x - 10), (m6.y - 15), obj_solid_block);
		thisobj.image_yscale = 0.75;
		
		global.flag[2] = 0;
		alarm[2] = 75;
		con = 20;
	}
}
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
	
	audio_play(snd_blt_appear, 0, VOLUME_SOUND);
	alarm[2] = 6;
	con += 1;
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
	audio_play(snd_blt_launch, 0, VOLUME_SOUND);
	con = 36;
}
if (con == 36)
{
	chara.x -= chara.rspeed[0];
	chara.image_speed = chara.rimgspeed[0];
	global.chara_facing = RIGHT;
	if (chara.x <= 760)
	{
		chara_stop();
		chara.speed = -3;
		chara.friction = 0.12;
		global.chara_facing = SIT;
		audio_play(snd_grab, 0, VOLUME_SOUND);
		alarm[4] = 60;
		con = 36.25;
	}
}
if (con == 36.5)
{
	audio_play(snd_eyeflash, 0, VOLUME_SOUND);
	alarm[4] = 45;
	con = 36.75;
}
if (con == 37)
{
	audio_play(snd_jump, 0, VOLUME_SOUND);
	audio_pitch(thisaudio, 0.8);
	eyes_jumpsnd = thisaudio;
	global.flag[60] = 1;
	alarm[3] = 40;
	con = 37.5;
}
if (con == 38)
{
	global.chara_facing = DOWN;
	with (chara)
		shakeobj_small();
	audio_play(snd_bump, 0, VOLUME_SOUND);
	cam_y = obj_GAME_CONTROLLER.cam_y;
	alarm[2] = 15;
	con = 39;
}
if (con == 40)
{
	if (cam_y < 60)
		cam_y += 2;
	else
		cam_y = 60;
	
	screenpos(cam_x, cam_y);
	if (cam_x <= (chara.x - 160))
	{
		chara_change(1, 1, 0, 0, 0, 1, 1);
		create(-20, -20, obj_overworld_heart);
		aftercon = 0;
		con = 41;
	}
	else
		cam_x -= 1;
}

// chase
if (con == 41)
{
	bullet_stage = 0;
	if (chara.x >= 1500)
		bullet_stage = 1;
	if (chara.x >= 2300)
		bullet_stage = 2;
	
	for (var s = 0; s < 3; s++)
	{
		if (bullet_stage == s && bullet_delay[s] <= 0)
		{
			if (s == 0)
			{
				create((chara.x - 130), (200 + irandom_range(-30, 30)), obj_overworld_blt);
				thisobj.type = 1.0;
				bullet_time[0] -= 2;
				bullet_time[0] = clamp(bullet_time[0], 20, 35);
			}
			if (s == 1)
			{
				for (var i = 0; i < 5; i++)
				{
					create(-20, ((160 + (40 * bullet_format[1])) + (10 * i)), obj_overworld_blt);
					thisobj.type = 1.1;
				}
				bullet_format[1] = !bullet_format[1];
				bullet_time[1] -= 8;
				bullet_time[1] = clamp(bullet_time[1], 25, 60);
			}
			if (s == 2)
			{
				for (var z = 0; z < 9; z++)
				{
					for (var i = 0; i < 5; i++)
					{
						create((2300 + (10 * i) + (100 * z) + (50 * bullet_format[2])), -20, obj_overworld_blt);
						thisobj.type = 1.2;
					}
				}
				bullet_format[2] = !bullet_format[2];	
			}
			
			audio_play(snd_blt_appear, 0, VOLUME_SOUND, , , , (1 + (0.15 * bullet_stage)));
			bullet_delay[s] = bullet_time[s];
		}
		else
			bullet_delay[s] -= 1;
	}
	
	if (chara.x >= 3160)
		con = 42;
}

// post-chase
if (con == 42)
{
	obj_overworld_heart.canhurt = 0;
	obj_overworld_heart.disappear = 1;
	chara_change(-1, 0, 0, 1, 0, 1, 1);
	movetopoint(3240, 210, 45, chara);
	chara.image_speed = chara.rimgspeed[0];
	cam_x = obj_GAME_CONTROLLER.cam_x;
	altcon = 1;
	con = 43;
}
if (con == 43)
{
	if (cam_x >= 3210)
		con = 44;
	else
		cam_x += 5;
	screenpos(cam_x, obj_GAME_CONTROLLER.cam_y);
}
if (altcon == 1 && exists(thismover) == 0)
{
	chara.x += chara.rspeed[0];
	if (chara.x >= 3300)
	{
		global.chara_facing = -1;
		chara.sprite_index = spr_chara_r_prejump;
	}
	if (chara.x >= 3330)
	{
		if (jumpsnd == 123)
		{
			audio_play(snd_jump, 0, VOLUME_SOUND);
			audio_pitch(thisaudio, 0.65);
		}
		jumpsnd = 1;
	}
	if (chara.x >= 3360)
	{
		chara_stop();
		chara.hspeed = (chara.rspeed[0] / 4);
		chara.vspeed = -0.9;
		chara.gravity = 0.035 / 4;
		chara.friction = 0;
		chara.sprite_index = spr_chara_r_jump;
		audio_play(snd_jump, 0, VOLUME_SOUND);
		audio_pitch(thisaudio, 0.65);
		audio_play(snd_startwhite, 0, VOLUME_SOUND);
		audio_pitch(thisaudio, 1.4);
		altcon = 0;
		con = 46;
	}
}
if (con == 46)
{
	if (global.chara_camera_move == 0 && chara.x >= (cam_x + 160))
		global.chara_camera_move = 1;
	if (chara.x >= 3498)
	{
		global.chara_camera_move = 0;
		chara.hspeed = 0;
		chara.vspeed = 0;
		chara.gravity = 0;
		chara.image_index = 0;
		chara.sprite_index = spr_chara_r_fallhold;
		with (chara)
			shakeobj_small();
		audio_stop(thisaudio);
		audio_play(snd_grab, 0, 0);
		alarm[2] = 120;
		con = 47;
	}
}
if (con >= 48 && con <= 52 && con % 2 == 0)
{
	chara.y += (1 * (con != 48));
	chara.image_index += (1 * (con != 48));
	with (chara)
		shakeobj_small();
	audio_play(snd_bump, 0, 0);
	alarm[2] = (60 + (15 * (con - 48)));
	con += 1;
}
if (con == 54)
{
	with (chara)
		shakeobj_small();
	audio_play(snd_grab, 0, 0);
	audio_play(snd_fall, 0, 0);
	chara.gravity = 0.1;
	chara.sprite_index = spr_chara_r_fall;
	con = 55;
}
if (con == 55)
{
	chara.image_blend = make_color_hsv(color_get_hue(c_white), color_get_saturation(c_white), characolorvalue);
	characolorvalue -= 2;
	if (audio_sound_get_track_position(thisaudio) >= 3)
	{
		global.flag[61] = 1;
		depth = -5000;
		audio_stop(thisaudio);
		audio_play(snd_impact2, 0, 0);
		alarm[2] = 300;
		con = 56;
	}
}
if (con == 57)
{
	writer("event_gabee_chase_3", -1, -1);
	con = 58;
}
if (con == 58 && exists(thiswriter) == 0)
{
	alarm[2] = 180;
	con = 59;
}
if (con == 60)
{
	room_goto(room_caverns_1);
	destroy(id);
}

if (aftercon == 1)
{
	for (var i = 0; i < bullet_length; i++)
	{
		if (bullet[i] != -1 && exists(bullet[i]) == 1)
		{
			bullet[i].image_alpha += 0.1;
			if (bullet[i].y >= (room_height + 20)) || (bullet[i].y <= -20)
				destroy(bullet[i]);
		}
	}
}




/*
if (con == 41)
{
	bullet_stage = 0;
	if (chara.x >= 1500)
		bullet_stage = 1;
	if (chara.x >= 2300)
		bullet_stage = 2;
	
	// shooting
	if (bullet_stage <= 1 && bullet_delay[0] <= 0)
	{
		create((chara.x - 130), (200 + irandom_range(-30, 30)), obj_overworld_blt);
		thisobj.type = 1.0;
		audio_stop(snd_blt_appear);
		audio_play(snd_blt_appear, 0, 0);
		bullet_delay[0] = (30 - (5 * bullet_stage));
	}
	else
		bullet_delay[0] -= 1;
	
	// wave
	if (bullet_stage == 1 && bullet_delay[1] <= 0)
	{
		for (var i = 0; i < 5; i++)
		{
			create(-20, ((160 + (40 * bullet_format[1])) + (10 * i)), obj_overworld_blt);
			thisobj.type = 1.1;
		}
		//audio_play(snd_blt_appear, 0, 0);
		
		bullet_format[1] += 1;
		if (bullet_format[1] >= 2)
			bullet_format[1] = 0;
		
		bullet_delay[1] = bullet_time;
		bullet_time -= 4;
		bullet_time = clamp(bullet_time, 30, 60);
	}
	else if (bullet_stage == 1)
		bullet_delay[1] -= 1;
	
	// bottom
	if (bullet_stage == 2 && bullet_delay[2] <= 0)
	{	
		for (var z = 0; z < 8; z++)
		{
			for (var i = 0; i < 5; i++)
			{
				create((2300 + (10 * i) + (100 * z) + (50 * bullet_format[2])), (room_height + 20 + (40 * 0)), obj_overworld_blt);
				thisobj.type = 1.2;
			}
		}
		audio_play(snd_blt_appear, 0, 0);
		
		bullet_format[2] = !bullet_format[2];
		bullet_delay[2] = 30;
	}
	else if (bullet_stage == 2)
		bullet_delay[2] -= 1;
}
*/





/*
var _xbonus = irandom_range(-150, 150);
if (chara.movex >= chara.wspeed)
	_xbonus = (150 + irandom_range(-40, 40));
var _x = (chara.x + _xbonus);
_y = choose(75, 280);
					
create(_x, _y, obj_overworld_blt);
thisobj.type = 1;
thisobj.randomdir = i;
bullet[num] = thisobj;
num += 1;
*/
				
/*
var _xbonus = irandom_range(-150, 150);
if (chara.movex >= chara.wspeed)
	_xbonus = (150 + irandom_range(-40, 40));
var _x = (chara.x + _xbonus);
_y = choose(75, 280);
var _dirbonus = 0;
if (i > 0 && (chara.movex != 0 || chara.movey != 0))
	_dirbonus = irandom_range(160, 200);
			
marker(_x, _y, spr_battle_blt_kunai, 0, 1, 1, 0, 0, 0, c_white, (chara.depth - 1));
thismarker.image_angle = point_direction(thismarker.x, thismarker.y, (chara.x + _dirbonus), (chara.y - (chara.sprite_height / 2)));
thismarker.direction = thismarker.image_angle;
thismarker.delay = 0;
bullet[num] = thismarker;
num += 1;
*/
			
			
			
			
			
			
			
			





/*
if (con == 38)
{
	global.side_facing[0] = UP;
	m6.y -= 4;
	with (m6)
		shakeobj_small();
	audio_play(snd_bump, 0, 0);
	alarm[2] = 30;
	con = 39;
}
if (con == 40)
{
	global.chara_facing = RIGHT;
	chara_stop();
	audio_play(snd_bump, 0, 0);
	alarm[2] = 30;
	con = 41;
}
if (con == 42)
{
	m6.y -= 2;
	m6.image_speed = chara.rimgspeed;
	if (m6.y <= chara.y)
	{
		global.side_facing[0] = RIGHT;
		m6.y = chara.y;
		con = 43;
	}
}
if (con == 43)
{
	m6.x += 2;
	if (m6.x >= (chara.x - 40))
		global.chara_facing = LEFT;
	if (m6.x >= (chara.x - 20))
	{
		m6.x = (chara.x - 20);
		side_stop(0);
		alarm[2] = 30;
		con = 44;
	}
}
if (con == 45)
{
	writer("event_gabee_chase_2", -1, -1);
	cam_x = obj_GAME_CONTROLLER.cam_x;
	con = 46;
}
if (con == 46 && exists(thiswriter) == 0)
{
	screenpos(cam_x, obj_GAME_CONTROLLER.cam_y);
	if (cam_x <= (chara.x - 160))
	{
		global.chara_move = 1;
		global.chara_facing = DOWN;
		global.chara_cutscene = 0;
		global.chara_openmenu = 0;
		global.chara_cameramove = 1;
	
		side_change(0, 1, 0, LEFT, RIGHT);
	
		global.flag[60] = 1;
		con = 47;
	}
	else
		cam_x -= 1;
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













