if (con == 0 && obj_chara.x >= ((room_width / 2) + 10) && global.chara_move == 1)
{
	game = obj_GAME_CONTROLLER;
	chara = obj_chara;
	m6 = global.party[0];
	brock = undefined;
	brock_shock_image = 0;
	brock_jumpTargetX = 500;
	brock_jumpTargetY = 200;
	brock_jumpSpeed = 0.075;
	brock_siner = 0;
	cam_time = 90;
	cam_targetX = 340;
	cam_targetY = 70;
	cam_offsetX = (cam_targetX - game.cam_x);
	cam_offsetY = (cam_targetY - game.cam_y);
	cam_speedX = (cam_offsetX / cam_time);
	cam_speedY = (cam_offsetY / cam_time);
	gate_x = [385, 605];
	gate_height = 0;
	gate_time = 90;
	global.flag[37] = 0.25;
	chara_change(-1, 0, 0, 1, 0, 0, 0);
	chara_stop();
	chara_facing(UP);
	party_change(0, -1, -1);
	party_stop(0);
	party_facing(0, UP);
	for (var i = 0; i < instance_number(obj_overworld_solid); i++)
	{
		var _brickpile = instance_find(obj_overworld_solid, i);
		if (_brickpile.sprite_index == spr_overworld_corridorsbricks)
			shakeobj(_brickpile, 2, 2, 0.1);
	}
	audio_play(snd_grab, 0, VOLUME_SOUND, , , , 0.8);
	con = 1;
	depth = -room_height;
	alarm[2] = 90;
}
else if (con == 2)
{
	if (abs(game.cam_x - cam_targetX) > abs(cam_speedX) && abs(game.cam_y - cam_targetY) > abs(cam_speedY))
	{
		game.cam_x += cam_speedX;
		game.cam_y += cam_speedY;
	}
	else
	{
		game.cam_x = cam_targetX;
		game.cam_y = cam_targetY;
		movetopoint(515, 280, (gate_time / 2), chara);
		chara.image_speed = chara.rimgspeed[1];
		movetopoint(485, 280, (gate_time / 2), m6);
		m6.image_speed = chara.rimgspeed_party;
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
		global.flag[37] = 0.5;
		con = 6;
		alarm[2] = 120;
	}
}
if (aftercon == 1)
{
	brock.x = lerp(brock.x, brock_jumpTargetX, brock_jumpSpeed);
	brock.y = lerp(brock.y, brock_jumpTargetY, brock_jumpSpeed);
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