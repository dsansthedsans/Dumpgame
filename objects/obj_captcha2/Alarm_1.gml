/// @descr start bridge movement and create writer
for (var i = 0; i < 3; i++)
{
	if (puzzle_complete[i] == 0.25)
	{
		puzzle_complete[i] = 0.5;
		audio_play(snd_option_movehold, 1, VOLUME_SOUND);
	}
}
if (global.flag[34] == true && thiswriter == undefined)
	writer("event_m6_postcaptcha2", -1, -1);