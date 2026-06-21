
ball[0] = -1;
ball_amt = 5;
for (var i = 1; i < ball_amt; i++)
{
	create(0, 0, unused_obj_rhonheyattacktest_ball);
	ball[i] = thisobj;
	
	/*
	thisobj.factor = (2 * i);
	thisobj.pos = i;
	*/
}
active = 1;