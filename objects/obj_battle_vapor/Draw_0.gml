if (mode == 0) || (mode == 1) || (mode == 2)
{
	if (stage == 0)
	{
		draw_self();
		surface =
		{
			id : undefined,
			width : (sprite_get_width(sprite_index) * image_xscale),
			height : (sprite_get_height(sprite_index) * image_yscale),
		}
		surface.id = surface_create(surface.width, surface.height);
		surface_set_target(surface.id);
		draw_clear_alpha(c_black, 0);
		draw_sprite(sprite_index, image_index, 0, 0);
		surface_reset_target();
		buffer = buffer_create(((4 * surface.width) * surface.height), buffer_fixed, 1);
		buffer_get_surface(buffer, surface.id, 0);
		surface_free(surface.id);
		for (var h = 0; h < surface.height; h++)
		{
			for (var w = 0; w < surface.width; w++)
			{
				bufferPixel[h, w] =
				{
					data : buffer_peek(buffer, (4 * (w + (h * surface.width))), buffer_u32),
					object : undefined,
					sprite : spr_singlepixel,
					x : undefined,
					y : undefined,
					color : undefined,
					alpha : 1,
					delay : 0,
					speedX : (0.5 * choose(-1, 1)),
					speedY : 0,
					speedYadd : -(0.1 * random_range(1, 2)),
				}
				if (round((bufferPixel[h, w].data >> 24) & 255) == 255)
				{
					bufferPixel[h, w].x = (x + (w * image_xscale));
					bufferPixel[h, w].y = (y + (h * image_yscale));
					bufferPixel[h, w].color = make_color_rgb((bufferPixel[h, w].data & 255), ((bufferPixel[h, w].data >> 8) & 255), ((bufferPixel[h, w].data >> 16) & 255));
					bufferPixel[h, w].delay = floor(h / 2);
					if (mode == 0) || (mode == 1)
					{
						bufferPixel[h, w].object = create(bufferPixel[h, w].x, bufferPixel[h, w].y, ((mode == 0) ? obj_marker : obj_battle_vaporPixel));
						bufferPixel[h, w].object.depth = control.enemy_obj[control.enemy_target].depth;
						bufferPixel[h, w].object.sprite_index = bufferPixel[h, w].sprite;
						bufferPixel[h, w].object.image_blend = bufferPixel[h, w].color;
						bufferPixel[h, w].object.image_xscale = 2;
						bufferPixel[h, w].object.image_yscale = 2;
						if (mode == 1)
						{
							bufferPixel[h, w].object.delay = bufferPixel[h, w].delay;
							bufferPixel[h, w].object.speedX = bufferPixel[h, w].speedX;
							bufferPixel[h, w].object.speedY = bufferPixel[h, w].speedY;
							bufferPixel[h, w].object.speedYadd = bufferPixel[h, w].speedYadd;
						}
					}
				}
			}
		}
		alarm[0] = 100;
		stage += 1;
		buffer_delete(buffer);
		if (mode == 1)
			destroy(id);
	}
}
if (mode == 0) || (mode == 2)
{
	if (stage == 1)
	{
		for (var h = 0; h < surface.height; h++)
		{
			for (var w = 0; w < surface.width; w++)
			{
				if (round((bufferPixel[h, w].data >> 24) & 255) == 255)
				{
					if (mode == 2)
						draw_sprite_ext(bufferPixel[h, w].sprite, 0, bufferPixel[h, w].x, bufferPixel[h, w].y, 2, 2, 0, bufferPixel[h, w].color, bufferPixel[h, w].alpha);
					bufferPixel[h, w].alpha -= 0.01;
					if (bufferPixel[h, w].delay > 0)
						bufferPixel[h, w].delay -= 1;
					else
					{
						bufferPixel[h, w].speedY += bufferPixel[h, w].speedYadd;
						if (mode == 0 && bufferPixel[h, w].object != undefined && instance_exists(bufferPixel[h, w].object) == true)
						{
							bufferPixel[h, w].object.x += bufferPixel[h, w].speedX;
							bufferPixel[h, w].object.y += bufferPixel[h, w].speedY;
							bufferPixel[h, w].object.image_alpha = bufferPixel[h, w].alpha;
						}
						else if (mode == 2)
						{
							bufferPixel[h, w].x += bufferPixel[h, w].speedX;
							bufferPixel[h, w].y += bufferPixel[h, w].speedY;
						}
					}
				}
			}
		}
	}
}
if (mode == 3)
{
	if (stage == 0)
	{
		for (var h = 0; h < sprite_get_height(sprite_index); h++)
		{
			spriteRow[h] =
			{
				x : x,
				y : (y + (h * image_yscale)),
				alpha : 1,
				delay : floor(h / 2),
				speedX : (0.5 * choose(-1, 1)),
				speedY : 0,
				speedYadd : -(0.1 * random_range(1, 2)),
			}
		}
		stage += 1;
	}
	if (stage == 1)
	{
		for (var h = 0; h < sprite_get_height(sprite_index); h++)
		{
			draw_sprite_part_ext(sprite_index, image_index, 0, h, sprite_get_width(sprite_index), 1, spriteRow[h].x, spriteRow[h].y, image_xscale, image_yscale, c_white, spriteRow[h].alpha);
			spriteRow[h].alpha -= 0.01;
			if (spriteRow[h].delay > 0)
				spriteRow[h].delay -= 1;
			else
			{
				spriteRow[h].speedY += spriteRow[h].speedYadd;
				spriteRow[h].x += spriteRow[h].speedX;
				spriteRow[h].y += spriteRow[h].speedY;
			}
		}
	}
}
draw_set_alpha(1);