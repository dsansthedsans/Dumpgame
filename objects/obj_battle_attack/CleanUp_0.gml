if (enemy == 7 && attack == 0 && stage >= 2)
{
	if (ball.rotate.id != undefined && audio_playing(ball.rotate.id) == true)
		audio_stop(ball.rotate.id);
	if (mee6.buildup.id != undefined && audio_playing(mee6.buildup.id) == true)
		audio_stop(mee6.buildup.id);
}