// Buttons
if (buttons_word != "" && buttons_length > 0)
{
	for (var v = 0; v < sqrt(buttons_length); v++)
	{
		for (var h = 0; h < sqrt(buttons_length); h++)
		{
			draw_set_color(#322544);
			draw_set_alpha(1);
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_set_font(fnt_main);
			draw_text((buttons[h, v].object.x + 10), (buttons[h, v].object.y + 7 + (4 * buttons[h, v].active)), buttons[h, v].letter);
		}
	}
}
// Buttons's display
var _sprite = spr_overworld_captcha_screen2;
var _sprite_x = 40;
var _sprite_y = 420;
draw_sprite_ext(_sprite, 0, _sprite_x, _sprite_y, 1, 1, 0, c_white, 1);
draw_set_font(fnt_main_spaced)
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var _text_x = (_sprite_x + round(sprite_get_width(_sprite) / 2) - round(string_width(buttons_word) / 2));
var _text_y = (_sprite_y + round(sprite_get_height(_sprite) / 2) - 0.5);
var _text_colors = [[c_white, c_gray], [global.c_dump, #1E994E], [merge_color(c_red, c_white, 0.4), merge_color(c_red, c_black, 0.1)]];
draw_text_color((_text_x + string_width(buttons_wordCurr)), _text_y, string_delete(buttons_word, 1, string_length(buttons_wordCurr)),_text_colors[0, 0], _text_colors[0, 0], _text_colors[0, 1], _text_colors[0, 1], 1);
_text_colors = _text_colors[(2 - string_starts_with(buttons_word, buttons_wordCurr))];
draw_text_color(_text_x, _text_y, buttons_wordCurr, _text_colors[0], _text_colors[0], _text_colors[1], _text_colors[1], 1);
// Plates
for (var v = 0; v < sqrt(plates_length); v++)
{
	for (var h = 0; h < sqrt(plates_length); h++)
	{
		var _rectangle_color = plates[h, v].colors[(plates[h, v].active + plates_activeAll)];
		draw_rectangle_color(plates[h, v].object.x, plates[h, v].object.y, (plates[h, v].object.x + 18), (plates[h, v].object.y + 18), _rectangle_color, _rectangle_color, _rectangle_color, _rectangle_color, false);
	}
}

