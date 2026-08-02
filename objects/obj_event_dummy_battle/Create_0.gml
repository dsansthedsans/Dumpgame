event_inherited();
if (global.flag[2] == true && global.flag[4] == false && global.flag[6] == false && global.flag[7] == false)
|| (global.flag[2] == true && global.flag[4] == true && global.flag[6] == true && global.flag[7] == false)
{
	con = 1;
	m6 = obj_party;
	chara_facing(UP);
	chara_change(-1, 0, 0, 1, 0, 0, 1);
}
else
	instance_destroy();