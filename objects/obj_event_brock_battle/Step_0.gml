if (global.flag[2] == 1 && global.flag[37] < 1 && global.flag[39] == 0)
{
	if (con == 0 && obj_chara.x >= ((room_width / 2) + 10) && global.chara_move == 1)
	{
		depth = -room_height;
		cam_offsetX = (cam_x - game.cam_x);
		cam_offsetY = (cam_y - game.cam_y);
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
		global.flag[37] = 0.25;
	}
	else if (con == 2)
	{
		cam_speedX = (cam_offsetX / cam_time);
		cam_speedY = (cam_offsetY / cam_time);
		if (abs(game.cam_x - cam_x) > abs(cam_speedX) && abs(game.cam_y - cam_y) > abs(cam_speedY))
		{
			game.cam_x += cam_speedX;
			game.cam_y += cam_speedY;
			if (m6_surprise != undefined && exists(m6_surprise) == true)
				destroy(m6_surprise);
			m6_surprise = undefined;
		}
		else
		{
			game.cam_x = cam_x;
			game.cam_y = cam_y;
			gate_draw = true;
			if (chara.y < 280)
			{
				movetopoint(chara_jumpX, chara_jumpY, (gate_time / 2), chara);
				chara.image_speed = chara.rimgspeed[0];
				chara.image_index = 1;
			}
			if (m6.y < m6_jumpY)
			{
				movetopoint(m6_jumpX, m6_jumpY, m6_jumpTime, m6);
				m6.image_speed = chara.rimgspeed_party;
				m6.image_index = 1;
			}
			brock.image_alpha = (brock_jumpAlpha / 2);
			brockShock_draw = true;
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
				brockBrick[i] = thismarker;
				brockBrick[i].depth = -(115 + sprite_get_height(spr_overworld_corridorsbricks) + 10);
				brockBrick[i].gravity = 0.1;
				brockBrick[i].hspeed = choose(-0.5, -0.25, 0.25, 0.5);
				brockBrick[i].vspeed = random_range(-2.25, -3.75);
				brockBrick[i].angleSign = choose(-1, 1);
			}
			con = 5;
			aftercon = 1;
		}
	}
	if (con == 5)
	{
		if (round(gate_height) < gate_heightMax)
		{
			gate_height += (gate_heightMax / gate_time);
			if (audio_playing(snd_option_movehold) == false)
				audio_play(snd_option_movehold, true, VOLUME_SOUND, , , , 1.05);
		}
		else if (round(gate_height) >= gate_heightMax && audio_playing(snd_option_movehold) == true)
		{
			gate_height = gate_heightMax;
			audio_stop(snd_option_movehold);
			audio_play(snd_impact, false, VOLUME_SOUND);
			audio_play(snd_screenshake, false, VOLUME_SOUND);
			shakescreen(5, 5);
		}
		if (exists(obj_movetopoint) == false)
		{
			chara_stop();
			party_stop(0);
		}
		for (var i = 0; i < array_length(brockBrick); i++)
		{
			if (exists(brockBrick[i]) == 1)
			{
				brockBrick[i].image_angle += (2 * brockBrick[i].angleSign);
				if (brockBrick[i].y >= (room_height / 2))
				{
					destroy(brockBrick[i]);
					array_delete(brockBrick, i, 1);
				}
			}
		}
		if (gate_height == gate_heightMax && array_length(brockBrick) <= 0 && audio_playing(snd_option_movehold) == false && exists(obj_movetopoint) == false)
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
		brock.x = lerp(brock.x, brock_jumpX, brock_jumpSpeed);
		brock.y = lerp(brock.y, brock_jumpY, brock_jumpSpeed);
		brock.vspeed = 0;
		brock.image_alpha = lerp(brock.image_alpha, brock_jumpAlpha, brock_jumpSpeed);
		brock.image_xscale = lerp(brock.image_xscale, brock_jumpScaleX, brock_jumpSpeed);
		brock.image_yscale = lerp(brock.image_yscale, brock_jumpScaleY, brock_jumpSpeed);
		if (point_distance(brock.x, brock.y, brock_jumpX, brock_jumpY) <= 1)
		{
			brock.x = brock_jumpX;
			brock.y = brock_jumpY;
			brock.image_alpha = 1;
			brock.image_xscale = 1;
			brock.image_yscale = 1;
			aftercon = 2;
		}
	}
	if (con == 7)
	{
		writer("event_brock_battle_0", -1, -1);
		con = 8;
	}
	else if (con == 8) || (con == 8.5)
	{
		if (exists(thiswriter) == true)
		{
			if (thiswriter.page >= 2 && con == 8)
			{
				movetopoint(m6_jumpX, (m6_jumpY - 10), 10, m6);
				m6.image_speed = chara.rimgspeed_party;
				m6.image_index = 1;
				con = 8.5;
			}
			else if (con == 8.5 && exists(thismover) == false)
				party_stop(0);
		}
		else
		{
			if (exists(thismover) == true)
			{
				destroy(thismover);
				party_stop(0);
			}
			audio_play(snd_bigswing, false, VOLUME_SOUND);
			con = 9;
			alarm[2] = m6_seriousDelay;
			aftercon = 3;
		}
	
	}
	if (aftercon == 3)
	{
		brock.x = lerp(brock.x, brock_seriousX, brock_seriousSpeed);
		brock.y = lerp(brock.y, brock_seriousY, brock_seriousSpeed);
		brock.vspeed = 0;
		if (point_distance(brock.x, brock.y, brock_seriousX, brock_seriousY) <= 1)
		{
			brock.x = brock_seriousX;
			brock.y = brock_seriousY;
			aftercon = 2;
		}
	}
	if (con == 10)
	{
		chara_facing(LEFT);
		movetopoint(m6_seriousX, m6_seriousY, m6_seriousTime, m6);
		m6.image_speed = chara.rimgspeed_party;
		m6.image_index = 1;
		con = 11;
	}
	else if (con == 11 && exists(thismover) == false)
	{
		party_stop(0);
		party_facing(0, -1);
		m6.sprite_index = spr_m6_u_sit;
		audio_play(snd_grab, 0, VOLUME_SOUND);
		with (m6)
			shakeobj_small();
		con = 12;
	}
	else if (con == 12 && aftercon == 2)
	{
		writer("event_brock_battle_1", -1, -1);
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
		writer("event_brock_battle_2", -1, -1);
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
}
else if (global.flag[37] == 1 && global.flag[39] == 0)
{
	if (con == 0 && exists(chara) == true && exists(m6) == true && m6.active == true && is_undefined(brock) == false && exists(brock) == true)
	{
		screenpos(cam_x, cam_y);
		gate_draw = true;
		gate_height = gate_heightMax;
		chara_change(-1, false, false, true, false, false, false);
		chara_facing(UP);
		chara.x = chara_jumpX;
		chara.y = chara_jumpY;
		party_change(0, -1, -1);
		party_facing(0, UP);
		m6.x = m6_jumpX;
		m6.y = m6_jumpY;
		if (global.flag[38] == false)
		{
			brock.x = brock_jumpX;
			brock.y = brock_jumpY;
			brock.image_alpha = brock_jumpAlpha;
			brock.image_xscale = brock_jumpScaleX;
			brock.image_yscale = brock_jumpScaleY;
			brock_floatSlow = true;
			aftercon = 2;
		}
		else
			destroy(brock);
		con = 1;
		alarm[2] = 60;
	}
	else if (con == 2)
	{
		if (round(gate_height) > 0)
		{
			gate_height -= (gate_heightMax / (gate_time * 1.5));
			if (audio_playing(snd_option_movehold) == false)
				audio_play(snd_option_movehold, true, VOLUME_SOUND, , , , (1.05 * 0.5));
		}
		else if (round(gate_height) <= 0)
		{
			con = 3;
			alarm[2] = 120;
			gate_height = 0;
			if (audio_playing(snd_option_movehold) == true)
				audio_stop(snd_option_movehold);
			audio_play(snd_screenshake, false, VOLUME_SOUND, , , , (1.05 * 0.75));
			shakescreen(3, 3);
		}
	}
	else if (con == 4)
	{
		writer("event_brock_battle_3");
		con = 5;
	}
}
else
{
	if (is_undefined(brock) == false && exists(brock) == true)
		destroy(brock);
	destroy(id);
}
if (global.flag[2] == 1 && global.flag[37] < 1 && global.flag[39] == 0) || (global.flag[37] == 1 && global.flag[39] == 0)
{
	if (aftercon == 2 && is_undefined(brock) == false && exists(brock) == true)
	{
		brock_floatSiner += 0.1;
		var _divisor = 1;
		var _multiplier = 0.5;
		if (brock_floatSlow == true)
		{
			_divisor = 2;
			_multiplier = (0.25 + 0.125);
		}
		brock.vspeed = (sin(brock_floatSiner / _divisor) * _multiplier);
	}
}
