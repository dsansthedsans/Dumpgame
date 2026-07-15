if (exists(controller) == true && controller.battle_bg != -1)
{
	sprite_index = controller.battle_bg;
	image_alpha = controller.gui_alpha;
	if (wave == false) || (wave == true && global.visualeff == false)
		draw_self();
	else if (wave == true && global.visualeff == true)
	{
		waveSiner += 0.1;
		if (waveFreeze == true)
			waveHeight = lerp(waveHeight, 0, 0.05);
		for (var w = 0; w < sprite_get_width(sprite_index); w++)
			draw_sprite_part_ext(sprite_index, 0, w, 0, 1, sprite_get_height(sprite_index), (image_xscale * w), (sin((w / waveWidth) - (waveSiner / waveSpeed)) * waveHeight), image_xscale, image_yscale, image_blend, image_alpha);
	}
}
else
	destroy(id);