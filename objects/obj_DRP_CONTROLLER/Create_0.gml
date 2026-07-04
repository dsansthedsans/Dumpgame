
ready = 0;

details = "";
state = "";
face = "";
face_info = "";

drp = np_initdiscord("1144068271193215006", 0, 0);
if (drp == 1)
{
	np_setpresence_timestamps(date_current_datetime(), 0, 0)
	np_setpresence_more("", "", false);
	np_setpresence("", "", "", "");
}
else
	debug("--- obj_DRP_CONTROLLER: Failed to activate Discord RPC");
