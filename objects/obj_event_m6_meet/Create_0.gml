event_inherited();
if (global.flag[2] == false && global.flag[1] == false)
{
	con = 1;
	chara = obj_chara;
	chara_facing(UP);
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	cutout_draw = false;
}
else
	instance_destroy();

