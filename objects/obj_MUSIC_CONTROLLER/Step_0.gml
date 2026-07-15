
for (var i = 0; i < global.music_length; i++)
{
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
		music_paused[0] = 0;
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
		if (exists(obj_over_controller) == 1 && obj_over_controller.con == 9)
			music_set(0, mus_gameover, , 0, , , , 1);
	}
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
	music_set(0, mus_corridors);
	music_set(1, -1);
	if (global.chara_murder >= 2)
		music_set(0, mus_corridors_geno)
	if (global.flag[50] == 0.5)
	{
		music_set(0, mus_hurry_intro, , , , , false);
		if (music_old[0] == mus_hurry_intro && audio_playing(mus_hurry_intro) == false) || (music_old[0] == mus_hurry_loop_0) || (music_old[0] == mus_hurry_loop_1)
			music_set(0, mus_hurry_loop_0, , , , 1);
		if (exists(obj_captcha3) == true && obj_captcha3.timer.seconds <= obj_captcha3.timer.seconds_noReturn)
			music_set(1, snd_alarm, , , , 0.75);
	}
}
if (room == room_corridors_11) // bc events
{
	if (global.flag[37] == 0.25) || (global.flag[37] >= 0.75 && global.flag[39] == 0) || (global.flag[39] == 1 && global.flag[41] == 0)
		global.music[0] = -1;
	if (global.flag[37] == 0.5)
	{
		music_set(0, mus_brock_prebattle, , , , , , 0);
	}
}
if (room == room_corridors_16)
	music_set(1, -1);
