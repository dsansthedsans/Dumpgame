
if (type == 1)
{
	draw_set_color(c_black);
	for (var z = 0; z < 2; z++)
	{
		for (var i = 0; i < 100; i++)
		{
			var _x = (210 + i);
			var _y = 300;
			var _h = 100;
			if (z == 1)
			{
				_y = 600;
				_h = 60;
			}
			draw_set_alpha(clamp((0.01 * i), 0, 0.6));
			draw_rectangle(_x, _y, _x, (_y + _h - 1), 0);
		}
	}
	draw_set_alpha(0.6);
	draw_rectangle(210, 400, room_width, 599, 0);
}
if (type == 2)
{
	// draw top and bottom darkness
	draw_set_color(c_black);
	for (var z = 0; z < 2; z++)
	{
		for (var i = 0; i < 130; i++)
		{
			var _y1 = 0;
			var _y2 = 0;	
			if (z == 0)
			{
				_y1 = 10;
				_y2 = 119;
				if (i < 10)
					_y2 = 50;
				if (i >= 111)
					_y1 = 0;
			}
			else
			{
				_y1 = 160;	
				_y2 = 212;
				if (i >= 111)
					_y2 = 240;
			}

			var _x = (30 + i);
			draw_set_alpha(0.5 + (0.0025 * i));
			draw_rectangle(_x, _y1, _x, _y2, 0);
		}
	}

	// draw middle darkness
	for (var i = 0; i < 100; i++)
	{
		_x = (160 - i);
		draw_set_alpha(0.85 - (0.01 * i));
		draw_rectangle(_x, 120, _x, 159, 0);
	}

	// draw shadows
	draw_set_alpha(0.5);
	if (chara.y > 120 && chara.y < 165)
		draw_rectangle((chara.x - 1), chara.y, (chara.x + 40), (chara.y - 4), 0);
	if (global.flag[2] == 1 && exists(obj_party) == 1 && m6.y > 120 && m6.y < 165)
		draw_rectangle((m6.x - 2), m6.y, (m6.x + 25), (m6.y - 4), 0);
}
if (type == 3)
{
	draw_set_color(c_black);
	for (var i = 0; i < 100; i++)
	{
		draw_set_alpha(0.125 + (0.125 / 2) + (0.0075 * i));
		/*Top*/ draw_rectangle(60, (topY - i), 160, (topY - i), false);
		/*Top*/ draw_rectangle(180, (topY - i), 260, (topY - i), false);
		draw_set_alpha(0.1 + (0.01 * i));
		/*Right*/ draw_rectangle((rightX + i), 60, (rightX + i), 160, false);
		draw_set_alpha(0.125 + (0.125 / 2) + (0.01 * i));
		/*Left*/ draw_rectangle((leftX - i), 40, (leftX - i), 180, false);
		/*Bottom*/ draw_rectangle(60, (bottomY + i), 240, (bottomY + i), false);
	}
}
if (type == 4)
{
	draw_set_color(c_black);
	for (var i = 0; i < room_width; i++)
	{
		draw_set_alpha(clamp((0.075 + (0.005 * i)), 0, 0.5));
		draw_rectangle((rightX + i), rightY, (rightX + i), (rightY + rightHeight), false);
	}
	draw_set_alpha(0.5);
	draw_rectangle(rightX, 0, room_width, (rightY - 1), false);
	draw_rectangle(rightX, (rightY + rightHeight + 1), room_width, room_height, false);
}
if (type == 5)
{
	draw_set_alpha(0.4);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, 0);
}
draw_set_alpha(1);
