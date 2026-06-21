
image_speed = 0;
image_alpha = 1;

chara = obj_chara;
indexmult = 0;

eating = 0;
eat_stage = 0;
eat_delay = 0;

flying = 0;
fly_stage = 0;
fly_delay = 0;

dancing = 0;
dance_dir = 1;
dance_delay = 0;
dance_stage = 0;
dance_walking = 0;
dance_walkturn = 0;
dance_initdelay = irandom_range(0, 240);

dance_stage = 0;
dance_delay = 0;
dance_origx = 0;
dance_origy = 0;
dance_origdir = 0;

scarefly = 0;
scarefly_x = 0;
scarefly_y = 0;
scarefly_dir = 0;
scarefly_dist = 40;
scarefly_stage = 0;

custom_stage = 0;

// pegar tipo
mytype = 0;
if (room == room_corridors_1)
{
	if (x == 160 && y == 511)
		mytype = 1;
	if (x == 200 && y == 460)
		mytype = 2;
	if (x == 130 && y == 570)
		mytype = 3;
	if (x == 120 && y == 130)
		mytype = 4;
}

// definir mudanças
if (mytype == 1) // dump
{
	x = (chara.x - 8);
	y = (chara.y - 15);
	if (global.flag[0] < 1)
		eating = 1;
	scarefly_x = 33;
	scarefly_y = 453;
	scarefly_dir = -1;
	if (global.flag[0] == 1)
	{
		x = 33;
		y = 453;
		image_xscale = -1;
	}
}
if (mytype >= 2 && mytype <= 5) // red, blue, yellow
{
	dancing = 1;
	dance_origx = x;
	dance_origy = y;
	scarefly_dir = 1;
	
	if (mytype == 2)
	{
		indexmult = 1;
		scarefly_x = 266;
		scarefly_y = 390;
	}
	else if (mytype == 3)
	{
		indexmult = 2;
		scarefly_x = 35;
		scarefly_y = 520;
		scarefly_dir = -1;
	}
	else if (mytype == 4)
	{
		indexmult = 3;
		scarefly_x = 55;
		scarefly_y = 80;
		scarefly_dir = -1;
	}
}

origx = x;
origy = y;
baseindex = (2 * indexmult);
image_index = baseindex;
depth = -bbox_bottom;

if (global.chara_murder >= 2)
	destroy(id);