if (con == 0 && obj_chara.x >= ((room_width / 2) + 10) && global.chara_move == 1)
{
	depth = -room_height;
	gate_x = [385, 605];
	gate_height = 0;
	gate_time = 90;
	game = obj_GAME_CONTROLLER;
	chara = obj_chara;
	m6 = global.party[0];
	m6_surprise = undefined;
	m6_jumpTargetX = 485;
	m6_jumpTargetY = 280;
	m6_jumpTime = (gate_time / 2);
	m6_seriousTargetX = m6_jumpTargetX;
	m6_seriousTargetY = (m6_jumpTargetY + 10);
	m6_seriousDelay = 5;
	m6_seriousTime = 10;
	brock = undefined;
	brock_shock_image = 0;
	brock_jumpTargetX = 500;
	brock_jumpTargetY = 200;
	brock_jumpSpeed = 0.1;
	brock_seriousTargetX = 490;
	brock_seriousTargetY = 235;
	brock_seriousSpeed = 0.2;
	brock_siner = 0;
	cam_time = 120;
	cam_targetX = 340;
	cam_targetY = 70;
	cam_offsetX = (cam_targetX - game.cam_x);
	cam_offsetY = (cam_targetY - game.cam_y);
	thiswriter = undefined;
	global.flag[37] = 0.25;
	chara_change(-1, 0, 0, 1, 0, 0, 0);
	chara_stop();
	chara_facing(UP);
	with (chara)
		shakeobj_small();
	party_change(0, -1, -1);
	party_stop(0);
	party_facing(0, UP);
	m6_surprise = surprise(m6);
	with (m6)
		shakeobj_small();
	for (var i = 0; i < instance_number(obj_overworld_solid); i++)
	{
		var _brickpile = instance_find(obj_overworld_solid, i);
		if (_brickpile.sprite_index == spr_overworld_corridorsbricks)
			shakeobj(_brickpile, 2, 2, 0.1);
	}
	audio_play(snd_grab, 0, VOLUME_SOUND, , , , 0.8);
	if (global.flagtemp_bossSkip == false)
	{
		con = 1;
		alarm[2] = 90;
	}
	else
	{
		con = 2;
		cam_time /= 3;
	}
}
else if (con == 2)
{
	cam_speedX = (cam_offsetX / cam_time);
	cam_speedY = (cam_offsetY / cam_time);
	if (abs(game.cam_x - cam_targetX) > abs(cam_speedX) && abs(game.cam_y - cam_targetY) > abs(cam_speedY))
	{
		game.cam_x += cam_speedX;
		game.cam_y += cam_speedY;
		if (m6_surprise != undefined && exists(m6_surprise) == true)
			destroy(m6_surprise);
		m6_surprise = undefined;
	}
	else
	{
		game.cam_x = cam_targetX;
		game.cam_y = cam_targetY;
		if (chara.y < 280)
		{
			movetopoint(515, 280, (gate_time / 2), chara);
			chara.image_speed = chara.rimgspeed[0];
			chara.image_index = 1;
		}
		if (m6.y < m6_jumpTargetY)
		{
			movetopoint(m6_jumpTargetX, m6_jumpTargetY, m6_jumpTime, m6);
			m6.image_speed = chara.rimgspeed_party;
			m6.image_index = 1;
		}
		brock = marker(500, 140, spr_npc_brock, 0.5, 0.75, 0.75, 0, 0, 0, c_white, -room_height);
		audio_play(snd_bigcut, 0, VOLUME_SOUND);
		shakescreen(4, 4);
		for (var i = 0; i < instance_number(obj_overworld_solid); i++)
		{
			var _brickpile = instance_find(obj_overworld_solid, i);
			if (_brickpile.sprite_index == spr_overworld_corridorsbricks)
				shakeobj(_brickpile, 4, 4, 0.1);
		}
		for (var i = 0; i < 8; i++)
		{
			marker(brock.x, brock.y, spr_npc_brock_brick, 1, 1, 1, 0, 0, irandom(360), c_white, 0);
			brick[i] = thismarker;
			brick[i].depth = -(115 + sprite_get_height(spr_overworld_corridorsbricks) + 10);
			brick[i].gravity = 0.1;
			brick[i].hspeed = choose(-0.5, -0.25, 0.25, 0.5);
			brick[i].vspeed = random_range(-2.25, -3.75);
			brick[i].angleSign = choose(-1, 1);
		}
		con = 5;
		aftercon = 1;
	}
}
if (con == 5)
{
	if (exists(obj_movetopoint) == false)
	{
		chara_stop();
		party_stop(0);
	}
	for (var i = 0; i < array_length(brick); i++)
	{
		if (exists(brick[i]) == 1)
		{
			brick[i].image_angle += (2 * brick[i].angleSign);
			if (brick[i].y >= (room_height / 2))
			{
				destroy(brick[i]);
				array_delete(brick, i, 1);
			}
		}
	}
	if (round(gate_height) < 181)
	{
		gate_height += (181 / gate_time);
		if (audio_playing(snd_option_movehold) == false)
			audio_play(snd_option_movehold, true, VOLUME_SOUND, , , , 1.05);
	}
	else if (round(gate_height) >= 181 && audio_playing(snd_option_movehold) == true)
	{
		gate_height = 181;
		audio_stop(snd_option_movehold);
		audio_play(snd_impact, false, VOLUME_SOUND);
		audio_play(snd_screenshake, false, VOLUME_SOUND);
		shakescreen(5, 5);
	}
	if (exists(obj_movetopoint) == false && gate_height == 181 && array_length(brick) <= 0 && audio_playing(snd_option_movehold) == false)
	{
		if (global.flagtemp_bossSkip == false)
		{
			global.flag[37] = 0.5;
			con = 6;
			alarm[2] = 60;
		}
		else
			con = 15;
	}
}
if (aftercon == 1)
{
	brock.x = lerp(brock.x, brock_jumpTargetX, brock_jumpSpeed);
	brock.y = lerp(brock.y, brock_jumpTargetY, brock_jumpSpeed);
	brock.vspeed = 0;
	brock.image_alpha = lerp(brock.image_alpha, 1, brock_jumpSpeed);
	brock.image_xscale = lerp(brock.image_xscale, 1, brock_jumpSpeed);
	brock.image_yscale = lerp(brock.image_yscale, 1, brock_jumpSpeed);
	if (point_distance(brock.x, brock.y, brock_jumpTargetX, brock_jumpTargetY) <= 1)
	{
		brock.x = brock_jumpTargetX;
		brock.y = brock_jumpTargetY;
		brock.image_alpha = 1;
		brock.image_xscale = 1;
		brock.image_yscale = 1;
		aftercon = 2;
	}
}
if (aftercon == 2)
{
	brock_siner += 0.1;
	brock.vspeed = (sin(brock_siner) * 0.5);	
}
if (con == 7)
{
	writer("event_brock_prebattle_0", -1, -1);
	con = 8;
}
else if (con == 8 && exists(thiswriter) == false)
{
	con = 9;
	alarm[2] = m6_seriousDelay;
	aftercon = 3;
}
if (aftercon == 3)
{
	brock.x = lerp(brock.x, brock_seriousTargetX, brock_seriousSpeed);
	brock.y = lerp(brock.y, brock_seriousTargetY, brock_seriousSpeed);
	brock.vspeed = 0;
	if (point_distance(brock.x, brock.y, brock_seriousTargetX, brock_seriousTargetY) <= 1)
	{
		brock.x = brock_seriousTargetX;
		brock.y = brock_seriousTargetY;
		aftercon = 2;
	}
}
if (con == 10)
{
	chara_facing(LEFT);
	movetopoint(m6_seriousTargetX, m6_seriousTargetY, m6_seriousTime, m6);
	m6.image_speed = chara.rimgspeed_party;
	m6.image_index = 1;
	con = 11;
}
else if (con == 11 && exists(thismover) == false)
{
	party_stop(0);
	party_facing(0, -1);
	m6.sprite_index = spr_m6_u_sit;
	audio_play(snd_bump, 0, VOLUME_SOUND);
	with (m6)
		shakeobj_small();
	con = 12;
}
else if (con == 12 && aftercon == 2)
{
	writer("event_brock_prebattle_1", -1, -1);
	con = 13;
}
else if (con == 13 && exists(thiswriter) == false)
{
	chara_facing(UP);
	aftercon = 1;
	con = 14;
}
else if (con == 14 && aftercon == 2)
{
	writer("event_brock_prebattle_2", -1, -1);
	con = 15;
}
else if (con == 15 && ((is_undefined(thiswriter) == false && exists(thiswriter) == false) || (is_undefined(thiswriter) == true))) 
{
	global.flag[37] = 0.75;
	audio_play(snd_heartbreak2, 0, VOLUME_SOUND);
	con = 16;
	alarm[2] = 80;
}
if (con == 17)
{
	brock.x = lerp(brock.x, chara.x, 0.1);
	brock.y = lerp(brock.y, chara.y, 0.1);
	aftercon = 0;
	with (chara)
	{
		if (place_meeting(x, (y - 20), other.brock) == 1)
		{
			global.flag[37] = 1;
			global.flagtemp_bossSkip = true;
			global.battle_nextgroup = 6;
			battle();
			other.con = 18;
		}
	}
}