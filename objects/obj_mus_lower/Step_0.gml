
if (active == 1)
{
	if (audio_sound_get_gain(mymusic) <= 0)
	{
		if (myobjective == 0)
		{
			global.music_fading[mypos] = 0;
			audio_stop_sound(mymusic);
		}
		else if (myobjective == 1)
			audio_pause_sound(mymusic);
			
		instance_destroy();
	}
}






