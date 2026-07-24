/// @descr get type

image_xscale = 1;
image_yscale = 1;
image_alpha = 1;
image_speed = 0;
image_index = 0;
active = 1;
delay = 0;
dmg = 4;

if (type >= 1 && type < 2) // Gabee's chase
{
	direction = 0;
	image_alpha = 0;
	delay = 30;
	spd = 6;
	chara_x = chara.x;
	if (type == 1.1)
		direction = 180
	if (type == 1.2)
	{
		direction = 270;
		image_alpha = 1;
		delay = 0;
		spd = 1.5;
	}
	image_angle = direction;
}

/*
if (type >= 1 && type < 2) // Gabee's chase
{
	////////////
	var _xdist = 170;
	if (chara.curspeed == chara.wspeed)
		_xdist /= 2;
	var _dirbonus = 0;
	if (chara.movex > 0)
		_dirbonus = _xdist;
	else if (chara.movex < 0)
		_dirbonus = -_xdist;
	///////////
	
	delay = 30;
	if (type == 1.0)
		spd = 6;
	if (type == 1.1)
	{
		image_angle = 180;
		spd = -6;
	}
	image_alpha = 0;
}
*/