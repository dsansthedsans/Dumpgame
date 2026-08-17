if (is_undefined(brock) == false && exists(brock) == true)
{
	if (brockShock_draw == true)
	{
		brockShock_image += 0.25;
		draw_sprite_ext(spr_npc_brock_shock, brockShock_image, brock.x, (brock.y - (brock.sprite_height / 2)), brock.image_xscale, brock.image_yscale, brock.image_angle, c_white, brock.image_alpha);	
	}
	if (brockHands_draw == true)
	{
		for (var h = 0; h < brockHands_length; h++)
		{
			brockHands_angle[h] += brockHands_angleSpeed[h];
			draw_sprite_ext(spr_singlepixel, 0, brock.x + 0.5, brock.y + 0.5, brock.image_xscale, (brockHands_scaleY[h] * brock.image_yscale), brockHands_angle[h], #7B40B2, brock.image_alpha);
		}
	}
}