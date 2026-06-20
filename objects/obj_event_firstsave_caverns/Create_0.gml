
event_inherited();

if (global.flag[63] == 0)
{
	global.chara_move = 0;
	global.chara_facing = UP;
	global.chara_cutscene = 1;
	chara = obj_chara;
	alarm[2] = 2;
}
else
	destroy(id);





