if (con >= 3)
{	
	for (var g = 0; g < 2; g++)
		draw_sprite_stretched_ext(spr_overworld_sidegate, 0, gate_x[g], (280 - gate_height), sprite_get_width(spr_overworld_sidegate), gate_height, c_white, 1);
	if (is_undefined(brock) == false && exists(brock) == true)
	{
		brock_shock_image += 0.25;
		draw_sprite_ext(spr_npc_brock_shock, brock_shock_image, brock.x, (brock.y - (brock.sprite_height / 2)), brock.image_xscale, brock.image_yscale, brock.image_angle, c_white, brock.image_alpha);	
	}
}