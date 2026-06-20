
// jogar (continuar)
if (global.menu_lvl == 5)
{
	savefile_read(play_save);
	
	var _bg_x = (room_width / 2);
	var _bg_y = 0;
	var _bg_sc = 2;
	
	var _bg = spr_menu_continue_bg;
	var _bg_h = (sprite_get_height(_bg) * _bg_sc);
	var _bg_y_center = (_bg_y + (_bg_h / 2));
	
	// fundo
	draw_sprite_stretched_ext(spr_menu_optbg, 0, -10, -10, (10 + room_width + 10), (10 + room_height + 10), c_white, 1);
	draw_sprite_ext(spr_menu_continue_bg, savefile_world, _bg_x, _bg_y, _bg_sc, _bg_sc, 0, c_white, alpha);
	
	// personagens - corredores
	if (savefile_world == WORLD_CORRIDORS)
	{
		// mee6
		if (savefile_flag[2] == 1)
			draw_sprite_ext(spr_m6_d, 0, _bg_x, _bg_y_center, _bg_sc, _bg_sc, 0, c_white, alpha);
			
		// dummy
		if (savefile_flag[6] == 0 && savefile_flag[7] == 0)
		{
			var _x = 160;
			var _y = 260;
			
			draw_sprite_ext(spr_npc_dummy, 0, _x, _y, _bg_sc, _bg_sc, 0, c_white, alpha);
		}
			
		// armsguy e trashguy (kunai)
		if (savefile_flag[48] == 1)
		{
			var _x = 500;
			var _y = 280;
			
			draw_sprite_ext(spr_npc_trashguy, 0, (_x - 40), (_y - 20), 2, 2, 0, c_white, alpha);
			draw_sprite_ext(spr_npc_armsguy, 0, _x, _y, 2, 2, 0, c_white, alpha);
		}
		
		
	}
	
	
	
	/*
	// draw back
	var _back = spr_menu_continue_back;
	var _backx = (room_width / 2);
	var _backy = 0;
	draw_sprite_ext(spr_menu_continue_back, global.chara_world, _backx, _backy, 2, 2, 0, c_white, menu_alpha);

	//var _backw = (sprite_get_width(_back) * 2);
	var _backh = (sprite_get_height(_back) * 2);
	var _backycenter = (_backy + (_backh / 2));
	
	if (global.chara_world == WORLD_CORRIDORS)
	{
		// draw m6
		if (global.flag[2] == 1)
			draw_sprite_ext(spr_m6_d, 0, _backx, _backycenter, 2, 2, 0, c_white, menu_alpha);
	
		// draw armsguy
		if (global.flag[48] == 1)
			draw_sprite_ext(spr_npc_armsguy, 0, 220, 240, 2, 2, 0, c_white, menu_alpha);
	
		// draw bc
		if (global.flag[39] == 1 && global.flag[38] == 0)
		{
			continueback_bcsiner += 0.1;
			draw_sprite_ext(spr_npc_bc, 0, 440, (150 + (sin(continueback_bcsiner) * 5)), 2, 2, 0, c_white, menu_alpha);
		}
	}
	*/
}



