
function audio_gain(_audio, _volume, _time, _fadein, _volume_type)
{
	if (_volume_type == VOLUME_SOUND)
		_volume *= 1.5;
	if (_audio == snd_txt_m6)
		_volume *= 0.7;
	if (_audio == snd_txt_gabee) || (_audio == snd_txt_dsans)
		_volume /= 5;
	_volume = (_volume * global.volume[_volume_type] * global.volume[VOLUME_MASTER]);
	if (_fadein == 1)
		audio_sound_gain(_audio, 0, 0);
	audio_sound_gain(_audio, _volume, (_time * 1000));
}
function audio_pitch(_audio, _pitch)
{
	audio_sound_pitch(argument0, argument1);
}

function audio_play(_audio, _loop = false, _volume_type = VOLUME_MASTER, _gain = 1, _gain_time = 0, _gain_fadein = 0, _pitch = 1)
{
	thisaudio = audio_play_sound(_audio, 80, _loop);
	audio_gain(thisaudio, _gain, _gain_time, _gain_fadein, _volume_type);
	audio_pitch(thisaudio, _pitch);
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

function music_set(_pos, _music, _gain_volume = 1, _gain_time = 0, _gain_fadein = 0, _pitch = 1, _loop = 1, _fade_out_time = 0.5)
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
}
