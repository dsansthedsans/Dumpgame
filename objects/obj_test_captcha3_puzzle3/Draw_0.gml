
if (keyboard_check_pressed(vk_numpad7) == 1)
{
	bc[0, 0] = !bc[0, 0];
	bc[1, 0] = !bc[1, 0];
	bc[0, 1] = !bc[0, 1];
	global.indebug = 0;
}
if (keyboard_check_pressed(vk_numpad8) == 1)
{
	bc[0, 0] = !bc[0, 0];
	bc[1, 0] = !bc[1, 0];
	bc[2, 0] = !bc[2, 0]
}
if (keyboard_check_pressed(vk_numpad9) == 1)
{
	bc[1, 0] = !bc[1, 0];
	bc[2, 0] = !bc[2, 0]
	bc[2, 1] = !bc[2, 1]
}

if (keyboard_check_pressed(vk_numpad4) == 1)
{
	bc[0, 0] = !bc[0, 0];
	bc[0, 1] = !bc[0, 1];
	bc[0, 2] = !bc[0, 2];
}
if (keyboard_check_pressed(vk_numpad5) == 1)
{
	bc[1, 0] = !bc[1, 0];
	bc[0, 1] = !bc[0, 1];
	bc[1, 1] = !bc[1, 1];
	bc[2, 1] = !bc[2, 1];
	bc[1, 2] = !bc[1, 2];
}
if (keyboard_check_pressed(vk_numpad6) == 1)
{
	bc[2, 0] = !bc[2, 0];
	bc[2, 1] = !bc[2, 1];
	bc[2, 2] = !bc[2, 2];
}

if (keyboard_check_pressed(vk_numpad1) == 1)
{
	bc[0, 2] = !bc[0, 2];
	bc[1, 2] = !bc[1, 2];
	bc[0, 1] = !bc[0, 1];
}
if (keyboard_check_pressed(vk_numpad2) == 1)
{
	bc[0, 2] = !bc[0, 2];
	bc[1, 2] = !bc[1, 2];
	bc[2, 2] = !bc[2, 2]
}
if (keyboard_check_pressed(vk_numpad3) == 1)
{
	bc[1, 2] = !bc[1, 2];
	bc[2, 2] = !bc[2, 2]
	bc[2, 1] = !bc[2, 1]
}

for (var h = 0; h < 3; h++)
{
	for (var v = 0; v < 3; v++)
	{
		var _color = c_white;
		if (bc[h, v] == 1)
			_color = c_lime;
		var _x = (bx + ((bw * 2) * h));
		var _y = (by + ((bh * 2) * v));
		draw_set_color(_color);
		draw_rectangle(_x, _y, _x + bw, _y + bh, 0);
	}
}