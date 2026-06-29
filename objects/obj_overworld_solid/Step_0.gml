
// dummy door
if (room == room_corridors_3_5 && x == 140 && y == 5 && global.flag[40] == 1)
	sprite_index = spr_overworld_bigdoor_open;

// candy bowl pillar
if (room == room_corridors_6 && x == 150 && y == 85)
{
	sprite_index = spr_overworld_pillar;
	image_index = (11 - global.flag[19]);
	if (global.flag[20] == 1)
		image_index = 2;
}

// chocolate bowl
if (room == room_corridors_10 && x == 130 && y == 110)
	image_index = global.flag[36];



// leaf fall
if (leaf_fall == 1)
{
	if (leaf_delay <= 0)
	{
		leaf_create = 1;
		event_user(0);
	}
	else
		leaf_delay -= 1;
}