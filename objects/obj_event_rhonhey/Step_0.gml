if (con == 1 && chara.bbox_top <= 980) || (con == 2 && chara.bbox_top <= 680)
{
	global.flag[66] += 1;
	con += 1;
	thing_object[(con - 2)].speed = 5;
	audio_play(snd_pedronstro, false, VOLUME_SOUND);
}
if (con == 3 && chara.bbox_top <= 200 && global.chara_move == true)
{
	chara_change(-1, false, false, true, false, false, false);
	chara_stop();
	surprise(obj_chara);
	audio_play(snd_surprise, false, VOLUME_SOUND);
	con = 4;
}
if (con == 4)
{
	game.cam_y -= 3;
	if (game.cam_y <= 0)
	{
		con = 5;
		alarm[2] = 30;
	}
}
if (con == 6)
{
	con = 7;
	alarm[2] = 60;
	audio_play(snd_enemy_hurt2, false, VOLUME_SOUND);
}
if (con == 8)
{
	con = 9;
	audio_play(snd_879, false, VOLUME_SOUND, , , , 0.5);
}
if (con == 9)
{
	thing_object[2].x = lerp(thing_object[2].x, chara.x, 0.1);
	thing_object[2].y = lerp(thing_object[2].y, chara.y, 0.1);
	if (thing_object[2].y >= (chara.y - 20))
	{
		global.battle_nextgroup = 13;
		battle();
		con = 10;
		audio_stop(snd_879);
	}
}