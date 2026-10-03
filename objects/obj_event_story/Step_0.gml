if (con == 1)
{
	writer("event_story");
	con += 1;
}
else if (con == 2 && aftercon == 0)
{
	if (exists(thiswriter) == true && thiswriter.writing == false && thiswriter.msg_next[0] == false)
	{
		aftercon = 1;
		alarm[5] = 120;
	}
	else if (exists(thiswriter) == false)
	{
		con += 1;
		alarm[2] = (60 * 3);
	}
}
if (aftercon == 2 && exists(thiswriter) == true)
{
	with (thiswriter)
		event_user(1);
	aftercon = 0;
}
if (con == 4)
{
	room_goto(room_corridors_1);
	con += 1;
}