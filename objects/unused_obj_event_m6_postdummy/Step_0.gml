
if (con == 1 && exists(obj_party) == 1)
{
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	chara_facing(UP);
	chara = obj_chara;
	chara.x = 150;
	chara.y = 190;
	
	party_change(0, 0, 0, -1, -1);
	party_facing(0, UP);
	m6 = global.party[0];
	m6.x = 170;
	m6.y = 190;
	
	alarm[2] = 60;
	con = 2;
}
if (con == 3)
{
	writer("event_m6_postdummy", -1, -1);
	con = 4;
}
if (con == 4 && instance_exists(thiswriter) == 0)
{
	global.flag[7] = 1;
	
	chara_facing(DOWN);
	chara_change(-1, 1, 1, 0, 1, 1, 1);
	party_change(0, 1, 0, RIGHT, LEFT);
	destroy(id);
}