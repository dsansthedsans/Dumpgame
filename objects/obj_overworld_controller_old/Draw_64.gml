
// draw chara menu
if (global.chara_menu == 1)
{
	// get info
	event_user(0);
	item_organize();

	//////// draw main stuff

	// main boxes
	draw_sprite_stretched_ext(spr_writer_textbox, 0, mainbox_x, mainbox_info_y, mainbox_w, mainbox_info_h, c_white, mainalpha);
	draw_sprite_stretched_ext(spr_writer_textbox, 0, mainbox_x, mainbox_opt_y, mainbox_w, mainbox_opt_h, c_white, mainalpha);
		
	draw_set_font(mainfont_info);
	draw_set_alpha(mainalpha);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// lvl
	draw_text(maininfo_x[0], maininfo_y[1], "LVL");
	draw_text(maininfo_x[1], maininfo_y[1], global.chara_lvl);	
	
	// hp
	draw_text(maininfo_x[0], maininfo_y[2], "HP");
	draw_text(maininfo_x[1], maininfo_y[2], string(global.chara_curhp) + string("/") + string(global.chara_maxhp));
	
	// money
	draw_text(maininfo_x[0], maininfo_y[3], get_text("charamenu_main_info_3"));
	draw_text(maininfo_x[1], maininfo_y[3], global.chara_money);
	
	// name
	draw_set_font(mainfont);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_width((mainbox_x + (mainbox_w / 2)), maininfo_y[0], ("\"" + string(global.chara_name) + "\""), 54);

	// main options
	for (var i = 0; i < mainopt_length; i++)
	{
		draw_set_alpha(mainalpha);
		draw_set_color(mainopt_color[i]);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text(mainopt_x[i], mainopt_y[i], mainopt[i]);
	}
	
	//////// draw in-level stuff
	
	// boxes, title and options
	if (global.charamenu_lvl > 0)
	{
		// draw box
		var _index = 1;
		if (global.charamenu_lvl == 1) || (global.charamenu_lvl == 1.5) // other options
		{
			_index = 2;
			bigbox_h = 132;
			draw_sprite_stretched_ext(spr_writer_textbox, 0, (bigbox_x + 2), (bigbox_y + bigbox_h - 3), (bigbox_w - 4), 27, c_white, levelalpha);
		}
		if (global.charamenu_lvl == 2)
			bigbox_h = 181;
		if (global.charamenu_lvl == 3)
			bigbox_h = 132;
		
		draw_sprite_stretched_ext(spr_writer_textbox, 0, (bigbox_x + 2), (bigbox_y - 27), (bigbox_w - 4), 30, c_white, levelalpha);
		draw_sprite_stretched_ext(spr_writer_textbox, 0, bigbox_x, (bigbox_y - 1), bigbox_w, (bigbox_h + 2), c_white, levelalpha);
		
		// draw title
		draw_set_font(levelfont);
		draw_set_alpha(levelalpha);
		draw_set_color(c_white);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text((bigbox_x + (bigbox_w / 2)), (bigbox_y - 12), leveltitle[(global.charamenu_lvl - 1)]);
		
		// draw options
		if (global.charamenu_lvl == 1) || (global.charamenu_lvl == 1.5) || (global.charamenu_lvl == 3)
		{
			for (var i = 0; i < levelopt_length; i++) 
			{	
				if (levelopt[i] != "")
				{
					draw_set_font(levelfont);
					draw_set_alpha(levelalpha);
					draw_set_color(levelopt_color[i]);
					draw_set_valign(fa_middle);
					draw_set_halign(fa_left);
					draw_text(levelopt_x[i], levelopt_y[i], levelopt[i]);
				}
				else
				{
					draw_set_color(#1E994E);
					draw_set_alpha(levelalpha);
					draw_line(levelopt_x[i], levelopt_y[i], (bigbox_x + bigbox_w - 26), levelopt_y[i]);
				}
			}
			
			// other
			if (global.charamenu_lvl == 1) || (global.charamenu_lvl == 1.5)
			{
				for (var i = 0; i < 3; i++)
				{
					draw_set_font(mainfont);
					draw_set_color(otheropt_color[i]);
					draw_set_valign(fa_middle);
					draw_set_halign(fa_left);
					draw_text(otheropt_x[i], otheropt_y[i], otheropt[i]);	
				}
			}
		}
		
		// draw stats
		if (global.charamenu_lvl == 2)
		{
			draw_set_font(levelfont);
			draw_set_alpha(levelalpha);
			draw_set_color(c_white);
			
			// name
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_text((bigbox_x + (bigbox_w / 2)), (bigbox_y + 18), "\"" + string(global.chara_name) + "\"");
			
			// other info
			var _vspace = 0;
			var _vspace_amt = 15;
			var _breaknum = 9;
			var _spacelength = "";
			
			for (var i = 0; i < array_length(levelinfo_stat); i++)
			{
				draw_set_valign(fa_top);
				
				if (i < _breaknum)
				{
					var _special = 0;
					if (i == 7) || (i == 8)
						_special = 1;
					
					draw_set_halign(fa_left);
					
					if (_special == 0)
						draw_text_width((bigbox_x + 16), (bigbox_y + 35 + _vspace), levelinfo_stat[i], ((bigbox_w / 2) - 24));
					else if (_special == 1)
						draw_text_width((bigbox_x + 16), (bigbox_y + 35 + _vspace), levelinfo_stat[i], (bigbox_w - 24));
				}
				else // 9, 10, 11
				{
					if (i == _breaknum)
						_vspace = 0;
					
					if (i >= 9 && i <= 11)
					{
						var _max = max(global.chara_atk, global.chara_def, global.chara_money);
						
						for (var z = 0; z < (string_length(_max) - 1); z++)
						{
							_spacelength += " ";	
						}
					}
					else
						_spacelength = "";
					
					draw_set_halign(fa_right);
					draw_text_width((bigbox_x + bigbox_w - 16), (bigbox_y + 35 + _vspace), levelinfo_stat[i], ((bigbox_w / 2) - 24));	
				}
				
				_vspace += _vspace_amt;
			}
		}
	}
	
	// heart
	if (global.charamenu_move == 1)
		draw_sprite_ext(spr_heart_small, 0, heart_posx, heart_posy, 1, 1, 0, c_white, mainalpha);
}

// draw chara pause
 if (global.chara_pause == 1)
{
	if (surfacespr != -1)
		draw_sprite_ext(surfacespr, 0, 0, 0, 0.5, 0.5, 0, c_white, 1)
	
	// bg
	draw_set_color(c_black);
	draw_set_alpha(pause_alpha / 1.5);
	draw_rectangle(-20, -20, 340, 260, 0);
	
	// text bg
	/*
	draw_set_font(fnt_main_big);
	var _hspace = 24;
	var _vspace = 15;
	
	var _title_x = (160 - (string_width(pause_title) / 2) - _hspace);
	var _title_y = (40 - (string_height(pause_title) / 2) - _vspace);
	var _title_w = ((_hspace * 2) + string_width(pause_title) - 3);
	var _title_h = ((_vspace * 2) + string_height(pause_title));
	draw_sprite_stretched_ext(spr_textbox, 0, _title_x, _title_y, _title_w, _title_h, c_white, pause_alpha);
	
	draw_set_font(fnt_main);
	if (pause_warning == 0)
	{
		var _option_x = (160 - (string_width(pause_option[1]) / 2) - _hspace);
		var _option_y = (120 - _vspace);
		var _option_w = ((_hspace * 2) + string_width(pause_option[1]));
		var _option_h = ((_vspace * 3) + 39);
	}
	else
	{
		var _option_x = (130 - (string_width(pause_warning_option[0]) / 2) - _hspace);
		var _option_y = (160 - _vspace);
		var _option_w = ((_hspace * 2) + 60 + string_width(pause_warning_option[0]) + string_width(pause_warning_option[1]));
		var _option_h = ((_vspace * 2) + string_height(pause_warning_option[0]));
	}
	draw_sprite_stretched_ext(spr_textbox, 0, _option_x, _option_y, _option_w, _option_h, c_white, pause_alpha);
	*/
	
	// title
	draw_set_font(fnt_main_big);
	draw_set_alpha(pause_alpha);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_outline_ext(160, 40, pause_title, c_white, 0, 999, 1, c_black);
	
	// warning title
	if (pause_warning == 1)
	{
		draw_set_font(fnt_main_spaced);
		draw_set_alpha(pause_alpha);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text_outline_ext(160, 120, pause_warning_text[(pause_option_pos - 1)], c_red, 15, 999, 1, c_black);
	}
	
	// options
	for (var i = 0; i < 3; i++)
	{
		// get
		var _xx = 160;
		var _yy = (120 + (20 * i));
		var _ll = pause_option_length;
		var _opt = pause_option[i];
		var _pos = pause_option_pos;
		if (pause_warning == 1)
		{
			_xx = (130 + (60 * i));
			_yy = 160;
			_ll = 2;
			if (i < _ll)
				_opt = pause_warning_option[i];
			_pos = pause_warning_pos;
		}
		
		// draw
		if (i < _ll)
		{
			var _color = c_white
			if (i == _pos)
				_color = c_yellow;
			draw_set_font(fnt_main);
			draw_set_alpha(pause_alpha);
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
			draw_text_outline_ext(_xx, _yy, string_upper(_opt), _color, 10, 999, 1, c_black);	
		}
	}
	
	// indicator
	var _hearthspace = 10;
	var _heartx = (160 - (string_width(pause_option[pause_option_pos]) / 2) - _hearthspace)
	var _hearty = (120 + (20 * pause_option_pos) + 8);
	if (pause_warning == 1)
	{
		_heartx = (130 - (string_width(pause_warning_option[pause_warning_pos]) / 2) - _hearthspace + (60 * pause_warning_pos));
		_hearty = 168;
	}
	draw_sprite_ext(spr_heart_small, 0, _heartx, _hearty, 1, 1, 0, c_white, pause_alpha);
}



draw_set_alpha(1);