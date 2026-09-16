
if (active == 1)
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
	if (xscale < 1) || (yscale < 1)
	{
		xscale = lerp(xscale, 1, ((global.visualeff == true) ? 0.3 : 1));
		yscale = lerp(yscale, 1, ((global.visualeff == true) ? 0.3 : 1));
	}
}