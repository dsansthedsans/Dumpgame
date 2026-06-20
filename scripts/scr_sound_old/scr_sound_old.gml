
// general
function _audio_stop(_audio)
{
	audio_stop_sound(argument0);	
}
function _audio_pause(_audio)
{
	audio_pause_sound(argument0);
}
function _audio_pos(_audio, _pos)
{
	audio_sound_set_track_position(argument0, argument1);
}
function _audio_resume(_audio)
{
	audio_resume_sound(argument0);
}
function _audio_volume(_audio, _level, _time_in_seconds, _type)
{
	// 0 = fade in; 1 = fade out
	
	if (argument3 == 0)
		audio_sound_gain(argument0, 0, 0);
	audio_sound_gain(argument0, (argument1 * global.volume[VOLUME_MASTER]), (argument2 * 1000));
}
function _audio_playing(_audio)
{
	return audio_is_playing(argument0);
}
function _audio_paused(_audio)
{
	return audio_is_paused(argument0);
}
function _audio_pitch(_audio, _pitch)
{
	audio_sound_pitch(argument0, argument1);
}

// sound effect
function _audio_play(_sound, _loop, _gain_in_seconds)
{
	var _snd = argument0;
	var _volume_amt = 1;
	if (_snd == snd_keyreset)
		_volume_amt = 0.35;
	if (_snd == snd_explosion2) || (_snd == snd_txt_dsans) || (_snd == snd_txt_gabee)
		_volume_amt = 0.6;
	if (_snd == snd_txt_m6) || (_snd == snd_enemy_hurt2) || (_snd == snd_enemy_hurt4) || (_snd == snd_notification_achievement) || (_snd == snd_explosion3)
		_volume_amt = 0.8;
	if (_snd == snd_enemy_hurt3)
		_volume_amt = 0.9;
	
	thisaudio = audio_play_sound(argument0, 80, argument1);
	audio_volume(thisaudio, (_volume_amt * global.volume[VOLUME_SOUND]), argument2, 0);
	audio_pitch(thisaudio, 1);
}

// music (normal and ambience)
function _mus_play(_music, _loop, _gain_in_seconds, _pitch, _volume, _pos)
{
	thismusic = audio_play_sound(argument0, 120, argument1);
	audio_volume(thismusic, (argument4 * global.volume[VOLUME_MUSIC]), argument2, 0);
	audio_pitch(thismusic, argument3);
	audio_pos(thismusic, argument5);
}