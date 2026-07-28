if (global.visualeff == true)
{
	x += 0.25;
	if (x >= (xstart + sprite_width))
		x = xstart;
	y += 0.25;
	if (y >= (ystart + sprite_height))
		y = ystart;
}
for (var i = 0; i < 2; i++)
{
	for (var h = 0; h < (1 + (room_height / sprite_height) + 1); h++)
	{
		for (var w = 0; w < (1 + (room_width / sprite_width) + 1); w++)
		{
			var _x = x;
			var _y = y;
			if (i > 0)
			{
				_x = (xstart - (x + sprite_width));
				_y = (ystart - (y + sprite_height));
			}
			draw_sprite_ext(spr_overworld_fog, 0, (_x + (sprite_width * w)), (_y + (sprite_height * h)), image_xscale, image_yscale, 0, image_blend, (image_alpha / 1.5));
		}
	}
}