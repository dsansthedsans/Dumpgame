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
	writer("event_gabee_chase.0", -1, -1);
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
	chara_change(-1, false, false, true, false, false, true);
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
	chara_change(-1, -1, -1, -1, -1, -1, false);
	chara_facing(LEFT);
	alarm[2] = 60;
	con = 12;
}
if (con == 13)
{
	if (game.cam_x <= (chara.x - ((chara.x - m6.x) / 2) - 160))
	{
		game.cam_x = round(game.cam_x);
		alarm[2] = 45;
		con = 14;
	}
	else
		game.cam_x -= 0.5;
	screenpos(game.cam_x, game.cam_y);
}
if (con == 15)
{
	writer("event_gabee_chase.1", -1, -1);
	con = 16;
}
if (con == 16 && exists(thiswriter) == 0)
{
	audio_play(snd_blt_launch, 0, VOLUME_SOUND);
	for (var i = 0; i < 6; i++)
		bullet[i] = -1;
	for (var i = 0; i < 3; i++)
	{
		marker((m6.x - 20 + (20 * i)), (game.cam_y - 10), spr_battle_blt_kunai, 1, 1, 1, 0, 0, 0, c_white, (m6.depth + 1));
		thismarker.image_angle = point_direction(thismarker.x, thismarker.y, m6.x, m6.y);
		thismarker.direction = thismarker.image_angle;
		thismarker.speed = 4;
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
	audio_play(snd_bigcut, 0, VOLUME_SOUND, 1.5);
	shakescreen(4, 4);
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
		audio_play(snd_impact, 0, VOLUME_SOUND);
		audio_play(snd_screenshake, 0, VOLUME_SOUND, 2);
		shakescreen(6, 6);
		
		create((m6.x - 10), (m6.y - 15), obj_solid_block);
		thisobj.image_yscale = 0.75;
		
		global.flag[2] = 0;
		alarm[2] = round(45 + 7.5);
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
	alarm[2] = 15;
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
		alarm[4] = 45;
		con = 36.25;
	}
}
if (con == 36.5)
{
	audio_play(snd_eyeflash, 0, VOLUME_SOUND);
	alarm[4] = round(30 + 7.5);
	con = 36.75;
}
if (con == 37)
{
	global.flag[60] = 1;
	audio_play(snd_jump, 0, VOLUME_SOUND);
	audio_pitch(thisaudio, 0.8);
	eyes_jumpsnd = thisaudio;
	alarm[3] = round(15 + 7.5);
	con = 37.5;
}
if (con == 38)
{
	global.chara_facing = DOWN;
	with (chara)
		shakeobj_small();
	audio_play(snd_bump, 0, VOLUME_SOUND);
	alarm[2] = round(15 + 7.5);
	con = 39;
}
if (con == 40)
{
	chara_change(true, true, false, true, false, false, true);
	create(-20, -20, obj_overworld_heart);
	con = 41;
}
// chase
if (con == 41)
{
	bullet_stage = 0;
	if (chara.x <= (gate.x + 160) && gate.active == false)
		gate.active = true;
	if (chara.x >= 1400)
		bullet_stage = 1;
	if (chara.x >= 2400)
		bullet_stage = 2;
	for (var s = 0; s < 3; s++)
	{
		if (bullet_stage == s && bullet_delay[s] <= 0)
		{
			if (s == 0)// || (s == 1 && chara.x >= 2300)
			{
				create((chara.x - 130), obj_overworld_heart.y /*(200 + irandom_range(-40, 40))*/, obj_overworld_blt);
				thisobj.type = 1.0;
				bullet_time[0] -= 2;
				bullet_time[0] = clamp(bullet_time[0], 22, 32);
			}
			if (s == 1)
			{
				for (var i = 0; i < 5; i++)
				{
					create(-20, ((160 + (40 * bullet_format[1])) + (10 * i)), obj_overworld_blt);
					thisobj.type = 1.1;
				}
				bullet_format[1] = !bullet_format[1];
				bullet_time[1] -= 4;
				bullet_time[1] = clamp(bullet_time[1], 24, 48);
			}
			if (s == 2)
			{
				for (var z = 0; z < 10; z++)
				{
					for (var i = 0; i < 5; i++)
					{
						create((2300 + (10 * i) + (100 * z) + (50 * bullet_format[2])), 40, obj_overworld_blt);
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
	if (chara.x >= 3240)
	{
		chara_change(-1, false, false, true, false, false, true);
		chara.image_speed = chara.curimgspeed;
		chara_speed = chara.curspeed;
		obj_overworld_heart.canhurt = 0;
		obj_overworld_heart.disappear = 1;
		altcon = 1;
		con = 42;
	}
}
// jump
if (con == 42)
{
	chara.x += chara_speed;
	if (abs(200 - chara.y) > chara_speed)
		chara.y += (chara_speed * sign(200 - chara.y));
	else
		chara.y = 200;
	if (chara.x >= 3280)
	{
		chara_facing(-1);
		chara.sprite_index = spr_chara_r_prejump;
	}
	if (chara.x >= 3360)
	{
		chara_stop();
		chara.hspeed = (chara.rspeed[0] / 4);
		chara.vspeed = -0.85;
		chara.gravity = 0.035 / 4;
		chara.friction = 0;
		chara.sprite_index = spr_chara_r_jump;
		audio_play(snd_jump, 0, VOLUME_SOUND);
		audio_pitch(thisaudio, 0.65);
		audio_play(snd_cymbal, 0, VOLUME_SOUND);
		audio_pitch(thisaudio, 1.4);
		altcon = 0;
		con = 46;
	}
}
if (con == 46)
{
	if (chara.x >= 3495)
	{
		chara_change(-1, -1, -1, -1, -1, -1, false);
		chara.hspeed = 0;
		chara.vspeed = 0;
		chara.gravity = 0;
		chara.image_index = 0;
		chara.sprite_index = spr_chara_r_fallhold;
		with (chara)
			shakeobj_small();
		audio_stop(thisaudio);
		audio_play(snd_grab, 0, VOLUME_SOUND);
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
	audio_play(snd_bump, 0, VOLUME_SOUND);
	alarm[2] = (60 + (15 * (con - 48)));
	con += 1;
}
if (con == 54)
{
	with (chara)
		shakeobj_small();
	audio_play(snd_grab, 0, VOLUME_SOUND);
	audio_play(snd_fall, 0, VOLUME_SOUND);
	chara.hspeed = -0.1;
	chara.gravity = 0.1;
	chara.sprite_index = spr_chara_r_fall;
	con = 55;
}
if (con == 55)
{
	chara.image_blend = make_color_hsv(color_get_hue(c_white), color_get_saturation(c_white), characolorvalue);
	characolorvalue -= 4;
	if (audio_sound_get_track_position(thisaudio) >= 3)
	{
		global.flag[61] = 1;
		depth = -5000;
		audio_stop(thisaudio);
		audio_play(snd_impact2, 0, VOLUME_SOUND);
		alarm[2] = 300;
		con = 56;
	}
}
if (con == 57)
{
	writer("event_gabee_chase.3", -1, -1);
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
// Gate
if (con > 0)
{
	if (gate.object == undefined) || (exists(gate.object) == false)
	{
		gate.object = create(gate.x, gate.y, obj_solid_block);
		with (gate.object)
		{
			image_xscale = 0.5;
			image_yscale = 5;
		}
	}
	else
		gate.object.y = (gate.y - gate.height);
}