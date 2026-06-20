
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[18] == 0)
	{
		obj_chara.steps = 9999;
		global.flag[18] = 0.5;
		destroy(id);
	}
	else
		destroy(id);
}