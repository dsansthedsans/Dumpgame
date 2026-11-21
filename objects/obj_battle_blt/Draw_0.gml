
if (active == 1)
{
	if (type == 2.2)
		draw_sprite_stretched_ext(spr_battle_blt_dropLiquid, liquidindex, x, y - 6 + image_yscale, image_xscale, sprite_get_height(spr_battle_blt_dropLiquid), c_white, image_alpha);
	
	if (outside_box == 0)
    {
        var _xx = x;
        var _yy = y;
        var _xsc = image_xscale;
        var _ysc = image_yscale;
        if (type == 2.1)
        {
            _xsc = xscl;
            _ysc = yscl;
            if (abs(image_xscale - xscl) > 0.1)
                xscl = lerp(xscl, image_xscale, 0.1);
            else
                xscl = image_xscale;
            if (abs(image_yscale - yscl) > 0.1)
                yscl = lerp(yscl, image_yscale, 0.1);
            else
                yscl = image_yscale;
            _xx += ((sprite_width / 2) * (1 - xscl));
            _yy += ((sprite_height / 1) * (1 - yscl));
        }
        draw_self_border(_xsc, _ysc, _xx, _yy);
    }
	else
		draw_self();
    
	if (type == 62) // Broken Clock
	{
		// shock
		shock_x = x;
		shock_y = (y - (sprite_height / 2) + 8);
		shock_index += (sprite_get_speed(spr_enemy_brock_shock) / 60);
		draw_sprite_ext(spr_enemy_brock_shock, shock_index, shock_x, shock_y, image_xscale, image_yscale, image_angle, image_blend, shock_alpha);
	}
}
