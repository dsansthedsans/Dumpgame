
var _bonusx = 0;
var _bonusy = 0;
event_user(0);

// draw format-based stuff
if ((msg_format[page] == "textbox" || msg_format[page] == "textbox_bottom" || msg_format[page] == "textbox_top") && msg_type[page] != "dumpkill")
{
	_bonusx = camera_get_view_x(view_camera[0]);
	_bonusy = camera_get_view_y(view_camera[0]);
	
	// draw textbox
	if (msg_type[page] != "intro" && msg_type[page] != "notawake")
	{
		var _xx = 16;
		var _yy = 160;
		if (msg_format[page] == "textbox_top")
			_yy = 5;
		var _ww = 289;
		var _hh = 76;
		if (msg_type[page] == "savepoint") // save point
		{
			_xx = 53;
			_yy = 58;
			_ww = 213;
			_hh = 88;
		}
		draw_sprite_stretched_ext(spr_writer_textbox, 0, (_bonusx + _xx), (_bonusy + _yy), _ww, _hh, textbox_color, alpha);
	}
	
	// draw face
	if (msg_face[page] > -1)
	{
		face_index += 0.1;
		draw_sprite_ext(msg_face[page], face_index, (_bonusx + 27), (_bonusy + _yy + 14), 1, 1, 0, c_white, alpha);
	}
	
	// manage talker
	if (msg_talker[page] > -1)
	{
		if (writing == 1)
			msg_talker[page].image_speed = (0.2 * writing);
		else
		{
			msg_talker[page].image_speed = 0;
			msg_talker[page].image_index = 0;
		}
		talkerpage = page;
	}
	else if (talkerpage != -1)
	{
		msg_talker[talkerpage].image_speed = 0;
		msg_talker[talkerpage].image_index = 0;
	}
	
	// desenhar informações do jogador no ponto de save
	if (msg_type[page] == "savepointt")
	{
		draw_set_font(fnt_main);
		draw_set_alpha(1);
		var _color = c_white;
		if (filesaved == 1)
			_color = c_yellow;
		draw_set_color(_color);
		
		var _name = global.file_chara_name;
		var _lvl = global.file_chara_lvl;
		world = global.file_chara_world;
		var _world = chara_getworld_name();
		mode = 1;
		var _room = chara_getroom_name();
		if (_name == "")
		{
			_name = "[-----]";
			_lvl = "[-]"
			_world = "[---------]"
			_room = "[-------]";
		}
		
		var _hspace = 17;
		var _vspace = 12;
		var _uppery = (_bonusy + _yy + _vspace);
		var _bottomy = (_uppery + 20);
		var _savedy = (_bonusy + _yy + _hh - _vspace)
		
		var _leftx = (_bonusx + _xx + _hspace);
		var _middlex = (_bonusx + _xx + (_ww / 2));
		var _rightx = (_bonusx + _xx + _ww - _hspace);
		
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_text(_leftx, _uppery, _name);
		draw_set_halign(fa_right);
		draw_text(_rightx, _uppery, "LVL " + string(_lvl));
		
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_text_width(_leftx, _bottomy, string(_world) + " - " + string(_room), (_ww - (_hspace * 2)));
		
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);
		if (filesaved == 1)
			draw_text(_middlex, _savedy, get_text("savepoint_5"));
	}
}
if (msg_format[page] == "battlebox")
{
	// draw face
	if (msg_face[page] > -1)
	{
		face_index += 0.1;
		draw_sprite_ext(msg_face[page], face_index, ((controller.box_x - (controller.box_w / 2) - controller.box_borderw) + 16), (text_y + 2), 2, 2, 0, c_white, alpha);
	}	
}
if (msg_format[page] == "bubble")
	draw_sprite_ext(bubble_spr, 0, bubble_x, bubble_y, 1, 1, 0, c_white, alpha);

