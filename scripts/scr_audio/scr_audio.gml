
function audio_gain(_audio, _volume, _time, _fadein, _volume_type)
{
	var _asset = _audio;
	if (audio_sound_get_asset(_asset) != undefined)
		_asset = audio_sound_get_asset(_asset);
	_volume *= 2;
	if (_volume_type == VOLUME_SOUND)
	{
		if (_asset == snd_voiceDump)
			_volume *= 0.75;
		if (_asset == snd_option_movehold)
			_volume *= 0.5;
		if (_asset == snd_option_return)
			_volume *= 0.75;
		if (_asset == snd_ambient_birds)
			_volume *= 0.5;
		if (_asset == snd_ambient_wind)
			_volume *= 0.75 + 0.125;
		if (_asset == snd_ambient_water)
			_volume *= 1.25;
		if (_asset == snd_bird_startfly)
			_volume /= 2;
		if (_asset == snd_step1) || (_asset == snd_step2)
			_volume *= (0.5 + 0.125);
		if (_asset == snd_impactGrab)
			_volume *= 0.5;
		if (_asset == snd_impact)
			_volume *= 0.75;
		if (_asset == snd_writer_m6) || (_asset == snd_writer_m6_tense) || (_asset == snd_writer_m6_angry)
			_volume *= 0.35;
		if (_asset == snd_surprise)
			_volume *= 0.5 + (0.25 / 2);
		if (_asset == snd_heartpulse1)
			_volume *= 0.75 - 0.125;
		if (_asset == snd_heartpulse2)
			_volume *= 0.75;
		if (_asset == snd_explosion1)
			_volume = 0.75;
		if (_asset == snd_ambient_wind)
			_volume *= 0.5;
		if (_asset == snd_impactSwing)
			_volume *= 1;
		if (_asset == snd_writer_brock)
			_volume *= 0.5;
		if (_asset == snd_launchShock)
			_volume *= 0.5;
		if (_asset == snd_launch) || (_asset == snd_launch_reverse)
			_volume *= 0.75;
		if (_asset == snd_explosion2)
			_volume *= 0.375;
		if (_asset == snd_writer_gabee) || (_asset == snd_writer_dsans)
			_volume /= 5;
		if (_asset == snd_splat) || (_asset == snd_splat_reversed)
			_volume *= 0.5;
		if (_asset == snd_impactBluh)
		{
			_volume *= 0.5;
		}
		if (_asset == snd_impactBump)
			_volume *= 0.75;
		if (_asset == snd_trombone)
			_volume *= 1.5;
		if (_asset == snd_crowdApplause) || (_asset == snd_crowdCheer)
			_volume *= 0.5;
		if (_asset == snd_alarm)
			_volume *= 1.5;
		if (_asset == snd_murder)
			_volume *= 0.5;
		if (_asset == snd_jingleFail)
			_volume *= 0.5;
		if (_asset == snd_battle_danger)
			_volume *= 0.75;
		if (_asset == snd_save)
			_volume *= 0.75;
		if (_asset == snd_heal)
			_volume *= 1 - 0.125;
		if (_asset == snd_victory)
			_volume *= 0.75;
		if (_asset == snd_pedronstro)
			_volume *= 0.5;
		if (_asset == snd_879)
			_volume *= 0.5;
		if (_asset == snd_shriekYowl)
			_volume *= 0.75;
		if (_asset == snd_appearSword) || (_asset == snd_rotate)
			_volume *= 0.75;
		if (_asset == snd_buildupComputer)
			_volume *= 0.625;
		if (_asset == snd_bellFlower)
			_volume *= 1.5;
	}
	if (_volume_type == VOLUME_MUSIC)
	{
		_volume *= 0.5;
		
		if (_asset == mus_event_chapter1)
			_volume *= 1.25;
		if (_asset == mus_event_rhonhey_battle)
			_volume *= 1.5;
		if (_asset == mus_event_m6)
			_volume *= 2.5;
		if (_asset == mus_corridors)
			_volume *= 1 - 0.125;
		if (_asset == mus_battle_dummy)
			_volume *= 1.25;
		if (_asset == mus_event_chapter2)
			_volume *= 4;
		if (_asset == mus_cave)
			_volume *= 1.125;
		if (_asset == mus_hurry_intro)
			_volume *= 2;
		if (_asset == mus_hurry_loop_0) || (_asset == mus_hurry_loop_1)
			_volume *= (1.5 - 0.125);
		if (_asset == mus_corridors_geno)
			_volume *= 1.25;
		if (_asset == mus_battle_troll)
			_volume *= 1.25;
		if (_asset == mus_event_brock_mad)
			_volume *= 1.25;
		if (_asset == mus_battle_brock)
			_volume *= 1.25;
		if (_asset == mus_event_brock_sad)
			_volume *= 1.5;
	}
	_volume *= (global.volume[_volume_type] * global.volume[VOLUME_MASTER]);
	if (_fadein == 1)
		audio_sound_gain(_audio, 0, 0);
	audio_sound_gain(_audio, _volume, (_time * 1000));
}
function audio_pitch(_audio, _pitch)
{
	var _asset = _audio;
	if (audio_sound_get_asset(_asset) != undefined)
		_asset = audio_sound_get_asset(_asset);
	if (_asset == snd_bird_startfly)
		_pitch *= irandom_range(1.25, 1.35);
	if (_asset == mus_event_rhonhey_battle) || (_asset == mus_event_brock_sad)
		_pitch *= 1.25;
	audio_sound_pitch(_audio, _pitch);
}
function audio_play(_audio, _loop = false, _volume_type = VOLUME_MASTER, _gain = 1, _gain_time = 0, _gain_fadein = 0, _pitch = 1)
{
	thisaudio = audio_play_sound(_audio, 80, _loop);
	audio_gain(thisaudio, _gain, _gain_time, _gain_fadein, _volume_type);
	audio_pitch(thisaudio, _pitch);
	if (_audio == snd_splat_reversed)
		audio_sound_set_track_position(thisaudio, 0.2);
	return thisaudio;
}
function audio_stop(_audio)
{	
	audio_stop_sound(argument0);
}
function audio_pause(_audio)
{
	audio_pause_sound(argument0);	
}
function audio_resume(_audio)
{
	audio_resume_sound(argument0);	
}

function audio_playing(_audio)
{
	return audio_is_playing(argument0)	
}
function audio_paused(_audio)
{
	return audio_is_paused(argument0);	
}

function music_set(_pos, _music, _gain_volume = 1, _gain_time = 0, _gain_fadein = 0, _pitch = 1, _loop = 1, _fade_out_time = 1)
{
	var i = _pos;
	global.music[i] = _music;
	global.music_gain_volume[i] = _gain_volume;
	global.music_gain_time[i] = _gain_time;
	global.music_gain_fadein[i] = _gain_fadein;
	global.music_pitch[i] = _pitch;
	global.music_loop[i] = _loop;
	global.music_fadeouttime[i] = _fade_out_time
	global.music_volumetype[i] = VOLUME_MUSIC;
	global.music_offset[i] = 0;
}