// fundo das opções
if (global.menu_lvl >= 0)
{
	var l = global.menu_lvl;
	if !(global.menu_lvl == 0 && keyboard_check(vk_alt) == 1) // esconder hud
		draw_sprite_stretched_ext(spr_menu_optbg, 0, option_bgx[l], option_bgy[l], option_bgw[l], option_bgh[l], c_white, (option_alpha * alpha));

	/*
	var _xx = 0;
	var _yy = 0;
	var _ww = 0;
	var _hh = 0;
	draw_set_font(fnt_main_big);
	var _optw = menu_option_width[global.menu_lvl, 0];
	var _opth = string_height(string_upper(menu_option[global.menu_lvl, 0]));
	var _hspace = (40 + sprite_get_width(spr_heart_small));
	var _vspace = 30;

	if (global.menu_lvl == 0) || (global.menu_lvl == 4) || (global.menu_lvl == 5)
	{
		_xx = (320 - (_optw / 2) - _hspace);
		_yy = (menu_option_y[global.menu_lvl, 0] - (_opth / 2) - _vspace);
		_ww = ((_hspace * 2) + _optw)
		if (global.menu_lvl == 4)
			_ww -= 4;
		_hh = abs((menu_option_y[global.menu_lvl, (menu_option_length[global.menu_lvl] - 1)] + (_opth / 2) + _vspace) - _yy)
	}
	else if (global.menu_lvl == 1)
	{
		_xx = (menu_option_x[global.menu_lvl, 0] - (_optw / 2) - _hspace);
		_yy = (menu_option_y[global.menu_lvl, 0] - (_opth / 2) - _vspace);
		_ww = (room_width - (_xx * 2))
		_hh = ((_vspace * 2) + _opth);
	
	}
	else if (global.menu_lvl == 2) || (global.menu_lvl == 6)
	{
		var _string = "YES";
		if (global.menu_lvl == 6)
			_string = "[Right Arrow]";
	
		_xx = (320 - ((_optw + string_width("  " + string(_string))) / 2) - _hspace);
		_yy = -40;
		_ww = (_optw + string_width("  " + string(_string)) + (_hspace * 2));
		_hh = 720;
	}
	else if (global.menu_lvl == 3)
	{
		_xx = -40;
		_yy = -40;
		_ww = (120 + menu_option_width[3, 0]);
		_hh = 720;	
	}

	draw_sprite_stretched_ext(spr_menu_textbox, 0, _xx, _yy, _ww, _hh, c_white, (menu_option_alpha * menu_alpha));
	*/
}



// jogar (novo jogo)
if (global.menu_lvl == 7)
{
	draw_set_font(option_font);
	draw_set_alpha(alpha);
	
	// título
	event_user(6);
	
	// nome do jogador
	draw_set_valign(fa_middle);
	var _bc = (string_width("brokenclock") / 2);
	
	draw_sprite_stretched(spr_menu_optbg, 0, ((room_width / 2) - _bc - 44), ((room_height / 2) - 44), (44 + (_bc * 2) + 44), 88);
	
	var _underline = "___________";
	_underline = string_copy(_underline, 0, (11 - string_length(global.chara_name)));
	
	draw_set_color(c_gray);
	draw_set_halign(fa_right);
	draw_text(((room_width / 2) + _bc), (room_height / 2), _underline);
	
	draw_set_halign(fa_left);
	draw_set_color(global.c_dump);
	draw_text(((room_width / 2) - _bc), (room_height / 2), global.chara_name);
	
	// mensagem secreta
	if (msg != "")
	{
		draw_set_font(fnt_main_spaced);
		var _msg_di = 22;
		var _msg_w = string_width(msg);
		var _msg_h = string_height(msg);
		var _msg_x = round(room_width / 2);
		var _msg_y = round((room_height / 2) - 44 + 88 + _msg_di - 15);
		draw_sprite_stretched_ext(spr_menu_optbg, 0, round(_msg_x - (_msg_w / 2) - _msg_di), round(_msg_y - _msg_di), round(_msg_di + _msg_w + _msg_di), round(_msg_di + _msg_h + _msg_di), c_white, (option_alpha * alpha));

		draw_set_alpha(option_alpha * alpha)
		draw_set_color(c_white);
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_text(_msg_x, _msg_y, msg);
	}
}

