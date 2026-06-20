
/*
// turn on
if (drp == 0 && global.drpenabled == 1 && failed == 0)
{
	drp = np_initdiscord("1144068271193215006", 0, 0);
	if (drp == 1)
	{
		details = "";
		state = "";
		face = "";
		face_info = "";
		np_setpresence_timestamps(date_current_datetime(), 0, 0)
		np_setpresence_more("", "", false);
		np_setpresence("", "", "", "")
	}
	else
	{
		debug("--- obj_DRP_CONTROLLER: Failed to activate Discord RPC");
		failed = 1;
	}
}

// turn off
else if (drp == 1 && global.drpenabled == 0)
{
	np_clearpresence();
	drp = 0;
}

alarm[0] = 60;
*/








/*
global.discordrpc = np_initdiscord("1144068271193215006", 0, 0);
if (global.discordrpc == 1)
{
	details = "";
	state = "";
	face = "";
	face_info = "";
	np_setpresence_timestamps(date_current_datetime(), 0, 0)
	np_setpresence_more("", "", false);
	np_setpresence("", "", "", "")
}
else
{
	enabled = 0;
	debug("------ FAILED TO START DISCORD RPC ------")
}
*/