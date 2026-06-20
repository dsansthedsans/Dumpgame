
if (con == 2)
{
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
	with (chara)
		shakeobj_small();
	audio_play(snd_bump, 0, 0);
	alarm[2] = getuptime;
	con = 9;
}
if (con == 10)
{
	chara.image_index = 2;
	with (chara)
		shakeobj_small();
	audio_play(snd_bump, 0, 0);
	alarm[2] = getuptime;
	con = 11;
}
if (con == 12)
{
	global.chara_facing = DOWN;
	chara.y -= 10;
	with (chara)
		shakeobj_small();
	shaker = chara.shaker;
	audio_play(snd_bump, 0, 0);
	con = 13;
}
if (con == 13 && exists(shaker) == 0)
{
	global.flag[62] = 1;
	global.chara_move = 1;
	global.chara_interact = 1;
	global.chara_cutscene = 0;
	global.chara_cameramove = 1;
	destroy(id);	
}