// conquistas, créditos
if (global.menu_lvl == 3) || (global.menu_lvl == 4)
{	
	var _pos = achievement_pos;
	var _max = (global.achievement_total - 1);
	if (global.menu_lvl == 4)
	{
		_pos = credits_pos;
		_max = 2;
	}
	draw_set_alpha(option_alpha * alpha);
	
	// fundo
	var _bg_x = 90;
	var _bg_y = 30;
	var _bg_w = (room_width - 180);
	var _bg_h = (room_height - 120 - 30);
	var _bg_col = c_white;
	if (global.menu_lvl == 3 && global.achievement[_pos] == 1)
		_bg_col = c_yellow;
	draw_sprite_stretched_ext(spr_menu_optbg, 0, _bg_x, _bg_y, _bg_w, _bg_h, _bg_col, alpha);

	// setas
	draw_set_font(fnt_main_bigger);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	for (var i = 0; i < 2; i++)
	{
		var _arrow = "<";
		if (i == 1)
			_arrow = ">";
		
		if !(i == 0 && _pos == 0) && !(i == 1 && _pos == _max)
			draw_text_outline((60 + ((_bg_w + 60) * i)), (_bg_y + (_bg_h / 2)), _arrow, c_white, 2, c_black);	
	}
	
	// conquistas
	if (global.menu_lvl == 3)
	{
		// foto da conquista
		var _image_spr = spr_achievement_image;
		var _image_sc = 3;
		var _image_w = (sprite_get_width(_image_spr) * _image_sc);
		var _image_h = (sprite_get_height(_image_spr) * _image_sc);
		var _image_x = (_bg_x + (_bg_w / 2) - (_image_w / 2));
		var _image_y = (_bg_y + 40);
		draw_sprite_ext(_image_spr, _pos, _image_x, _image_y, _image_sc, _image_sc, 0, c_white, (option_alpha * alpha));
		draw_sprite_ext(spr_achievement_border, 0, _image_x, _image_y, _image_sc, _image_sc, 0, c_white, (option_alpha * alpha));
	
		// nome da conquista
		draw_set_font(fnt_main_spaced_big);
		var _name = "\"" + string(global.achievement_name[_pos]) + "\"";
		var _name_h = string_height(_name);
		var _name_y = (_image_y + _image_h + 5 + 20);
		draw_set_valign(fa_top);
		draw_text((_image_x + (_image_w / 2)), _name_y, _name);
	
		// descrição da conquista
		draw_set_color(c_gray);
		draw_text_ext((_image_x + (_image_w / 2)), (_name_y + _name_h + 20), global.achievement_desc[_pos], -1, (_bg_w - 70));
	
		// outros
		var _other_di = 20;
		var _other_y = (_bg_y + _other_di);
		draw_set_color(c_white);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_text((_bg_x + _other_di), _other_y, "#" + string(_pos + 1)); // número da conquista
		if (global.achievement[_pos] == 1) // achieved
		{
			draw_set_halign(fa_right);
			draw_text((_bg_x + _bg_w - _other_di), _other_y, "ACHIEVED");
		}
	
		// quantidade de conquistas pegues
		var _amt_total = global.achievement_total;
		if (_amt_total < 10)
			_amt_total = "0" + string(_amt_total);
		var _amt_achieved = achievement_achieved();
		if (_amt_achieved < 10)
			_amt_achieved = "0" + string(_amt_achieved);
		var _amt_str = "" + string(_amt_achieved) + "/" + string(_amt_total) + "";
	
		var _amt_w = string_width(_amt_str);
		var _amt_h = string_height(_amt_str);
	
		var _amt_bgw = (22 + _amt_w + 22);
	
		var _amt_x = (_bg_x + ((option_bgx[3] - _bg_x) / 2) - (_amt_w / 2));
		var _amt_y = (room_height - 60);
		
		draw_sprite_stretched_ext(spr_menu_optbg, 0, (_amt_x - 22), (_amt_y - (_amt_h / 2) - 22), _amt_bgw, (22 + _amt_h + 22), c_white, (option_alpha * alpha));
		
		draw_set_color(c_white);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_left);
		draw_text(_amt_x, _amt_y, _amt_str);
	}
	
	// créditos
	if (global.menu_lvl == 4)
	{
		draw_set_alpha(alpha);
		
		// principal
		if (credits_pos == 0)
		{
			for (var i = 0; i < 2; i++)
			{			
				var _cur = (2 * i);
				draw_set_halign(fa_center);
				draw_set_font(fnt_main_spaced_medium);
				credits_y[0] = (_bg_y + 40 + 12);
				credits_y[1] = (credits_y[0] + 40 - (string_height("ABC") / 2));
				credits_y[2] = (credits_y[1] + string_height(get_text("menu_4_info_0_1")) + 80);
				credits_y[3] = (credits_y[2] + 40 - (string_height("ABC") / 2));
			
				draw_set_font(fnt_main_spaced_big);
				draw_set_color(c_white);
				draw_set_valign(fa_middle);
				draw_text((_bg_x + (_bg_w / 2)), credits_y[_cur], get_text("menu_4_info_0_" + string(_cur)));
			
				draw_set_font(fnt_main_spaced_medium);
				draw_set_color(merge_color(c_gray, c_ltgray, 0.5));
				draw_set_valign(fa_top);
				draw_text_ext((_bg_x + (_bg_w / 2)), credits_y[(_cur + 1)],  get_text("menu_4_info_0_" + string(_cur + 1)), -1, (_bg_w - 60));
			}
		}
		
		// outros
		if (credits_pos == 1)
		{
			for (var i = 0; i < 4; i++)
			{			
				var _di0 = 25;
				var _di1 = 40;
				var _cur = (2 * i);
				draw_set_halign(fa_center);
				draw_set_font(fnt_main_spaced_medium);
				
				credits_y[0] = (_bg_y + _di0 + 14);
				credits_y[1] = (credits_y[0] + _di0 - (string_height("ABC") / 2));
				
				credits_y[2] = (credits_y[1] + string_height(get_text("menu_4_info_1_1")) + _di1);
				credits_y[3] = (credits_y[2] + _di0 - (string_height("ABC") / 2));
				
				credits_y[4] = (credits_y[3] + string_height(get_text("menu_4_info_1_3")) + _di1);
				credits_y[5] = (credits_y[4] + _di0 - (string_height("ABC") / 2));
				
				credits_y[6] = (credits_y[5] + string_height(get_text("menu_4_info_1_5")) + _di1);
				credits_y[7] = (credits_y[6] + _di0 - (string_height("ABC") / 2));
				
				credits_y[8] = (credits_y[7] + string_height(get_text("menu_4_info_1_7")) + _di1);
				credits_y[9] = (credits_y[8] + _di0 - (string_height("ABC") / 2));
			
				draw_set_color(c_white);
				draw_set_valign(fa_middle);
				draw_text((_bg_x + (_bg_w / 2)), credits_y[_cur], get_text("menu_4_info_1_" + string(_cur)));
				
				draw_set_color(merge_color(c_gray, c_ltgray, 0.75));
				draw_set_valign(fa_top);
				draw_text_ext((_bg_x + (_bg_w / 2)), credits_y[(_cur + 1)],  get_text("menu_4_info_1_" + string(_cur + 1)), -1, (_bg_w - 60));
			}
		}
		
		// undertale
		if (credits_pos == 2)
		{
			draw_set_color(c_white);
			draw_set_font(fnt_main_spaced_big);
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_text((_bg_x + (_bg_w / 2)), (_bg_y + (_bg_h / 2)), get_text("menu_4_info_2_0"));
		}
		
		
		/*
		// dsans
		var _00 = get_text("menu_4_info_0_0");
		draw_set_color(c_white);
		draw_set_valign(fa_middle);
		draw_text((_bg_x + (_bg_w / 2)), (_bg_y + 40), _00);
		
		// (dsans)
		var _01 = get_text("menu_4_info_0_1");
		draw_set_color(c_gray);
		draw_set_valign(fa_top);
		draw_text_ext((_bg_x + (_bg_w / 2)), (_bg_y + 40 + 40 - (string_height("ABC") / 2)), _01, -1, (_bg_w - 60));
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		/*
		// migel
		draw_set_color(c_white);
		draw_set_valign(fa_middle);
		draw_text_ext((_bg_x + (_bg_w / 2)), (_bg_y + 40 + 40 - (string_height("ABC") / 2) + string_height(_01) + 40), get_text("menu_4_info_0_2"), -1, (_bg_w - 60));
		
		// (migel)
		draw_set_color(c_gray);
		draw_set_valign(fa_top);
		draw_text_ext((_bg_x + (_bg_w / 2)), (_bg_y + 40 + 40 - (string_height("ABC") / 2) + string_height(_01) + 40 + 40), get_text("menu_4_info_0_3"), -1, (_bg_w - 60));
		*/
	}	
}

