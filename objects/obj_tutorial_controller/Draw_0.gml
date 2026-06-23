
var _cx = obj_GAME_CONTROLLER.cam_x;
var _cy = obj_GAME_CONTROLLER.cam_y;

// fundo do texto
draw_set_font(fnt_main_spaced);
var _bg_di = 10;
var _bg_x = (_cx + 160 - ((string_width(text_visible[0]) * text_scale) / 2) - _bg_di);
var _bg_y = (_cy + 240 - 30 - _bg_di);
var _bg_w = (_bg_di + (string_width(text_visible[0]) * text_scale) + _bg_di);
var _bg_h = (30 + _bg_di + 5);
draw_set_alpha(alpha);
draw_sprite_stretched(spr_writer_textbox, 0, _bg_x, _bg_y, _bg_w, _bg_h);

// desenhar texto
for (var z = 0; z < 2; z++)
{
	var _xadd = 0;
	var _color = c_white;
	
	for (var i = 1; i < (string_length(text[z]) + 1); i++)
	{		
		// definir cor diferente
		var _draw = 1;
		if (string_char_at(text[z], i) == ";")
		{
			if (string_char_at(text[z], (i + 1)) == "S")
				_color = c_orange;
			if (string_char_at(text[z], (i + 1)) == "D")
				_color = c_white;
			_draw = 0;
		}
		if (string_char_at(text[z], (i - 1)) == ";")
			_draw = 0;
		
		// desenhar cada letra
		draw_set_font(fnt_main_spaced);
		draw_set_alpha(alpha);
		draw_set_color(_color);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		var _x = (_cx + 160 - ((string_width(text_visible[z]) * text_scale) / 2)) + _xadd;
		var _y = (_cy + 240 - 30 + ((20 * text_scale) * z));
		if (_draw == 1)
		{
			draw_text_transformed(_x, _y, string_char_at(text[z], i), text_scale, text_scale, 0);
			_xadd += text_xadd;
		}
	}
}
draw_set_alpha(1);