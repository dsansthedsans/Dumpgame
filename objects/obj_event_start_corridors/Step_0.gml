
if (con == 2)
{
	global.flag[0] = 0.5;
	fade_alpha -= 0.0025;
	if (fade_alpha <= 0)
	{
		alarm[2] = 120;
		con = 3;
	}
}
if (aftercon == 2)
{
	section_alpha -= 0.005;
	if (section_alpha <= 0)
		aftercon = 0;
}
if (con == 4)
{
	chara.image_index = 1;
	shakeobj(chara, 1.75, 1.75, 0.15);
	audio_play(snd_bump, 0, VOLUME_SOUND);
	alarm[2] = (getuptime / 1.5);
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
	alarm[2] = (getuptime / 1.5);
	con = 9;
}
if (con == 10)
{
	chara_facing(SIT);
	with (chara)
		shakeobj_small();
	audio_play(snd_bump, 0, VOLUME_SOUND);
	alarm[2] = getuptime;
	con = 11;
}
if (con == 12)
{
	chara_facing(DOWN);
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
	global.flag[0] = 1;
	chara_change(-1, 1, 1, 0, 1, 1, 1);
	destroy(id);	
}