// jogar (selecionar save)
if (global.menu_lvl == 1)
{
	draw_set_font(option_font);
	draw_set_alpha(option_alpha * alpha);
	
	// título
	event_user(6);
	
	// save slots
	var w = string_width("FILE 1");
	for (var i = 1; i < option_length[1]; i++)
	{
		var _x1 = (option_x[1, i] - 44 - 11 - 3);
		var _x2 = (_x1 + 44 + w + 44 - 10);
		var _y = (option_y[1, i] - 44);
		var _w2 = (room_width - _x2 - 22);
		
		// fundo
		draw_sprite_stretched(spr_menu_optbg, 0, _x1, _y, (44 + w + 44), 88);
		draw_sprite_stretched(spr_menu_optbg, 1, _x2, _y, _w2, 88);
		
		// texto
		mode = 1;
		var _di = 19;
		if (file_exists("savefile" + string(i - 1) + ".txt") == 1) // save existe
		{
			savefile_read(i - 1);
			var _name = savefile_name;
			var _lvl = savefile_lvl;
			var _world = chara_world_name(savefile_world);
			var _room = chara_room_name(savefile_room);
			
			var _color = global.c_dump;
			if (i == option_pos)
				_color = c_yellow;
			draw_set_color(_color);
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
			draw_text_width((_x2 + _di), (_y + _di), ("\"" + string(_name) + "\" - [LVL " + string(_lvl) + "]\n" + string(_world) + " - " + string(_room)), (_w2 - (_di * 2)));
		}
		else // save não existe
		{
			var _color = c_gray;
			if (i == option_pos)
				_color = c_yellow;
			draw_set_color(_color);
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_text((_x2 + (_w2 / 2)), (_y + 44), "[EMPTY]");	
		}
	}
}



