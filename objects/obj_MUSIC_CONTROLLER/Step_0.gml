
for (var i = 0; i < global.music_length; i++)
{
	music_paused[i] = false;
	music_old[i] = global.music[i];
	music_pitch_old[i] = global.music_pitch[i];
	music_audio_old[i] = music_audio[i];
	music_fadeouttime_old[i] = global.music_fadeouttime[i];
	music_volumetype_old[i] = global.music_volumetype[i];
}
// musica id 0-2 (overworld) 3 (batalha)

if (room == room_menu)
{
	for (var i = 0; i < global.music_length; i++)
		global.music[i] = -1;
	controller = obj_menu_controller;
	if (global.fastmenu == 0 && controller.started == 1) || (global.fastmenu == 1 && audio_playing(snd_dumpgame) == 0)
	{
		var _pitch = 1;
		if (exists(obj_menu_namer) == 1 && obj_menu_namer.typing == 1)
			_pitch = 2;
		var _fadeouttime = 0;
		if (global.menu_lvl == 5)
			_fadeouttime = 0.5;
		music_set(0, mus_menu, , , , _pitch, , _fadeouttime);
		// ovos
		if (audio_playing(SND_OVOS) == 1)
			music_paused[0] = 1;
	}
}
if (room == room_intro)
{
	global.music[0] = -1;
	controller = obj_intro_controller;
	if (controller.active == 1)
		music_set(0, mus_intro);
}
if (room == room_over)
{
	music_set(0, -1);
	music_set(3, -1);
	if (exists(obj_over_controller) == 1 && obj_over_controller.con == 9)
		music_set(0, mus_gameover, , 0, , , , 1);
}
if (room != room_battle && exists(obj_battle_quicker) == false)
{
	if (room == room_corridors_1) // corredores
	{
		music_set(0, -1);
		music_set(1, -1);
		if (global.flag[0] >= 0.5)
		{
			var _gain_time = 5;
			if (global.flag[0] == 1)
				_gain_time = 0.5;
			var _fadeouttime = 5;
			music_set(0, mus_start, , _gain_time, 1, 1, 1, _fadeouttime);
			if (global.chara_murder >= 2)
				global.music[0] = mus_nobody;
			else
				music_set(1, snd_ambient_birds, , _gain_time, 1, 1, 1, _fadeouttime);
		}
	}
	if (room == room_corridors_1_5) || (room == room_corridors_2)
	{
		global.music[0] = -1;
		music_set(1, snd_ambient_wind, 0.75, 5, 1, 0.5, 1, 2.5);
		if (room == room_corridors_2 && global.flag[1] >= 0.5 && global.flag[1] < 1)
		{
			music_set(1, -1);
			if (global.flag[1] == 0.75)
				music_set(0, mus_m6);
		}
	}
	if (room >= room_corridors_3 && room < room_caverns_1)
	{	
		music_set(0, mus_corridors, , , , (1 - (0.025 * (chara_murder() == 1))));
		music_set(1, -1);
		music_set(2, -1);
		if (chara_murder() >= 2)
			music_set(0, mus_corridors_geno)
		// Broken Clock
		if (room == room_corridors_11)
		{
			if (global.flag[37] == 0.25) || (global.flag[37] >= 0.75 && global.flag[39] == 0) || (global.flag[39] == 1 && global.flag[41] == 0)
				music_set(0, -1);
			if (global.flag[37] == 0.5)
				music_set(0, mus_brock_prebattle, , , , , , 0);
		}
		// CAPTCHA 3
		if (room == room_corridors_14 && chara_murder() < 2)
		{
			if (global.flag[50] == 0.25) || (global.flag[50] == 0.75)
				music_set(0, -1);	
			if (global.flag[50] == 0.5)
			{
				music_set(0, mus_hurry_intro, , , , , false);
				if (music_old[0] == mus_hurry_intro && audio_playing(mus_hurry_intro) == false) || (music_old[0] == mus_hurry_loop_0) || (music_old[0] == mus_hurry_loop_1)
				{
					music_set(0, mus_hurry_loop_0, , , , , , 0);
					if (exists(obj_captcha3) == true && obj_captcha3.timer.seconds < obj_captcha3.timer.fog.secondsMin)
					{
						var _sec = obj_captcha3.timer.seconds;
						var _secMin = obj_captcha3.timer.fog.secondsMin;
						global.music_pitch[0] = music_pitch_old[0];
						global.music_pitch[0] = lerp(global.music_pitch[0], ((_sec > (_secMin / 2)) ? 1.05 : ((_sec > (_secMin / 4)) ? 1.1 : ((_sec > (_secMin / 8)) ? 1.15 : 1.2))), 0.025);
						music_set(1, snd_alarm, , , 2, , , 0);
						if (music_old[1] == snd_alarm)
							global.music_pitch[1] = music_pitch_old[1];
						global.music_pitch[1] = lerp(global.music_pitch[1], ((_sec > (_secMin / 2)) ? 1 : ((_sec > (_secMin / 4)) ? 1.1 : ((_sec > (_secMin / 8)) ? 1.2 : 1.3))), 0.025);
						global.music_volumetype[1] = VOLUME_SOUND;
					}
				}
			}
		}
		// Flitcher's first words
		if (room == room_corridors_17 && global.flag[44] == 0.5)
		{
			music_paused[0] = true;
			if (exists(obj_writer_controller) == false)
				global.flag[44] = 1;
		}
		// Gabee's chase
		if (room == room_corridors_18)
		{
			music_set(0, -1);
			music_fadeouttime_old[0] = 5;
			if ((exists(obj_event_gabee_chase) == 1 && obj_event_gabee_chase.con >= 9) == false)
			{
				music_set(1, snd_ambient_wind, , 2.5, 1, 0.75, , 2.5);
				global.music_volumetype[1] = VOLUME_SOUND;
			}
			if (global.flag[60] == 1 && global.flag[61] == 0)
			{
				music_set(0, mus_hurry_intro, , , , , false);
				if (music_old[0] == mus_hurry_intro && audio_playing(mus_hurry_intro) == false) || (music_old[0] == mus_hurry_loop_1)
				{
					music_set(0, mus_hurry_loop_1);
					if (exists(obj_event_gabee_chase) == 1 && obj_event_gabee_chase.con >= 45)
					{
						global.music_pitch[0] = music_pitch_old[0];
						global.music_pitch[0] = lerp(global.music_pitch[0], 0, 0.025);
					}
				}
			}
		}
	}
	if (room == unused_room_corridors_16_B)
	{
		music_set(0, -1);
		music_fadeouttime_old[0] = 5;
		music_set(1, snd_ambient_wind, , 2.5, 1, 0.5, , 1);
		global.music_volumetype[1] = VOLUME_SOUND;
	}
	if (room >= room_caverns_1 && room <= room_caverns_3)
	{
		music_set(0, -1);
		music_set(1, -1);
		music_set(2, -1);
		if (global.flag[62] >= 0.5)
		{
			if (global.flag[62] == 0.5)
				music_set(0, unused_mus_start, , , , 0.5 + 0.25, false);
			music_set(1, snd_ambient_wind, , 2.5, 1, 0.35, , 5);
			music_set(2, snd_titleimpact, 1.5, 2.5, 1, 0.4, , 5);
		}
	}
	if (room >= room_caverns_3 && room <= room_caverns_3) // cavernas
	{
		music_set(0, mus_cave);
		music_set(2, snd_ambient_water, , 2.5, 1, , , 5);	
	}
	if (room == room_crazycat)
	{
		global.music[0] = -1;
		global.music[1] = -1;
		if (instance_exists(obj_crazycat) == true && obj_crazycat.cat_dancing == 1)
			music_set(0, mus_crazycat);
	}
	for (var i = 0; i < (global.music_length * exists(obj_chara_pause)); i++)
		music_paused[i] = true;
}
else
{
	for (var i = 0; i < (global.music_length - 1); i++)
	{
		music_paused[i] = true;
		if (global.music[i] == mus_corridors && global.world_curpopulation[WORLD_CORRIDORS] <= 0 && global.flag[22] == false)
		{
			music_set(i, -1);
			music_fadeouttime_old[0] = 0;
		}
		if (global.music[i] == mus_corridors_geno)
			music_paused[i] = false;
	}
	if (exists(obj_battle_controller) == true)
		music_set(3, obj_battle_controller.battle_music, 1, 0, 0, (1 - (0.025 * (chara_murder() == 1))), 1, 0.5);
}

