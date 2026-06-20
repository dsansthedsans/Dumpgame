
event_inherited();

if (global.flag[2] == 1 && global.flag[52] == 0)
{
	con = 1;
	chara = obj_chara;
	m6 = obj_party;
	
	global.chara_move = 0;
	global.chara_facing = UP;
	global.chara_interact = 0;
	global.chara_cutscene = 1;
}
else
	instance_destroy();

