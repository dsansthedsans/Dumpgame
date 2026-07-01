
if (con == 1)
{
	global.chara_move = 0;
	global.chara_facing = DOWN;
	global.chara_cutscene = 1;
	chara_stop();
	party_stop(0);
	party_change(0, -1, -1);
	party_facing(0, DOWN);
	
	marker((room_width / 2), -40, unused_spr_happybirthday_cake, 1, 1, 1, 0, 0, 0, c_white, -999);
	cake = thismarker;
	con = 2;
}
if (con == 2)
{
	if (audio_playing(snd_option_movehold) == 0)
		audio_play(snd_option_movehold, 1, VOLUME_SOUND);
	cake.y += 1;
	if (cake.y >= 130)
	{
		cake.y = 130;
		audio_stop(snd_option_movehold);
		audio_play(snd_item, 0, VOLUME_SOUND);
		con = 3;
		alarm[2] = 80;
	}
}
if (con == 4)
{
	audio_play(unused_snd_happybirthday_applause, 0, VOLUME_SOUND);
	audio_play(unused_snd_happybirthday_cheer, 0, VOLUME_SOUND);
	con = 5;
}
if (con == 5)
{
	marker(irandom_range(-10, (room_width + 10)), irandom_range(-5, -35), spr_singlepixel, 1, irandom_range(3, 5), irandom_range(3, 5), 0, 0, 0, choose(c_red, c_blue, c_lime, c_yellow, c_aqua, c_fuchsia, c_green, c_orange), -1000);
	p = thismarker;
	p.vspeed = 1.5;
	partdelay -= 1;
	if (partdelay <= 0)
	{
		alarm[2] = 120;
		con = 6;
	}
}
if (con == 7)
{
	global.chara_move = 1;
	global.chara_cutscene = 0;
	party_change(0, 1, UP);
	con = 8;
}