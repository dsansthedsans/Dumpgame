
if (con == 1 && exists(thiswriter) == 0)
{
	global.flag[42] = 1;	
	chara_change(-1, 1, 1, 0, 1, 1, 1);
	party_change(0, 0, -1);
	instance_destroy();
}