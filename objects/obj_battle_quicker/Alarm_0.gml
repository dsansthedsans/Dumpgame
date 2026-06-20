
myalpha = 1;
switch_amt += 1;
heart_alpha = !heart_alpha;
if (heart_alpha == 1)
	audio_play(snd_heartpulse1, 0, VOLUME_SOUND);

if (switch_amt < switch_max)
	alarm[0] = 4;
else
	alarm[1] = 1;