chara = obj_chara;
stage = 0;
// Levers
for (var l = 0; l < 2; l++)
{
	levers[l] =
	{
		object : marker((100 * (l + 1)), 1280, spr_overworld_lever, 1, 1, 1, 0, 0, 0, c_white, -(1280 + 20)),
		active : false,
	}
}
// Doors
doors_length = 4;
for (var d = 0; d < doors_length; d++)
{
	doors[d] =
	{
		object : marker(0, 0, spr_overworld_bigdoor_closed, 1, 1, 1, 0, 0, 0, c_white, 0),
		active : false,
	}
	doors[d].object.index = d;
	with (doors[d].object)
	{
		switch (index)
		{
			case 0:
			x = 0;
			y = 0;
			break;
		}
		depth = -bbox_bottom;
	}
}
// Timer
timer =
{
	active : false,
	seconds : 60,
	milliseconds : 0,
	color_green : 0,
	alpha : 0,
	scale : 1,
}


skip = true;
if (skip == true)
	stage = 1;
