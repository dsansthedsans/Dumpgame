

// definir sprite
event_user(0);


// criar MEE6
if (global.flag[2] == 1 && exists(obj_party) == 0) // create MEE6
{
	if (exists(obj_room_transition) == 0) || (exists(obj_room_transition) && obj_room_transition.altcon >= 2)
	{
		start_party();
		party_create(x, y, "m6", -1);
	}
}