if (gate_draw == true)
{	
	for (var g = 0; g < 2; g++)
		draw_sprite_stretched_ext(spr_overworld_sidegate, 0, gate_x[g], (280 - gate_height), sprite_get_width(spr_overworld_sidegate), gate_height, c_white, 1);
}