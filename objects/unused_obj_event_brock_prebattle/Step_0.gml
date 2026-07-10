if (altcon == 1)
{
	movetopoint(500, 280, 45, chara);
	movetopoint(415, 255, 45, m6);
	chara.image_speed = 0.25;
	chara.image_index = 1;
	m6.image_speed = 0.25;
	m6.image_index = 1;
	m6dist = point_distance(m6.x, m6.y, 80, 170);
	altcon = 3;
}
if (con == 1)
{
	var _xx = 500;
	var _yy = 200;
	var _spd = 0.1;
	brock.x = lerp(brock.x, _xx, _spd);
	brock.y = lerp(brock.y, _yy, _spd);
	brock.image_alpha = lerp(brock.image_alpha, 1, _spd*2);
	brock.image_xscale = lerp(brock.image_xscale, 1, _spd*2);
	brock.image_yscale = lerp(brock.image_yscale, 1, _spd*2);
	if (point_distance(brock.x, brock.y, _xx, _yy) <= 5)
	{
		brock.image_alpha = 1;
		brock.image_xscale = 1;
		brock.image_yscale = 1;
		aftercon = 2;
		con = 4;
	}
}
if (con >= 1)
{
	with (obj_GAME_CONTROLLER)
	{
		cam_x = lerp(cam_x, 340, (cam_spd / 4));
		cam_y = lerp(cam_y, 70, (cam_spd / 4));
	}
	brock.depth = -room_height;
	for (var i = 0; i < brickamount; i++)
	{
		if (exists(brick[i]) == 1)
		{
			brick[i].image_angle += (2 * brickanglemult[i]);
			if (brick[i].y >= (room_height / 2))
				destroy(brick[i]);
		}
	}
}
if (con == 3 && exists(brock) == true && brock.vspeed == 0)
{
	brock.x = round(brock.x);
	brock.y = round(brock.y);
	brock.friction = 0;
	con = 4;
	//if (global.flag_skipboss == 1)
	//{
	//	alarm[3] = 60;
	//	con = 12.5;	
	//}
}
if (aftercon == 2)
{
	brocksiner += 0.1;
	brock.vspeed = (sin(brocksiner) * 0.5);	
}
if (altcon == 3)
{
	if (exists(obj_movetopoint) == 1)
	{
		if (point_distance(m6.x, m6.y, 80, 170) <= (m6dist / 2))
			global.party_facing[0] = RIGHT;
	}
	else
	{
		chara.x = round(chara.x);
		chara.y = round(chara.y);
		m6.x = round(m6.x);
		m6.y = round(m6.y);
		chara_stop();
		party_stop(0);
		global.party_facing[0] = RIGHT;
		altcon = 4;
	}
}
if (con == 4 && altcon == 4)
{
	altcon = 0;
	alarm[2] = 80;
	con = 5;
}
if (con == 6)
{
	global.flag[37] = 0.5;
	writer("event_brock_prebattle_0", -1, -1);
	con = 7;
}
if (con == 7 && exists(thiswriter) == 0)
{
	var _xx = 470;
	var _yy = 220;
	var _spd = 0.225;
	brock.x = lerp(brock.x, _xx, _spd);	
	brock.y = lerp(brock.y, _yy, _spd);
	var _dist = point_distance(brock.x, brock.y, _xx, _yy);
	if (_dist <= 1)
	{
		global.chara_facing = LEFT;
		shakeobj(brock, 0.5, 0.5, 0.01);
		aftercon = 0;
		altcon = 8;
		con = 9;
	}
	/*
	if (altcon == 0)
	{
		alarm[8] = 10;
		altcon = 6;
	}
	*/
}
if (altcon == 8)
{
	if (shock_delay <= 0)
	{
		var _rdpos = irandom_range(-3, 3);
		marker((shock_x + _rdpos), (shock_y + _rdpos), spr_npc_brock_shockblt, 1, 1, 1, 1, irandom(12), 0, c_white, -999);
		shockblt = thismarker;
		shockblt.direction = point_direction(shockblt.x, shockblt.y, m6.x, (m6.y - (m6.sprite_height / 2))) + irandom_range(-2, 2);
		shockblt.image_angle = (direction + 90);
		shockblt.speed = 4;
		audio_play(snd_shock_blt, 0, VOLUME_SOUND);
		shock_amount -= 1;
		if (shock_amount <= 0)
		{
			aftercon = 2;
			altcon = 0;
		}
		else
			shock_delay = shock_delay_orig;
	}
	else
		shock_delay -= 1;
}
if (con == 9)
{
	with (m6)
	{
		if (place_meeting(x, y, obj_marker) == 1)
		{
			global.flag[2] = 0;
			global.party[0] = -1;
			shakescreen(3, 3);
			explosion(x, (y - (sprite_height / 2)));
			if (global.chara_murder < 2)
			{
				surprise(obj_chara);
				other.chara_surprise = thismarker;
			}
			other.con = 10;
		}
	}
}	
if (con == 10)
{
	with (m6)
	{
		x -= 6;
		y += 1;
		image_angle += 4;
		if (x < (obj_GAME_CONTROLLER.cam_x - 40))
		{
			other.alarm[2] = 120;
			other.con = 11;
			destroy(id);
		}
	}
}
if (con == 12)
{
	var _xx = 500;
	var _yy = 200;
	var _spd = 0.225;
	brock.x = lerp(brock.x, _xx, _spd);	
	brock.y = lerp(brock.y, _yy, _spd);
	var _dist = point_distance(brock.x, brock.y, _xx, _yy);
	if (_dist <= 1)
	{
		writer("event_brock_prebattle_1", -1, -1);
		con = 13;
	}
	if (altcon == 0)
	{
		alarm[8] = 10;
		altcon = 11;
	}
}
if (altcon == 12)
{
	global.chara_facing = UP;
	if (is_undefined(chara_surprise) == false)
		destroy(chara_surprise);
	altcon = 0;
}
if (con == 13)
{
	if (exists(thiswriter) == 0)
	{
		global.flag[37] = 0.75;
		audio_play(snd_heartbreak2, 0, VOLUME_SOUND);
		alarm[2] = 80;
		con = 14;
	}
}
if (con == 15)
{
	brock.x = lerp(brock.x, chara.x, 0.1);
	brock.y = lerp(brock.y, chara.y, 0.1);
	aftercon = 0;
	with (chara)
	{
		if (place_meeting(x, (y - 20), other.brock) == 1)
		{
			global.flag[37] = 1;
			//global.flag_skipboss = 1;
			global.battle_nextgroup = 6;
			battle();
			other.con = 16;
		}
	}
}


