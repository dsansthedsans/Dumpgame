
if (con == 0)
{
	thing[0].speed = 3;
	thing[0].direction = 180;
	y = 660;
	sound = 1;
	con = 1;
	global.flag[66] = 0.5;
}
else if (con == 1)
{
	thing[1].speed = 4;
	thing[1].direction = 90;
	sound = 2;
	con = 2;
	global.flag[66] = 1;
}
if (sound > 0)
{
	var _pitch = 0.5;
	if (sound == 2)
		_pitch = 0.75;
	audio_play(snd_step1, 0, VOLUME_SOUND, 1, , , _pitch);
	audio_play(snd_step2, 0, VOLUME_SOUND, 1, , , _pitch);
	sound = 0;
}