
event_inherited();

if (global.flag[2] == 1 && global.flag[8] == 0 && global.flag[15] == 0 && global.flag[16] == 0)
{
	con = 1;
	chara = obj_chara;
	m6 = obj_party;
	chara_facing(UP);
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	if (instance_exists(m6) == true)
	{
		party_facing(0, UP);
		party_change(0, -1, -1);
	}
}
else
	instance_destroy();

