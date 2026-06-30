
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[18] == 0)
	{
		global.chara_steps = 9999;
		global.flag[18] = 0.5;
		global.battle_nextgroup = 2;
		destroy(id);
	}
	else
		destroy(id);
}