// draw text
shaking = 0;
floating = 0;
myfloat += 0.175;
dumpkill_linejump = 0;
for (var c = 1; c < (text_length + 1); c++)
{
	var _candraw = 1;
	var _jumpedline = 0;
	letter_xspace = orig_letter_xspace;
	
	// auto new line
	if (string_char_at(msg[page], (c - 1)) == " ")
	{
		// get word
		var _char = c;
		var _xspace = 0;
		
		var _wordended = 0;
		var _breakline = 1
		
		while (_wordended == 0)
		{
			// cancel auto line
			if (string_char_at(msg[page], _char) == "\\")
			{
				_wordended = 1;
				_breakline = 0;
				_xspace = 0;
				break;
			}

			// normal use
			if (string_char_at(msg[page], _char) != " " && string_char_at(msg[page], _char) != "&" && string_char_at(msg[page], _char) != "" && string_char_at(msg[page], _char) != "^" && string_char_at(msg[page], _char) != "+")
			{
				if !(((string_char_at(msg[page], _char) == ";") || (string_char_at(msg[page], _char) == ":")) && string_char_at(msg[page], (_char + 1)) != "\\")
					_xspace += letter_xspace;
				else
					_char += 1;
				_char += 1;
				continue;
			}
			else
			{
				_wordended = 1;	
				break;
			}
		}
		
		// next line
		if ((text_x + _xspace) >= text_xend && _breakline == 1)
		{
			if (string_char_at(msg[page], (c + 1)) != "*" && msg_format[page] != "bubble" && msg_type[page] != "endingreal")
				text_x = (orig_text_x + (letter_xspace * 2));
			else 
				text_x = orig_text_x;
			text_y += letter_yspace;
			_jumpedline = 1;
		}
	}
	
	// manual new line
	if (string_char_at(msg[page], c) == "&" && string_char_at(msg[page], (c + 1)) != "\\")
	{
		if (string_char_at(msg[page], (c + 1)) != "*" && msg_format[page] != "bubble" && string_char_at(msg[page], (c + 1)) != "!")
			text_x = (orig_text_x + (letter_xspace * 2));
		else
			text_x = orig_text_x;
		text_y += letter_yspace;
		_jumpedline = 1;
		_candraw = 0;
	}
	if (string_char_at(msg[page], c) == "!" && string_char_at(msg[page], (c - 1)) == "&")
		_candraw = 0;	
	
	// apply custom color
	for (var z = 0; z < 2; z++)
	{
		var _key = ":";
		if (z == 1)
			_key = ";";
		
		if (string_char_at(msg[page], c) == _key && string_char_at(msg[page], (c + 1)) != "\\")
		{
			var _cancheck = 1;
			
			// normal colors
			if (string_char_at(msg[page], c + 1) == "Y" && _cancheck == 1) 
			{
				text_color[0] = c_yellow;
				_cancheck = 0;
			}
			if (string_char_at(msg[page], c + 1) == "R" && _cancheck == 1)
			{
				text_color[0] = c_red;
				_cancheck = 0;
			}
			if (string_char_at(msg[page], c + 1) == "L" && _cancheck == 1) 
			{
				text_color[0] = c_lime;
				_cancheck = 0;
			}
			if (string_char_at(msg[page], c + 1) == "F" && _cancheck == 1) 
			{
				text_color[0] = #EE145B;
				_cancheck = 0;
			}
			if (string_char_at(msg[page], c + 1) == "G" && _cancheck == 1) 
			{
				text_color[0] = c_grey;
				_cancheck = 0;
			}
			if (string_char_at(msg[page], c + 1) == "D" && _cancheck == 1) 
			{
				text_color[0] = orig_text_color;
				_cancheck = 0;
			}
		
			// custom
			if (string_char_at(msg[page], c + 1) == "@" && _cancheck == 1) // mention
			{
				text_color[0] = #6B70B2;
				_cancheck = 0;
			}
			if (string_char_at(msg[page], c + 1) == "U" && _cancheck == 1) // dumpcolor
			{
				text_color[0] = global.c_dump;
				_cancheck = 0;
			}
			if (string_char_at(msg[page], c + 1) == "6" && _cancheck == 1) // m6
			{
				text_color[0] = #4986B7;
				_cancheck = 0;
			}

			if (_cancheck == 0)
			{
				if (_key == ";")
					text_color[1] = text_color[0];
				_candraw = 0;
			}
		}
	}
	if (string_char_at(msg[page], (c - 1)) == ":") || (string_char_at(msg[page], (c - 1)) == ";") // remove custom color characters
		_candraw = 0;
	
	// start effects
	if (string_char_at(msg[page], c) == "+")
	{
		var _type = real(string_char_at(msg[page], (c + 2)));
		var _cancheck = 1;

		if (string_char_at(msg[page], (c + 1)) == "D" && _cancheck == 1) // reset
		{
			shaking = 0;
			floating = 0;
			_cancheck = 0;
		}
		if (string_char_at(msg[page], (c + 1)) == "S" && _cancheck == 1) // shake
		{
			shaking = _type;
			_cancheck = 0;
		}
		if (string_char_at(msg[page], (c + 1)) == "F" && _cancheck == 1) // float
		{
			floating = _type;
			_cancheck = 0;
		}
		
		if (_cancheck == 0)
			_candraw = 0;
	}
	if (string_char_at(msg[page], (c - 1)) == "+") || (string_char_at(msg[page], (c - 2)) == "+")
		_candraw = 0;
	
	// remove characters
	if (string_char_at(msg[page], c) == "^")
	{
		if (string_char_at(msg[page], c + 1) == "1") || (string_char_at(msg[page], c + 1) == "2") || (string_char_at(msg[page], c + 1) == "3") || (string_char_at(msg[page], c + 1) == "4")
			_candraw = 0;
	}	
	if (string_char_at(msg[page], (c - 1)) == "^")
		_candraw = 0;
	if (string_char_at(msg[page], c) == "\\")
		_candraw = 0;
	
	// auto page skipper
	if (string_char_at(msg[page], c) == "(" && string_char_at(msg[page], (c + 1)) == ")")
	{
		text_color[0] = c_black;
		text_color[1] = c_black;
		event_user(1);
	}
	
	// custom hspace
	if (msg_font[page] == global.fnt_dsans)
	{
		var _cur = string_char_at(msg[page], c);
		var _next = string_char_at(msg[page], (c + 1));
		
		if (_cur == "p")
			letter_xspace += 2;
		if (_next == "i") || (_cur == "i")
			letter_xspace -= 2;
	}
	
	// execute effects
	var _floatx = 0;
	var _floaty = 0;
	if (shaking > 0 && shake_change == 1)
	{
		if (shaking == 1) || (shaking == 2)
		{
			var _amt = 0.6;
			if (shaking == 2)
				_amt = 1.4;
			shake_x[c] = choose(_amt, 0);
			shake_y[c] = choose(_amt, 0);
		}
		else if (shaking == 3)
		{
			shake_x[c] = 0;
			shake_y[c] = 0;
			var _shake = irandom_range(0, 250);
			if (_shake == 1)
			{
				shake_x[c] = choose(1.4, 0);
				shake_y[c] = choose(1.4, 0);
			}
		}
	}
	if (floating > 0)
	{ 
		var _floatx = (sin((c * 0.5) - myfloat) * (0.75 + (0.25 * floating)))//max(global.inmenu, global.inintro, global.inbattle, global.ingameover))));
		var _floaty = (cos((c * 0.5) - myfloat) * (0.75 + (0.25 * floating)))//max(global.inmenu, global.inintro, global.inbattle, global.ingameover))));
	}
	
	// draw letter
	if (_jumpedline == 1)
		dumpkill_linejump += 1;
	
	if (_candraw == 1)
	{
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_font(msg_font[page]);
		
		draw_set_alpha(alpha);
		//draw_text_outline(round(_bonusx + text_x), round(_bonusy + text_y), string_char_at(msg[page], c), text_color[0], 1, c_black);
		draw_text_color((round(_bonusx + text_x + shake_x[c]) + _floatx), (round(_bonusy + text_y + shake_y[c]) + _floaty), string_char_at(msg[page], c), text_color[1], text_color[1], text_color[0], text_color[0], alpha);
		text_x += letter_xspace;
	}
}

