
// option bg
draw_sprite_stretched_ext(spr_menu_optbg, 0, mainopt_bgx, mainopt_bgy, mainopt_bgw, mainopt_bgh, c_white, 1);

// options
for (var i = 0; i < 3; i++)
{
	var _color = c_white;
	if (i == mainopt_pos)
		_color = c_yellow;
	
	var _halign = fa_right;
	if (i == 1)
		_halign = fa_center;
	else if (i == 2)
		_halign = fa_left;
	
	draw_set_font(fnt_main_big);
	draw_set_alpha(1);
	draw_set_valign(fa_middle);
	draw_set_halign(_halign);
	draw_text_outline(mainopt_x[i], mainopt_y, string_upper(mainopt[i]), _color, 2, c_black);	
}

// option indicator
draw_sprite_ext(spr_heart_small, 0, mainopt_heartx[mainopt_pos], mainopt_y, 2, 2, 0, c_white, 1);

// bg
if (con >= 9 && bg_alpha > 0)
{
	bg_alpha = lerp(bg_alpha, 0, bg_spd);
	if (bg_alpha <= 0.025)
		bg_alpha = 0;
}
draw_set_alpha(bg_alpha);
draw_set_color(c_black);
draw_rectangle(-40, -40, (room_width + 40), (room_height + 40), 0);

// heart
draw_sprite_ext(heart_spr, 0, heart_x, heart_y, 1, 1, 0, heart_color, heart_alpha);

// title
for (var i = 0; i < title_length; i++)
	draw_sprite_ext(title_spr[i], 0, title_x[i], title_y, title_scale, title_scale, 0, c_white, 1);