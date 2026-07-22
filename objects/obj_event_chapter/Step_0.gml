
if (con == 2)
{
	if (room == room_corridors_1)
		global.flag[0] = 0.5;
	else if (room == room_caverns_1)
		global.flag[62] = 0.5;
	con  = 2.25;
	alarm[4] = (getuptime / 2);
}
if (con == 2.5)
{
	fade_alpha -= 0.0025;
	if (fade_alpha <= 0)
	{
		alarm[2] = (getuptime / 2);
		con = 3;
	}
}
if (aftercon == 2)
{
	chapter_alpha -= 0.0025;
	if (chapter_alpha <= 0)
		aftercon = 0;
}
if (con == 4)
{
	chara.image_index = 1;
	shakeobj(chara, 1.75, 1.75, 0.15);
	audio_play(snd_bump, 0, VOLUME_SOUND);
	alarm[2] = (getuptime / 2);
	con = 5;
}
if (con == 6)
{
	chara.image_index = 0;
	alarm[2] = (getuptime / 10);
	con = 7;
}
if (con == 8)
{
	chara.image_index = 1;
	alarm[2] = (getuptime / 4);
	con = 9;
}
if (con == 10)
{
	chara_facing(SIT);
	with (chara)
		shakeobj_small();
	audio_play(snd_bump, 0, VOLUME_SOUND);
	alarm[2] = (getuptime / 2);
	con = 11;
}
if (con == 12)
{
	chara_facing(DOWN);
	global.chara_camera_move = 1;
	chara.y -= 10;
	with (chara)
		shakeobj_small();
	shaker = chara.shaker;
	audio_play(snd_bump, 0, VOLUME_SOUND);
	alarm[2] = 30;
	con = 13;
}
if (con == 14 && exists(shaker) == 0)
{
	chara_change(-1, 1, 1, 0, 1, 1, 1);
	con = -1;
}