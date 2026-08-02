if (con == 0 && global.chara_move == true && global.flag[70] == true && global.flag[71] == false)
{
	global.flag[71] = 0.5;
	chara_change(-1, false, false, true, false, false, true);
	chara_stop();
	writer("cellphone_developer");
	audio_play(snd_cellphone, false, VOLUME_SOUND);
	con = 1;
}