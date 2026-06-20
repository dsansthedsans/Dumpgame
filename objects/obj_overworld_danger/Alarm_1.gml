/// @descr change color

if (audio_playing(snd_battle_danger) == 0)
	audio_play(snd_battle_danger, 0, 0);
image_alpha = !image_alpha;
alarm[1] = changetime;