for (var i = 0; i < global.music_length; i++)
{
	if (audio_playing(music_audio[i]) == true)
	{
		// pausar música
		if (music_paused[i] == 1 && audio_paused(music_audio[i]) == 0)
		{
			audio_pause(music_audio[i]);
			debug($"--- Paused music \"{audio_get_name(audio_sound_get_asset(music_audio[i]))}\"");
		}
		// despausar música
		if (music_paused[i] == 0 && audio_paused(music_audio[i]) == 1)
		{
			audio_resume(music_audio[i]);
			debug($"--- Resumed music \"{audio_get_name(audio_sound_get_asset(music_audio[i]))}\"");
		}
	}
	// parar música
	if (((global.music[i] <= -1) || (global.music[i] != music_old[i] && music_old[i] > -1)) && music_audio[i] > -1)
	{
		if (audio_playing(music_audio_old[i]) == true)
		{
			if (music_fadeouttime_old[i] > 0)
			{
				debug($"--- Stopping old music \"{audio_get_name(audio_sound_get_asset(music_audio_old[i]))}\"");
				audio_gain(music_audio_old[i], 0, music_fadeouttime_old[i], 0, music_volumetype_old[i]);
				var z = 0;
				while (music_fadingaudio[z] != -1 && z < global.music_length)
					z += 1;
				music_fadingaudio[z] = music_audio_old[i];
				music_fading[i] = 1;
			}
			else
			{
				debug($"--- Stopped old music \"{audio_get_name(audio_sound_get_asset(music_audio_old[i]))}\"");
				audio_stop(music_audio_old[i]);
			}
		}
		music_playing[i] = 0;
		music_audio[i] = -1;
	}
	// tocar música
	if (global.music[i] > -1 && music_playing[i] == 0)
	{
		audio_play(global.music[i], global.music_loop[i], global.music_volumetype[i], global.music_gain_volume[i], global.music_gain_time[i], global.music_gain_fadein[i], global.music_pitch[i]);
		music_audio[i] = thisaudio;
		music_playing[i] = 1;
		music_timeplaying[i] = 0;
		debug($"--- Playing new music \"{audio_get_name(global.music[i])}\"");
	}
	else if (music_playing[i] == true && audio_playing(music_audio[i]) == true) // definir volume e pitch
	{
		if (music_timeplaying[i] >= (global.music_gain_time[i] * 60))
			audio_gain(music_audio[i], global.music_gain_volume[i], 0, 0, global.music_volumetype[i]);
		audio_pitch(music_audio[i], global.music_pitch[i]);
		music_timeplaying[i] += 1;
	}
}
for (var i = 0; i < (global.music_length * 2); i++)
{
	if (music_fadingaudio[i] != -1 && audio_sound_get_gain(music_fadingaudio[i]) == 0)
	{
		debug($"--- Stopped old music \"{audio_get_name(audio_sound_get_asset(music_fadingaudio[i]))}\"");
		audio_stop(music_fadingaudio[i]);
		music_fadingaudio[i] = -1;
	}	
}