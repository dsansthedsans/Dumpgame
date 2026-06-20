
if (con == 1 && exists(thiswriter) == 0)
{
	global.flag[16] = 1;	
	global.chara_move = 1;
	global.chara_facing = DOWN;
	global.chara_cutscene = 0;
	side_change(0, 1, 1, -1, -1);
	destroy(id);
}