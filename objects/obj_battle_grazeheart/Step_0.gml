
if (place_meeting(x, y, obj_battle_blt) == 1)
{
	if (image_alpha != 1)
		audio_play(snd_battle_graze, 0, VOLUME_SOUND);
	image_alpha = 1;
}
else if (image_alpha > 0)
	image_alpha -= 0.05;