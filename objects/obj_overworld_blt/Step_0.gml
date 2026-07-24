
if (active == 1)
{
	if (type >= 1 && type < 2)
	{
		if (image_alpha < 1)
			image_alpha += 0.1;
		
		if (delay <= 0)
			speed = spd;
		else
		{
			//if (type == 1.0 && exists(heart) == true)
			//{
			//	image_angle = point_direction(x, y, heart.x, heart.y);
			//	direction = image_angle;
			//}
			if (type == 1.1)
				x = ((chara.x - 160) + 320 - 40);
			delay -= 1;
		}
		
		if (speed != 0 && (x <= -20 || (y <= -20 && type != 1.2) || y >= (room_height + 20)))
			destroy(id);
	}
}