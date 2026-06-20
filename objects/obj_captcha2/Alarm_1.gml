/// @descr start bridge movement

for (var i = 0; i < 3; i++)
{
	if (puzzle_complete[i] == 0.25)
	{
		puzzle_complete[i] = 0.5;
		audio_play(snd_option_movehold, 1, 0);
	}
}