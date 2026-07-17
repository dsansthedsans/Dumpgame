
event_inherited();

if (global.flag[2] == 1 && global.flag[52] == 0)
{
	con = 1;
	chara = obj_chara;
	m6 = obj_party;
	
	chara_change(-1, false, false, true, false, false, true);
	chara_facing(UP);
}
else
	instance_destroy();