/*
if (con == 1)
{
	brock.image_alpha += (brockspd / 4);
	brock.image_xscale += (brockspd * 0.125);
	brock.image_yscale += (brockspd * 0.125);
	if (brock.hspeed < 0)
		brock.hspeed += (brockspd);
	else
		brock.hspeed = 0;
	if (brock.vspeed < 0)
		brock.vspeed += brockspd;
	else
	{
		brock.depth = -100;
		con = 2;
	}
}
if (con == 2)
{
	brock.vspeed += brockspd;
	if (brock.vspeed >= 3)
	{
		brock.friction = 0.1;
		con = 3;
	}
}
if (con == 3 && brock.vspeed == 0)
{
	brock.x = round(brock.x);
	brock.y = round(brock.y);
	brock.friction = 0;
	aftercon = 2;
	con = 4;
	//if (global.flag_skipboss == 1)
	//{
	//	alarm[3] = 60;
	//	con = 12.5;	
	//}
}
if (con == 4 && altcon == 4)
{
	altcon = 0;
	alarm[2] = 80;
	con = 5;
}
if (con == 6)
{
	global.flag[37] = 0.5;
	writer("event_brock_prebattle_0", -1, -1);
	con = 7;
}
if (con == 7 && exists(thiswriter) == 0)
{
	if (altcon == 0)
	{
		alarm[8] = 10;
		altcon = 6;
	}
	
	var _xx = 140;
	var _yy = 140;
	var _spd = 0.225;
	brock.x = lerp(brock.x, _xx, _spd);	
	brock.y = lerp(brock.y, _yy, _spd);
	var _dist = point_distance(brock.x, brock.y, _xx, _yy);
	if (_dist <= 1)
	{
		global.chara_facing = LEFT;
		shakeobj(bc, 0.5, 0.5, 0.01);
		aftercon = 0;
		altcon = 8;
		con = 9;
	}
}
if (altcon == 8)
{
	if (shock_delay <= 0)
	{
		var _rdpos = irandom_range(-3, 3);
		marker((shock_x + _rdpos), (shock_y + _rdpos), spr_npc_brock_shockblt, 1, 1, 1, 1, irandom(12), 0, c_white, -999);
		shockblt = thismarker;
		shockblt.direction = point_direction(shockblt.x, shockblt.y, m6.x, (m6.y - (m6.sprite_height / 2))) + irandom_range(-2, 2);
		shockblt.image_angle = (direction + 90);
		shockblt.speed = 4;
		audio_play(snd_shock_blt, 0, VOLUME_SOUND);
		
		shock_amount -= 1;
		if (shock_amount <= 0)
		{
			aftercon = 2;
			altcon = 0;
		}
		else
			shock_delay = shock_delay_orig;
	}
	else
		shock_delay -= 1;
}
if (con == 9)
{
	with (m6)
	{
		if (place_meeting(x, y, obj_marker) == 1)
		{
			with (other)
			{
				explosion(m6.x, (m6.y - (m6.sprite_height / 2)));
				if (global.chara_murder < 2)
					surprise(chara);
				chara_surprise = thismarker;
				global.flag[2] = 0;
				global.party[0] = -1;
				//global.chara_cutscene = 0;
				shakescreen(3, 3);
				con = 10;
			}
		}
	}
}	
if (con == 10)
{
	// mee6 get thrown
	with (m6) 
	{
		x -= 6;
		y += 1;
		image_angle += 4;
		if (x < -20)
		{
			with (other)
			{
				alarm[2] = 120;
				con = 11;
			}
		}
	}
}
if (con == 12)
{
	if (altcon == 0)
	{
		alarm[8] = 10;
		altcon = 11;
	}
	
	var _xx = 160;
	var _yy = 121;
	var _spd = 0.225;
	brock.x = lerp(brock.x, _xx, _spd);	
	brock.y = lerp(brock.y, _yy, _spd);
	var _dist = point_distance(brock.x, brock.y, _xx, _yy);
	if (_dist <= 1)
	{
		writer("event_brock_prebattle_1", -1, -1);
		con = 13;
	}	
}
if (altcon == 12)
{
	global.chara_facing = UP;
	destroy(chara_surprise);
	altcon = 0;
}
if (con == 13)
{
	if (exists(thiswriter) == 0)
	{
		global.flag[37] = 0.75;
		audio_play(snd_heartbreak2, 0, VOLUME_SOUND);
		alarm[2] = 80;
		con = 14;
	}
}
if (con == 15)
{
	brock.x = lerp(brock.x, chara.x, 0.1);
	brock.y = lerp(brock.y, chara.y, 0.1);
	aftercon = 0;
	with (chara)
	{
		if (place_meeting(x, (y - 20), other.bc) == 1)
		{
			with (other)
			{	
				global.flag[2] = 0;
				global.side[0] = -1;
				global.flag[37] = 1;
				//global.flag_skipboss = 1;
				global.battle_nextgroup = 6;
				battle();
				destroy(id);
			}
		}
	}
}

// chara and side movement
if (altcon == 1)
{
	movetopoint(160, 210, 45, chara);
	movetopoint(80, 170, 45, m6);
	chara.image_speed = 0.25;
	chara.image_index = 1;
	m6.image_speed = 0.25;
	m6.image_index = 1;
	m6dist = point_distance(m6.x, m6.y, 80, 170);
	altcon = 3;
}
if (altcon == 3)
{
	if (exists(obj_movetopoint) == 1)
	{
		var _curdist = point_distance(m6.x, m6.y, 80, 170);
		if (_curdist <= (m6dist / 2))
			global.party_facing[0] = RIGHT;
	}
	else
	{
		chara.x = round(chara.x);
		chara.y = round(chara.y);
		m6.x = round(m6.x);
		m6.y = round(m6.y);
		chara_stop();
		party_stop(0);
		global.party_facing[0] = RIGHT;
		altcon = 4;
	}
}

// manage brick particles
if (con >= 1)
{
	for (var i = 0; i < brickamount; i++)
	{
		if (exists(brick[i]) == 1)
		{
			brick[i].image_angle += (2 * brickanglemult[i]);
			if (brick[i].y >= (room_height / 2))
				destroy(brick[i]);
		}
	}
}

// bc movement
if (aftercon == 2)
{
	brocksiner += 0.1;
	brock.vspeed = (sin(brocksiner) * 0.5);	
}
if (con > 0 && exists(bc) == true)
{
brock.x = (round(brock.x * 10) / 10);
brock.y = (round(brock.y * 10) / 10);
}
*/