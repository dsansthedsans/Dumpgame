
if (con == 1)
{
	global.chara_move = 0;
	global.chara_facing = DOWN;
	global.chara_cutscene = 1;
	chara_stop();
	party_stop(0);
	party_change(0, -1, -1);
	party_facing(0, DOWN);
	marker((room_width / 2), 0, spr_happybirthday_cake, 1, 1, 1, 0, 0, 0, c_white, -999);
	cake = thismarker;
	con += 1;
}
if (con == 2)
{
	if (audio_playing(snd_option_movehold) == 0)
		audio_play(snd_option_movehold, 1, VOLUME_SOUND);
	cake.y += 1;
	if (cake.y >= 125)
	{
		cake.y = 125;
		audio_stop(snd_option_movehold);
		audio_play(snd_stingItem, 0, VOLUME_SOUND);
		con += 1;
		alarm[2] = 80;
	}
}
if (con == 4)
{
	audio_play(snd_crowdApplause, 0, VOLUME_SOUND);
	audio_play(snd_crowdCheer, 0, VOLUME_SOUND);
	con += 1;
}
if (con == 5)
{
	obj_PARTICLE_CONTROLLER.confetti_active = global.visualeff;
	alarm[2] = (60 * 3);
	con += 1;
}
if (con == 7)
{
	global.chara_move = 1;
	global.chara_cutscene = 0;
	party_change(0, 1, UP);
	con += 1;
}