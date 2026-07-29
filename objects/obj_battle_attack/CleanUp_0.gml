if (enemy == 7 && attack == 0 && stage >= 2 && ball.rotate.id != undefined && audio_playing(ball.rotate.id) == true)
	audio_stop(ball.rotate.id);