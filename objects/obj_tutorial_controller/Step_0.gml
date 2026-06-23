
if (delay > 0)
	delay -= 1;

if (con == 1)
{
	alpha = 1;
	audio_play(snd_option_move, 0, VOLUME_SOUND);
	delay = time;
	con = 2;
}
if (con == 2 && delay <= 0)
{
	alpha = lerp(alpha, 0, alpha_amt);
	if (alpha <= 0.01)
		destroy(id);
}