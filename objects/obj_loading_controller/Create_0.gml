
depth = -1000;

for (var i = 0; i < 999; i++)
{
	if (audio_exists(i) == 1)
	{	
		var z = audio_play_sound(i, 50, 0);
		audio_sound_gain(z, 0, 0);
	}
	else
		break;
}