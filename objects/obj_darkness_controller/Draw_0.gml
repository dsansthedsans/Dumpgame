
if (type == 1)
{
	draw_set_color(c_black);
	for (var z = 0; z < 2; z++)
	{
		for (var i = 0; i < 100; i++)
		{
			var _x = (200 + i);
			
			var _y = 300;
			var _h = 100;
			if (z == 1)
			{
				_y = 600;
				_h = 60;
			}
			
			var _alpha = (0 + (0.01 * i));
			_alpha = clamp(_alpha, 0, 0.59);
			
			draw_set_alpha(_alpha);
			draw_rectangle(_x, _y, _x, (_y + _h - 1), 0);
		}
	}
	
	draw_set_alpha(0.59);
	draw_rectangle(200, 400, room_width, 599, 0);
}

draw_set_alpha(1);




/*
if (type == 1)
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
	if (global.flag[2] == 1 && exists(obj_sidechara) == 1 && m6.y > 120 && m6.y < 165)
		draw_rectangle((m6.x - 2), m6.y, (m6.x + 25), (m6.y - 4), 0);
}
if (type == 2)
{
	draw_set_color(c_black);
	for (var i = 0; i < 100; i++)
	{
		draw_set_alpha(0.25 + (0.01 * i));
		
		// bottom middle
		var _y = (206 + i);
		draw_rectangle(100, _y, 200, _y, 0);
		
		// top
		_y = (72 - i);
		draw_rectangle(100, _y, 139, _y, 0);
		draw_rectangle(180, _y, 239, _y, 0);
		
		// bottom right
		_y = (184 + i);
		draw_rectangle(220, _y, 240, _y, 0);
		
		// left
		var _x = (80 - i);
		draw_rectangle(_x, -20, _x, 260, 0);
		
		// right
		var _x = (270 + i);
		draw_rectangle(_x, -20, _x, 260, 0);
	}
}
if (type == 3)
{
	draw_set_color(c_black);
	for (var i = 0; i < 60; i++)
	{
		var _alpha = (0.35 + (0.01 * i));
		_alpha = clamp(_alpha, 0.35, 0.85);
		draw_set_alpha(_alpha);
		draw_rectangle(i, 300, i, 399, 0);
	}
	
	draw_set_alpha(0.85);
	draw_set_color(c_black);
	draw_rectangle(0, 400, 260, 459, 0);
	draw_rectangle(60, 0, room_width, 399, 0);
}
if (type == 4)
{
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	
	draw_rectangle(0, 0, room_width, room_height, 0);
}
*/