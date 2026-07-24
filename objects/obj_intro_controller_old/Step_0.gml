
if (active == 1)
{
	// mudar alpha
	if (stage == 0)
	{
		image_alpha -= alpha_amt;
		if (image_alpha <= 0)
			stage = 1;
	}
	if (stage == 1)
	{
		image_alpha += alpha_amt;
		if (image_alpha >= 1)
			stage = 2;
	}
	
	// mudar página
	if (stage == 0 && thiswriter.writing == 0)
	{
		if (thiswriter.page < 10)
		{
			var _time = 152;	
			alarm[1] = _time;
			alarm[2] = (_time - 20);
			stage = 1;
		}
		else
		{
			alarm[3] = 240;
			stage = 2;
		}
	}
	
	// intro fade out
	if (stage == 3)
	{
		fade_alpha += 0.0035;
		if (fade_alpha >= 1 && audio_playing(snd_cymbal) == 0)
		{
			event_user(0);
			stage = 4;
		}
	}
	
	// skip
	if (key("enter_press") == 1)
		event_user(0);
}