// opções e indicador
if (global.menu_lvl >= 0)
{
	var l = global.menu_lvl;
	draw_set_font(option_font);
	draw_set_alpha(option_alpha * alpha);
	draw_set_valign(option_val[l]);
	draw_set_halign(option_hal[l]);
	
	if !(global.menu_lvl == 0 && keyboard_check(vk_alt) == 1) // esconder hud
	{
		// indicator (depth 1)
		if (option_heartdepth[l, option_pos] == 1)
			event_user(2);
	
		for (var i = 0; i < option_length[l]; i++)
		{
			// opções
			var _color = c_white;
			if (l == 7 && i == 2 && block == 1)
				_color = c_dkgray;
			if (i == option_pos && controls_changing == 0)
				_color = c_yellow;
			if (l == 5 && i == 2 && play_erase > 0)
				_color = c_red;
		
			var _opt_x = option_x[l, i];
			var _opt_y = (option_y[l, i] + scroll_y);
			draw_set_color(_color);
			draw_text(_opt_x, _opt_y, option[l, i]);
	
			// chave
			_color = global.c_dump;
			if (l == 6 && i == 1)
				_color = c_red;
			if (l == 6 && controls_changing == 1 && i == option_pos)
				_color = c_yellow;
		
			draw_set_color(_color);
			draw_text((_opt_x + option_w[l, i]), _opt_y, "  " + string_upper(option_key[l, i]));
		}	
	
		// indicator (depth 0)
		if (option_heartdepth[l, option_pos] == 0)
			event_user(2);
	}
}

// fundo inicial, aviso, título e versão
if (global.menu_lvl <= 0)
{
	// fundo inicial
	draw_set_alpha(startalpha);
	draw_set_color(c_black);
	draw_rectangle(-40, -40, (room_width + 40), (room_height + 40), 0);
	
	// aviso
	var _basex = (room_width / 2);
	draw_set_alpha(warning_alpha);
	draw_set_font(fnt_main_spaced_big);
	draw_set_halign(fa_center);
	
	var _pressy = (room_height - (room_height / 14));
	draw_set_valign(fa_bottom);
	draw_text_outline_ext(_basex, _pressy, warning_text[1], c_red, 35, 999, 1, c_maroon);
	
	var _mainy = ((_pressy / 2) - (string_height(warning_text[1]) / 2));
	draw_set_valign(fa_middle);
	draw_text_outline_ext(_basex, _mainy, warning_text[0], c_white, 35, 999, 1, c_dkgrey);
	
	if (keyboard_check(vk_alt) == 0) // esconder hud
	{
		// título
		for (var i = 0; i < title_length; i++)
			draw_sprite_ext(title_spr[i], 0, title_x[i], title_y, 1, 1, 0, c_white, alpha);

		// versão
		draw_set_font(fnt_main);
		draw_set_color(obj_menu_bg.trash_color);
		draw_set_alpha((alpha * (startalpha * -1) + 1) / 2);
		draw_set_valign(fa_bottom);
	
		draw_set_halign(fa_left);
		draw_text(5, (room_height - 2), global.game_version);
	
		draw_set_halign(fa_right);
		draw_text((room_width - 5), (room_height - 2), "HOLD [ALT] TO HIDE THE HUD");
	}
}


