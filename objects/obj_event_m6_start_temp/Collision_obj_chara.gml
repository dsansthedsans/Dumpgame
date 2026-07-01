
if (global.chara_move == 1 && global.chara_menu == 0 && global.chara_cutscene == 0)
{
	if (global.flag[1] == 0 && con == 0)
	{
		global.flag[1] = 1;
		global.flag[2] = 1;
		audio_play(snd_notification_achievement_old, 0, VOLUME_SOUND);
		side_create(obj_chara.x, obj_chara.y, "m6");
		instance_destroy();
	}
	else if (global.flag[1] == 1 && con == 0)
		instance_destroy();
}