if (con == 1 && exists(thiswriter) == false)
{
	global.flag[71] = 1;
	chara_change(-1, true, true, false, true, true, true);
	chara_facing(DOWN);
	destroy(id);
}