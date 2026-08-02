
if (con == 1 && exists(obj_movetopoint) == 0)
{
	chara.x = chara_targetx;
	chara.y = chara_targety;
	chara_stop();
	m6.x = m6_targetx;
	m6.y = m6_targety;
	party_stop(0); //side_stop(0);
	alarm[2] = 45;
	con = 2;
}
if (con == 3)
{
	writer("event_m6_predummy_0", -1, -1);
	con = 4;
}
if (con == 4 && exists(thiswriter) == 0)
{
	alarm[2] = 30;
	con = 5;
}
if (con == 6)
{
	writer("event_m6_predummy_1", -1, -1);
	con = 7;
}
if (con == 7 && exists(thiswriter) == 0)
{
	global.flag[4] = 1;
	chara_change(-1, 1, 1, 0, 1, 1, 1);
	chara_facing(DOWN);
	party_change(0, 1, RIGHT);				//party_change(0, 1, 0, RIGHT, LEFT);
	destroy(id);

	/*
	global.chara_move = 1;
	global.chara_facing = DOWN;
	global.chara_cutscene = 0;
	side_change(0, 1, 0, RIGHT, LEFT);
	instance_destroy();
	*/
}