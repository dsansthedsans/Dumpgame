
event_inherited();

if (global.flag[0] == 0)
{
	global.chara_move = 0;
	global.chara_facing = UP;
	global.chara_cutscene = 1;
	chara = obj_chara;

	con = 1;
}
else
	destroy(id);