// draw question
if (question[page] != "%%%" && writing == 0)
{
	// reset options positions and get option length
	var _length = 0;
	for (var i = 0; i < 5; i++)
	{
		question_optx[i] = 0;
		question_opty[i] = 0;
		if (question_option[i] != "%%%")
			_length += 1;
	}
	var _scale = (1 + global.inbattle);
	
	// get info	
	var _old_question_pos = question_pos;
	
	if (_length == 3) || (_length == 4)
	{
		// positions
		question_optx[0] = 160;
		question_optx[1] = (160 - 30);
		question_optx[2] = (160 + 30);
		for (var i = 0; i < 3; i++)
			question_opty[i] = (orig_text_y + (letter_yspace * 1.6) + (12 * _scale));
		
		// movement
		if ((question_pos == 0 || question_pos == 2) && press_l) 
		{
			question_pos = 1;
			press_l = 0;
		}	
		if ((question_pos == 0 || question_pos == 1) && press_r)
		{
			question_pos = 2;
			press_r = 0;
		}
		
		// position and movement (for length 4)
		if (_length == 4)
		{
			question_optx[3] = 160;	
			question_opty[3] = ((orig_text_y + (letter_yspace * 1.6) + 12) - letter_yspace);
			
			if ((question_pos == 0 || question_pos == 1 || question_pos == 2) && press_u) 
			{
				question_pos = 3;
				press_u = 0;
			}
			if (question_pos == 3 && press_d == 1)
			{
				question_pos = 1;
				press_d = 0;
			}
		}	
		
		// save custom position
		if (msg_type[page] == "savepoint")
		{
			for (var i = 0; i < 3; i++)
				question_opty[i] = 127;
		}
	}
	if (_length == 5)
	{
		// positions
		question_optx[0] = 160;
		question_optx[1] = (160 - 30);
		question_optx[2] = (160 + 30);
		question_optx[3] = (160 - 30);
		question_optx[4] = (160 + 30);
		question_opty[0] = (orig_text_y + (letter_yspace * 1.6) + 12);
		question_opty[1] = (orig_text_y + (letter_yspace * 1.6) + 12);
		question_opty[2] = (orig_text_y + (letter_yspace * 1.6) + 12);
		question_opty[3] = ((orig_text_y + (letter_yspace * 1.6) + 12) - letter_yspace);
		question_opty[4] = ((orig_text_y + (letter_yspace * 1.6) + 12) - letter_yspace);
		
		// movement
		if ((question_pos == 0 || question_pos == 2) && press_l == 1)
		{
			question_pos = 1;
			press_l = 0;
		}
		if ((question_pos == 0 || question_pos == 1) && press_r == 1)
		{
			question_pos = 2;
			press_r = 0;
		}
		if (question_pos == 1 && press_u == 1)
		{
			question_pos = 3;
			press_u = 0;
		}
		if (question_pos == 2 && press_u == 1)
		{
			question_pos = 4;
			press_u = 0;
		}
		if (question_pos == 3 && press_d == 1)
		{
			question_pos = 1;
			press_d = 0;
		}
		if (question_pos == 4 && press_d == 1)
		{
			question_pos = 2;
			press_d = 0;
		}
		if (question_pos == 3 && press_r == 1)
		{
			question_pos = 4;
			press_r = 0;
		}
		if (question_pos == 4 && press_l == 1)
		{
			question_pos = 3;
			press_l = 0;
		}
	}
	
	if (question_pos != _old_question_pos)
		audio_play(snd_option_move, 0, VOLUME_SOUND);
		
	// change info
	i = 0;
	while (i < 5)
	{
		question_optx[i] += _bonusx;
		question_opty[i] += _bonusy;
		question_optx[i] *= _scale;
		if (question[page] == "" && msg_type[page] != "savepoint")
			question_opty[i] = (orig_text_y + (letter_yspace * 1.5));
		question_optx[i] = round(question_optx[i]);
		question_opty[i] = round(question_opty[i]);
		i += 1;
	}
	
	// draw options
	for (var i = 0; i < _length; i++)
	{
		if (i == 1) || (i == 3 && _length == 5)
		{
			draw_set_valign(fa_middle);
			draw_set_halign(fa_right);
		}
		if (i == 2) || (i == 4) 
		{
			draw_set_valign(fa_middle);
			draw_set_halign(fa_left);
		}
		if (i == 3 && _length == 4) 
		{
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
		}
		
		var _font = fnt_main_spaced;
		if (global.inbattle == 1)
			_font = fnt_main_big;
		var _color = c_white;
		if (i == question_pos)
			_color = c_yellow;
		draw_set_font(_font);
		draw_text_color(question_optx[i], question_opty[i], question_option[i], _color, _color, _color, _color, alpha); 
	}

	// draw heart
	var _xalign = (10 * _scale);
	if (question_pos == 0)
		var _xx = question_optx[question_pos];
	if (question_pos == 1) || (question_pos == 3 && _length == 5)
	{
		var _xx = (question_optx[question_pos] - string_width(question_option[question_pos]) - _xalign);
		if (_length == 3 && _scale == 2)
			_xx = (question_optx[question_pos] + _xalign);
	}
	if (question_pos == 3 && _length == 4)
		var _xx = (question_optx[question_pos] - (string_width(question_option[question_pos]) / 2) - _xalign);
	if (question_pos == 2) || (question_pos == 4)
		var _xx = (question_optx[question_pos] - _xalign);
	var _yy = question_opty[question_pos];
	
	draw_sprite_ext(spr_heart_small, 0, _xx, _yy, _scale, _scale, 0, c_white, alpha);
	
	// select
	if (question_pos != 0 && press_enter == 1)
	{
		question_result[page] = question_pos;
		if (msg_type[page] != "savepoint")
			audio_play(snd_option_select, 0, VOLUME_SOUND);
		else
		{
			if (question_result[page] == 1)
			{
				savefile_write();
				audio_play(snd_save, 0, VOLUME_SOUND);
			}
			else if (question_result[page] == 2)
				audio_play(snd_option_return, 0, VOLUME_SOUND);
		}
		event_user(1);
	}
}

shake_change = !shake_change;
draw_set_alpha(1);

if (global.indebug == 1)
{
	draw_set_color(c_red);
	draw_line(text_xend, 0, text_xend, 640);
}