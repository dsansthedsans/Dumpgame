
event_inherited();

if (global.flag[66] == 0)
{
	thingalpha = 0.35;
	marker((x - 80), (y - 90), spr_prem6_thing, thingalpha, 1, 1, 0, 0, 0, c_white, -100);
	thing[0] = thismarker;
	
	marker(260, 580, spr_prem6_thing, thingalpha, 1, 1, 0, 0, 0, c_white, -100);
	thing[1] = thismarker;
	
	sound = 0;
}
else
	destroy(id);