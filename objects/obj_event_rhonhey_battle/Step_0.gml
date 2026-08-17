if (global.flag[2] == false && global.flag[66] < 1 && global.flag[69] == 0)
{
	if (con == 1 && chara.bbox_top <= 1000) || (con == 2 && chara.bbox_top <= 685)
	{
		global.flag[66] += 0.25;
		con += 1;
		thing_object[(con - 2)].speed = 4;
		audio_play(snd_pedronstro, false, VOLUME_SOUND,,,, (1 + (0.5 * con)));
	}
	if (con == 3 && chara.bbox_top <= 200 && global.chara_move == true)
	{
		global.flag[66] = 0.75;
		chara_change(-1, false, false, true, false, false, false);
		chara_stop();
		audio_play(snd_shriekDragon, false, VOLUME_SOUND, 0.5, , , (0.5 + 0.25));
		audio_play(snd_shriekYowl, false, VOLUME_SOUND, 0.5, , , (0.5 + 0.25));
		con = 4;
	}
	if (con == 4)
	{
		game.cam_y -= 2.5;
		if (game.cam_y <= 0)
		{
			con = 5;
			alarm[2] = 45;
		}
	}
	if (con == 6)
	{
		con = 8;
		alarm[2] = 90;
		audio_play(snd_breakPieces, false, VOLUME_SOUND);
	}
	if (con == 9)
	{
		if (audio_playing(snd_879) == false)
		{
			xscream = audio_play(snd_879, true, VOLUME_SOUND, , , , (0.5 + 0.125));
			audio_play(snd_pedronstro, false, VOLUME_SOUND,,,, 1.5);
		}
		audio_pitch(xscream, (audio_sound_get_pitch(xscream) + 0.01));
		thing_object[2].speed = 9;
		if (thing_object[2].y >= (chara.y - 20))
		{
			global.flag[66] = 1;
			global.battle_nextgroup = 13;
			battle();
			con = 10;
			audio_stop(snd_879);
			audio_stop(snd_pedronstro);
		}
	}
}
else if (global.flag[2] == false && global.flag[66] >= 1 && global.flag[66] < 2 && global.flag[69] == 1)
{
	if (con == 1)
	{
		writer("event_rhonhey_battle_0");
		con += 1;
	}
	else if (con == 2 && exists(thiswriter) == false)
	{
		m6.sprite_index = spr_m6_u;
		m6.image_speed = chara.wimgspeed;
		m6.image_index = 1;
		con += 1;
	}
	if (con == 3)
	{
		m6.y -= chara.wspeed;
		if (m6.y <= 60)
			m6.image_alpha -= 0.1;
		if (m6.image_alpha <= 0)
		{
			con += 1;
			alarm[2] = 60;
		}
	}
	else if (con == 5)
	{
		game.cam_y += 0.75;
		if (game.cam_y >= game.cam_charay)
		{
			global.flag[66] = 2;
			chara_facing(DOWN);
			chara_change(-1, true, true, false, true, true, true);
			con += 1;
		}
	}
}