if (room == room_corridors_16_B)
{
	music_set(0, -1);
	music_fadeouttime_old[0] = 5;
	music_set(1, snd_ambient_wind, , 2.5, 1, 0.5, , 1);
	global.music_volumetype[1] = VOLUME_SOUND;
}
if (room == room_corridors_17)
{
	music_set(1, -1);
	if (exists(obj_writer_controller) == 1 && global.flag[66] == 0.5)
	{
		music_paused[0] = 1;
		global.flag[66] = 0.75;
	}
	if (global.flag[66] == 0.75 && exists(obj_writer_controller) == 0)
	{
		music_paused[0] = 0;
		global.flag[66] = 1;	
	}
	music_paused[1] = music_paused[0];
}
if (room == room_corridors_18) // gabee's chase
{
	music_set(0, -1);
	music_fadeouttime_old[0] = 5;
	music_set(1, snd_ambient_wind, , 2.5, 1, 0.75, , 2.5);
	global.music_volumetype[1] = VOLUME_SOUND;
	if (exists(obj_event_gabee_chase) == 1 && obj_event_gabee_chase.con >= 9)
		music_set(1, -1);
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

if (exists(obj_chara_pause) == 1)
{
	for (var i = 0; i < global.music_length; i++)
		music_paused[i] = 1;
	paused = 1;
}
else if (paused == 1)
{
	for (var i = 0; i < global.music_length; i++)
		music_paused[i] = 0;
	paused = 0;
}

if (exists(obj_battle_quicker) == 1) || (room == room_battle)
{
	if (global.music[3] == -1)
	{
		for (var i = 0; i < (global.music_length - 1); i++)
		{
			if (global.music[i] != mus_corridors_geno)
				music_paused[i] = true;
		}
	}
	if (room == room_battle)
	{
		controller = obj_battle_controller;
		music_set(3, controller.battle_music, 1, 0, 0, 1, 1, 0.5);
		if (controller.battle_music == mus_battle_brock)
			global.music_pitch[3] = 1.05; // 105%
		if (controller.battle_won == 1) || (controller.fleeing == 1) || (controller.battle_group == 6 && controller.enemy_spare[0] >= 100) || (controller.battle_group == 2000 && controller.enemy_obj[0].flushed == 1)
		{
			music_set(3, -2);
			if (controller.battle_group == 6 && controller.enemy_spare[0] >= 100)
				music_fadeouttime_old[0] = 3;
		}
	}
}
else
{
	if (room == room_over)
		music_set(3, -2);
	if (global.music[3] == -2)
	{
		for (var i = 0; i < (global.music_length - 1); i++)
			music_paused[i] = false;
	}
	global.music[3] = -1;
}

// controlar músicas
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





































/*
// resetar
for (var i = 0; i < global.music_length; i++)
{
	oldmusic[i] = global.music[i];
	oldgain[i] = global.music_gain[i];
	oldpitch[i] = global.music_pitch[i];
	oldaudio[i] = global.music_audio[i];
	global.music_loop[i] = 1;
	global.music_gain[i] = 0.5;
	global.music_pitch[i] = 1;
	global.music_volume[i] = 1;
	
	global.music_nextpos[i] = 0;
}

// pegar músicas
var _stop_music_on_quicker = 1;
if (global.music[MUSIC_NORMAL] == mus_caverns) || (global.music[MUSIC_NORMAL] == mus_caverns_battle)
{
	if (global.battle_nextgroup == 0 && !(global.inbattle == 1 && obj_battle_controller.battle_group != 12))
		_stop_music_on_quicker = 0;
}

if (exists(obj_battle_quicker) == 0) || (_stop_music_on_quicker == 0)
{
	if (room == room_menu) // menu
	{
		if (exists(obj_menu_controller) == 1)
		{
			if (obj_menu_controller.started == 1)
			{
				global.music[MUSIC_NORMAL] = mus_menu;
				global.music_gain[MUSIC_NORMAL] = 0;
			}
	
			// going to intro
			if (global.menu_lvl == 1 && obj_menu_controller.fadingout == 1)
			{
				global.music[MUSIC_NORMAL] = -1;
				oldgain[MUSIC_NORMAL] = 1.5;
			}
		}
	}
	if (room == room_intro)
	{	
		controller = obj_intro_controller;
		if (exists(controller) == 1 && controller.playmusic == 1)
			global.music[MUSIC_NORMAL] = mus_intro;
		global.music_gain[MUSIC_NORMAL] = 0;
		global.music_loop[MUSIC_NORMAL] = 0;
	}
	
	
	if (room == room_corridors_1) // start
	{
		global.music[MUSIC_NORMAL] = -1;
		global.music[MUSIC_AMBIENCE] = -1;
	
		if (global.flag[0] >= 0.5)
		{
			global.music[MUSIC_NORMAL] = mus_start;
			if (global.flag[0] < 1)
				global.music_gain[MUSIC_NORMAL] = 7;
		
			if (global.chara_murder < 2)
			{
				global.music[MUSIC_AMBIENCE] = snd_ambient_birds;
				if (global.flag[0] < 1)
					global.music_gain[MUSIC_AMBIENCE] = 7;
			}
			else
				global.music[MUSIC_NORMAL] = mus_nobody;
		}
	}
	if (room == room_corridors_1_5)
	{
		global.music[MUSIC_NORMAL] = -1;
		global.music[MUSIC_AMBIENCE] = -1;
		oldgain[MUSIC_NORMAL] = 3;
	}
	if (room == room_corridors_2) // m6 start event
	{
		global.music[MUSIC_NORMAL] = -1;
		global.music_gain[MUSIC_NORMAL] = 0.5;
	
		if (global.flag[1] == 0.5)
		{
			global.music[MUSIC_NORMAL] = mus_m6;
			global.music_gain[MUSIC_NORMAL] = 0;
		}
		
		oldgain[MUSIC_NORMAL] = 0.5;
	}
	if (room >= room_corridors_3 && room <= room_corridors_17) // corridors
	{
		global.music[MUSIC_NORMAL] = mus_corridors;
		global.music[MUSIC_AMBIENCE] = -1;
	
		// genocide
		if (global.chara_murder >= 2)
		{
			if (global.flag[23] == 0) || (audio_playing(snd_murder) == 1)
				global.music[MUSIC_NORMAL] = -1;
			else
			{
				global.music[MUSIC_NORMAL] = mus_corridors_geno;
				if (global.flag[44] == 0)
					global.music_gain[MUSIC_NORMAL] = 0;
				global.flag[44] = 1;
			}	
		}
	}
	if (room == room_corridors_12) // bc events
	{
		if (global.flag[37] == 0.25) || (global.flag[37] >= 0.75 && global.flag[39] == 0) || (global.flag[39] == 1 && global.flag[41] == 0)
			global.music[MUSIC_NORMAL] = -1;
		if (global.flag[37] == 0.5)
		{
			global.music[MUSIC_NORMAL] = mus_brock_prebattle;
			global.music_gain[MUSIC_NORMAL] = 0;
		}
	}
	if (room == room_corridors_14) || (room == room_corridors_15) // captcha 3
	{
		if (global.flag[50] == 1 && global.flag[51] == 1 && global.flag[54] == 0)
		{
			global.music[MUSIC_NORMAL] = mus_hurry_loop_0;
			global.music_gain[MUSIC_NORMAL] = 0;
			if (exists(obj_captcha3) == 1 && obj_captcha3.stage >= 8) || (global.flag[53] == 1)
			{
				global.music[MUSIC_NORMAL] = -1;
				oldgain[MUSIC_NORMAL] = 3;
			}
		}
	}
	if (room == room_corridors_16_B)
	{
		global.music[MUSIC_NORMAL] = -1;
		oldgain[MUSIC_NORMAL] = 2;
	}
	if (room == room_corridors_18) // gabee's chase
	{
		global.music[MUSIC_NORMAL] = -1;
		oldgain[MUSIC_NORMAL] = 3;
		if (global.flag[61] == 1)
			oldgain[MUSIC_NORMAL] = 0;
			
		if (global.flag[60] == 1 && global.flag[61] == 0)
		{
			global.music[MUSIC_NORMAL] = mus_hurry_intro;
			global.music_loop[MUSIC_NORMAL] = 0;
			
			if (oldmusic[MUSIC_NORMAL] == mus_hurry_intro && audio_playing(mus_hurry_intro) == 0) || (oldmusic[MUSIC_NORMAL] == mus_hurry_loop_1)
			{
				global.music[MUSIC_NORMAL] = mus_hurry_loop_1;
				global.music_loop[MUSIC_NORMAL] = 1;
			
				eventobj = obj_event_gabee_chase;
				if (exists(eventobj) == 1 && eventobj.con >= 45)
				{
					global.music_pitch[MUSIC_NORMAL] = oldpitch[MUSIC_NORMAL];
					global.music_pitch[MUSIC_NORMAL] = lerp(global.music_pitch[MUSIC_NORMAL], 0, 0.025);
				}
			}
			
			global.music_gain[MUSIC_NORMAL] = 0;
		}
	}
	
	if (room == room_caverns_1)
	{
		global.music[MUSIC_NORMAL] = snd_titleimpact;
		global.music_pitch[MUSIC_NORMAL] = 0.3;
	
		global.music[MUSIC_AMBIENCE] = snd_ambient_wind;
		global.music_pitch[MUSIC_AMBIENCE] = 0.35;
		global.music_volume[MUSIC_AMBIENCE] = 0.25;
		
		if (global.flag[62] < 1)
		{
			global.music_gain[MUSIC_NORMAL] = 5;
			global.music_gain[MUSIC_AMBIENCE] = 5;
		}
	}
	if (room == room_caverns_2)
	{
		global.music[MUSIC_NORMAL] = -1;
		global.music[MUSIC_AMBIENCE] = -1;
	}	
	if (room == room_caverns_3) || (room == room_battle && _stop_music_on_quicker == 0) // caverns
	{
		global.music[MUSIC_NORMAL] = mus_caverns;
		global.music_volume[MUSIC_NORMAL] = 0.55;
		
		if (room == room_battle)
		{
			global.music[MUSIC_NORMAL] = mus_caverns_battle;
			global.music_volume[MUSIC_NORMAL] = 0.75;
		}
		global.music_nextpos[MUSIC_NORMAL] = audio_sound_get_track_position(global.music_audio[MUSIC_NORMAL]);
		
		if (global.flag[63] == 0)
			global.music_gain[MUSIC_NORMAL] = 3;
		global.flag[63] = 1;

		global.music[MUSIC_AMBIENCE] = snd_ambient_water;
		if (exists(obj_battle_quicker) == 1) || (room == room_battle)
			global.music[MUSIC_AMBIENCE] = -1;
	}
}
else
{
	for (var i = 0; i < 2; i++)
	{
		if (global.music[i] != -1)
		{
			postbattle_audiopos[i] = audio_sound_get_track_position(global.music_audio[i]);
			oldgain[i] = 0;
			global.music[i] = -1;
		}
	}
	
	////////
	if (global.music[MUSIC_NORMAL] != -1)
	{
		postbattle_audiopos = audio_sound_get_track_position(global.music_audio[MUSIC_NORMAL]);
		debug("postbattle_audiopos: " + string(postbattle_audiopos));
		oldgain[MUSIC_NORMAL] = 0;
		global.music[MUSIC_NORMAL] = -1;
	}
	////////
}

if (room == room_battle && _stop_music_on_quicker == 1)
{
	controller = obj_battle_controller;
	global.music[MUSIC_NORMAL] = controller.battle_music;
	global.music_gain[MUSIC_NORMAL] = 0;
	if (controller.battle_won == 1 && controller.battle_group != 0) || (controller.fleeing == 1)
		global.music[MUSIC_NORMAL] = -1;
		
	// custom
	if (controller.battle_group == -2000 && controller.enemy_obj[0].flushed == 1)
		global.music[MUSIC_NORMAL] = -1;
	if (controller.battle_group == 6 && controller.enemy_spare[0] >= 100)
	{
		global.music[MUSIC_NORMAL] = -1;
		oldgain[MUSIC_NORMAL] = 3;
	}
}	

// iniciar e parar músicas
for (var i = 0; i < global.music_length; i++)
{
	// parar música
	if (global.music[i] != oldmusic[i] && oldmusic[i] != -1)
	{
		audio_volume(global.music_audio[i], 0, oldgain[i], 1);
		global.music_audio[i] = -1;
	}
	
	// iniciar música
	if (global.music[i] != oldmusic[i] && global.music[i] != -1)
	{
		var _pos = 0;
		if (postbattle_audiopos[i] != 0 && room != room_battle)
		{
			_pos = postbattle_audiopos[i];
			postbattle_audiopos[i] = 0;
		}
		else if (global.music[i] == mus_caverns) || (global.music[i] == mus_caverns_battle)
			_pos = global.music_nextpos[i];
		else
			global.music_nextpos[i] = 0;
		
		mus_play(global.music[i], global.music_loop[i], global.music_gain[i], global.music_pitch[i], global.music_volume[i], _pos);
		global.music_audio[i] = thismusic;
	}
	
	if (global.music_audio[i] != -1) // set pitch
	{
		audio_pitch(global.music_audio[i], global.music_pitch[i]);
		
		//debug ("mus: " + audio_get_name(global.music_audio[i]) + " | pitch: " + string(global.music_pitch[i]));
	}

	////////
	// play music and stop old music
	if (global.music[i] != oldmusic[i] && audio_paused(global.music[i]) == 0)
	{
		if (oldmusic[i] != -1)
		{
			thisold = oldaudio[i];
			audio_volume(thisold, 0, oldgain[i]);
		}
		
		if (global.music[i] != -1)
		{
			mus_play(global.music[i], global.music_loop[i], global.music_gain[i], global.music_pitch[i], global.music_volume[i])
			global.music_audio[i] = thismusic;
		}

		debug("music_play - new music: " + string(audio_get_name(global.music[i])) + " | old music: " + string(audio_get_name(oldmusic[i])));
	}
	////////

	////////
	// pause and resume
	if (exists(obj_battle_quicker) == 1 && global.music[i] != -1 && audio_paused(global.music_audio[i]) == 0)
	{
		audio_pause(global.music_audio[i]);
		debug("music_pause");
	}
	else if (exists(obj_battle_quicker) == 0 && audio_paused(global.music_audio[i]) == 1 && room != room_battle)
	{
		audio_resume(global.music_audio[i]);
		debug("music_resume");
		//audio_volume(global.music_audio[i], global.volume[VOLUME_MUSIC], 0.5);
	}
	////////
}

// realmente parar a música
if (thisold != -1 && audio_sound_get_gain(thisold) == 0)
{
	audio_stop(thisold);
	thisold = -1;
}

*/


















