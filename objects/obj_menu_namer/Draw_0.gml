
/*
// pegar informações
var _dist = 44;
var _base_x = 77 - 21;
var _base_y = (room_height - (_dist * 4) + 15);

var _length_line = array_length(option);
for (var z = 0; z < _length_line; z++)
{
	var _length_opt = array_length(option[z]);
	for (var i = 0; i < _length_opt; i++)
	{
		draw_set_font(fnt_main_spaced_big);
		
		// pegar posição
		var _x = (_base_x + (_dist * i));
		var _y = (_base_y + (_dist * z));
		if (z == 3) // uppercase, backspace e confirm
		{
			var _half_letter = (string_width("A") / 2);
			
			if (i == 0) || (i == 1) // uppercase
			{
				_x = (_base_x + (string_width(option[z, 0]) / 2) - _half_letter);
				var _x0 = _x;
			}
			if (i == 2) || (i == 1) // backspace
			{
				_x = (_base_x + (_dist * (array_length(option[0]) - 1)) - (string_width(option[z, 2]) / 2) + _half_letter);
				var _x2 = _x;
			}
			if (i == 1) // confirm (pega as posições dos outros para ficar no meio)
				_x = (_x0 + ((_x2 - _x0) / 2));
		}
		
		// pegar cor e definir posição do coração
		var _color = c_white;
		if (z == 3 && i == 0 && upper == 1) // uppercase
			_color = c_orange;
		if (z == option_pos[0] && i == option_pos[1]) // seleção
		{
			_color = c_yellow;
			option_heartx = _x;
			option_hearty = _y;
		}
	}
}
*/

// desenhar fundo
var _bg_x = (base_x - base_dist);
var _bg_y = (base_y - base_dist);
var _bg_w = (base_dist * (array_length(option[0]) + 1));
var _bg_h = ((base_dist * (array_length(option) + 1)) + 10);
draw_set_color(c_white);
draw_set_alpha(controller.alpha);
draw_sprite_stretched(spr_menu_optbg, 0, _bg_x, _bg_y, _bg_w, _bg_h);

// desenhar indicad
draw_sprite_ext(spr_heart_small, 0, (option_x[option_pos[0], option_pos[1]] - 2), (option_y[option_pos[0], option_pos[1]] - 1), 3, 3, 0, c_white, (controller.alpha * 0.5));

// desenhar opções
draw_set_font(fnt_main_spaced_big);
var _length_line = array_length(option);
for (var z = 0; z < _length_line; z++)
{
	var _length_opt = array_length(option[z]);
	for (var i = 0; i < _length_opt; i++)
	{
		var _color = c_white;
		if (z == 3 && i == 0 && upper == 1) // uppercase
			_color = c_orange;
		if (z == option_pos[0] && i == option_pos[1]) // seleção
			_color = c_yellow;
		
		draw_set_color(_color);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text(option_x[z, i], option_y[z, i], option[z, i]);
	}
}

// digitando
if (typing == 1)
{
	draw_set_color(c_black);
	draw_set_alpha(controller.alpha / 1.25);
	draw_rectangle(_bg_x, _bg_y, (_bg_x + _bg_w), (_bg_y + _bg_h), 0);	

	draw_set_alpha(controller.alpha);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_outline((_bg_x + (_bg_w / 2)), (_bg_y + (_bg_h / 2) - 20), "TYPING MODE ENABLED\nPRESS [F10] TO QUIT", c_red, 2, c_black);
}












