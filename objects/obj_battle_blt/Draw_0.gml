
if (active == 1)
{
	if (outside_box == 0)
		draw_self_border();
	else
		draw_self();
	
	if (type == 62) // Broken Clock
	{
		// shock
		shock_x = x;
		shock_y = (y - (sprite_height / 2) + 8);
		shock_index += (sprite_get_speed(spr_enemy_bc_shock) / 60);
		draw_sprite_ext(spr_enemy_bc_shock, shock_index, shock_x, shock_y, image_xscale, image_yscale, image_angle, image_blend, shock_alpha);
	}
}