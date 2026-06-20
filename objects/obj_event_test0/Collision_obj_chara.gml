
if (con == 0 && global.testflag[0] == 0)
{
	con = 1;
	siner = 0;
	marker(440, 120, obj_chara.sprite_r, 1, 1, 1, 0, 0, 0, c_white, -bbox_bottom);

	global.testflag[0] = 1;
	global.chara_move = 0;
	global.chara_facing = 1;
	global.chara_cutscene = 1;
	chara_stop();
	audio_volume(snd_ambient_water, 0, 1);
}
else if (global.testflag[0] == 1 && con == 0)
{
	global.chara_cutscene = 0;
	instance_destroy();
}