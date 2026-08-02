
event_inherited();

if (global.flag[2] == 1 && global.flag[4] == 1 && global.flag[5] == 1 && global.flag[6] == 1 && global.flag[7] == 0)
	con = 1;
else	
	destroy(id);

/*
if (global.flag[2] == 1 && global.flag[4] == 1 && global.flag[5] == 1 && global.flag[6] == 1 && global.flag[7] == 0 && exists(obj_party) == 1)
{
	con = 1;
	
	chara = obj_chara;
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	chara_facing(UP);
	
	m6 = global.party[0]; //obj_sidechara;
	party_change(0, 0, 0, -1, -1);
	party_facing(0, UP);
	
	////////
	global.chara_move = 0;
	global.chara_cutscene = 1;
	////////
}
else
	destroy(id);
*/

