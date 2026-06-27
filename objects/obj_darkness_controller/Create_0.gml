
depth = -90;
image_alpha = 0;
chara = obj_chara;
m6 = obj_party;

type = 0;
if (room == room_corridors_1_5)
{
	type = 1;
	val = 255; // this is used yes ignore error
	m6_val = 255;
}
else if (room == room_corridors_16_B)
{
	type = 2;
	chara_curcolor = 255;
	chara_colorvalue = 120;
	m6_curcolor = 255;
	m6_colorvalue = 120;
}







/*
if (room == room_corridors_16_B)
	type = 1;
else if (room == room_caverns_1)
	type = 2;
else if (room == room_caverns_2)
	type = 3;
else if (room == room_caverns_3)
	type = 4;
	*/

/*
if (type == 1)
{
	depth = -90;
	chara_curcolor = 255;
	chara_colorvalue = 120;

	if (global.flag[2] == 1)
	{
		m6 = obj_sidechara;
		m6_curcolor = 255;
		m6_colorvalue = 120;
	}
}
if (type == 2)
	depth = -200;
if (type == 3) || (type == 4)
	depth = -2000;
*/