
if (con == 1)
{
	bc.image_alpha += (bcspd / 4);
	bc.image_xscale += (bcspd * 0.125);
	bc.image_yscale += (bcspd * 0.125);
	if (bc.hspeed < 0)
		bc.hspeed += (bcspd);
	else
		bc.hspeed = 0;
	if (bc.vspeed < 0)
		bc.vspeed += bcspd;
	else
	{
		bc.depth = -100;
		con = 2;
	}
}
if (con == 2)
{
	bc.vspeed += bcspd;
	if (bc.vspeed >= 3)
	{
		bc.friction = 0.1;
		con = 3;
	}
}
if (con == 3 && bc.vspeed == 0)
{
	bc.x = round(bc.x);
	bc.y = round(bc.y);
	bc.friction = 0;
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
	writer("event_bc_prebattle_0", -1, -1);
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
	bc.x = lerp(bc.x, _xx, _spd);	
	bc.y = lerp(bc.y, _yy, _spd);
	var _dist = point_distance(bc.x, bc.y, _xx, _yy);
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
		marker((shock_x + _rdpos), (shock_y + _rdpos), spr_npc_bc_shockblt, 1, 1, 1, 1, irandom(12), 0, c_white, -999);
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
	bc.x = lerp(bc.x, _xx, _spd);	
	bc.y = lerp(bc.y, _yy, _spd);
	var _dist = point_distance(bc.x, bc.y, _xx, _yy);
	if (_dist <= 1)
	{
		writer("event_bc_prebattle_1", -1, -1);
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
	bc.x = lerp(bc.x, chara.x, 0.1);
	bc.y = lerp(bc.y, chara.y, 0.1);
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
	bcsiner += 0.1;
	bc.vspeed = (sin(bcsiner) * 0.5);	
}
if (con > 0 && exists(bc) == true)
{
bc.x = (round(bc.x * 10) / 10);
bc.y = (round(bc.y * 10) / 10);
}