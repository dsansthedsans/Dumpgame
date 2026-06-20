/// @descr destroy

if (audio_playing(snd_battle_danger) == 1)
	audio_stop(snd_battle_danger);
destroy(id);