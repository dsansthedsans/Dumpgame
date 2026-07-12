
var _cx = round(obj_GAME_CONTROLLER.cam_x);
var _cy = round(obj_GAME_CONTROLLER.cam_y);

draw_set_alpha(0.75 * alpha);
draw_set_color(c_black);
draw_rectangle(_cx, _cy, (_cx + 320), (_cy + 240), 0);

draw_sprite_stretched_ext(spr_writer_textbox, 0, (_cx + bg_x[0]), (_cy + bg_y[0]), bg_w[0], bg_h[0], c_white, alpha);

if (warning == 0)
{
	// fundo do título
	draw_sprite_stretched_ext(spr_writer_textbox, 1, (_cx + bg_x[1]), (_cy + bg_y[1]), bg_w[1], bg_h[1], c_white, alpha);
	
	// título
	draw_set_alpha(alpha);
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_main_spaced);
	draw_text((_cx + title_x), (_cy + title_y), title);

	// opções
	for (var i = 0; i < option_length; i++)
	{
		var _color = c_white;
		if (option_pos == i)
			_color = c_yellow;
		draw_set_color(_color);
		draw_text((_cx + option_x[i]), (_cy + option_y[i]), option[i]);
	}

	// indicador das opções
	draw_sprite_ext(spr_heart_small, 0, (_cx + option_x[option_pos] - (string_width(option[option_pos]) / 2) - 10), (_cy + option_y[option_pos]), 1, 1, 0, c_white, alpha);
}
else
{
	// título
	draw_set_alpha(alpha);
	draw_set_color(merge_color(c_red, c_white, 0.2));
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_main_spaced);
	draw_text((_cx + warning_title_x), (_cy + warning_title_y), warning_title);
	
	// opções
	for (var i = 0; i < 2; i++)
	{
		var _color = c_white;
		if (warning_option_pos == i)
			_color = c_yellow;
		draw_set_color(_color);
		draw_text((_cx + warning_option_x[i]), (_cy + warning_option_y[i]), warning_option[i]);
	}

	// indicador das opções
	draw_sprite_ext(spr_heart_small, 0, (_cx + warning_option_x[warning_option_pos] - (string_width(warning_option[warning_option_pos]) / 2) - 10), (_cy + warning_option_y[warning_option_pos]), 1, 1, 0, c_white, alpha);
}