/// @descr change color

curcolor += 1;
if (curcolor >= colorlength)
	curcolor = 0;
if (audio_playing(snd_battle_danger) == 0)
	audio_play(snd_battle_danger, 0, 0);
alarm[1] = changetime;






















