if (active == true)
{
	// Rhonhey
	if (type == 7)
	{
		// Head
		for (var i = 1; i >= 0; i--)
		{
			var _head_x = (posX - 5 + (fn_dcos(siner, 0) * 5) + ((sprite_get_width(head_sprite) * scale) / 2));
			var _head_sinY = (fn_dsin(siner, 0) * 35);
			if (global.flag[69] >= 0.125 && global.flag[69] <= 0.625)
				_head_sinY /= 2;
			var _head_y = (posY - ((sprite_get_height(head_sprite) * scale) / 2) - 10 + _head_sinY + offsetY);
			draw_sprite_ext(head_sprite, ((i * (sprite_get_number(head_sprite) / 2)) + floor(head_image)), _head_x, _head_y, 2, 2, head_angle, c_white, image_alpha);
		}
	}
}