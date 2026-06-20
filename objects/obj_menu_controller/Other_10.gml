/// @descr opções

draw_set_font(option_font);

// pegar opções
for (var l = 0; l < 8; l++)
{
	for (var i = 0; i < 99; i++)
	{
		option[l, i] = "";
		option_key[l, i] = "  ";
		
		var _id = string(l) + "_" + string(i);
		var _opt = get_text("menu_" + string(_id));
		if (_opt != undefined)
		{
			option[l, i] = string_upper(_opt);
			
			option_w[l, i] = string_width(option[l, i]);
			if (i == 0)
				option_whigh[l] = option_w[l, i];
			else
				option_whigh[l] = max(option_whigh[l], option_w[l, i]);
				
			option_h[l, i] = string_height(option[l, i]);
			if (i == 0)
				option_hhigh[l] = option_h[l, i];
			else
				option_hhigh[l] = max(option_hhigh[l], option_h[l, i]);
		}
		else
		{
			option_length[l] = i;
			option_lengthlast[l] = (i - 1);
			break;
		}
		
		//var _key = get_text("menu_key_" + string(_id));
		//if (_key != undefined)
		//	option_key[l, i] = string_upper(_key);
	}
}

event_user(1);

// posições das opções e de seus fundos
for (var l = 0; l < 8; l++)
{
	for (var i = 0; i < option_length[l]; i++)
	{			
		// principal
		option_x[l, i] = 0;
		option_y[l, i] = 0;
		option_val[l] = fa_middle; // align vertical
		option_hal[l] = fa_center; // align horizontal
		option_xdi[l, i] = 0; // diferença horizontal entre cada opção [nível]
		option_ydi[l, i] = 0; // diferença vertical entre cada opção [nível]
		option_xditotal[l, i] = 0; // diferença horizontal de cada opção em relação à primeira opção
		option_yditotal[l, i] = 0; // diferença vertical de cada opção em relação à primeira opção
	
		// outros
		option_bgx[l] = 0;
		option_bgy[l] = 0;
		option_bgw[l] = 0;
		option_bgh[l] = 0;
		option_bgtype[l] = 0;
		option_heartx[l, i] = 0;
		option_hearty[l, i] = 0;
		option_heartdepth[l, i] = 0;
		option_heartscale[l, i] = 2;
		option_heartalpha[l, i] = 1;
	
		// definir as posições
		if (l == 0) // título
		{
			option_x[l, i] = (room_width / 2);
			
			option_y[l, 0] = 250;
			if (i > 0)
			{
				option_ydi[l, i] = 40;
				option_y[l, i] = (option_y[l, 0] + option_yditotal[l, (i - 1)] + option_ydi[l, i]);	
				option_yditotal[l, i] = (option_yditotal[l, (i - 1)] + option_ydi[l, i]);
			}
			
			option_heartx[l, i] = (option_x[l, i] - (option_w[l, i] / 2) - 22);
			
			option_bgx[l] = (option_x[l, 0] - (option_whigh[l] / 2) - 44 - 10);
			option_bgy[l] = (option_y[l, 0] - 44);
			option_bgw[l] = (44 + 10 + option_whigh[l] + 44 + 10);
			option_bgh[l] = (44 + (option_y[l, i] - option_y[l, 0]) + 44);
		}
		else if (l == 1) // jogar (selecionar save)
		{
			option_x[l, i] = (66 + 11 + 3);
			if (i == 0)
				option_x[l, i] = ((room_width / 2) - (option_w[l, i] / 2) + 22)//11);
			option_y[l, 0] = (120 + 10) + 3 + 4 + 2 + 1;
			if (i > 0)
			{
				option_ydi[l, i] = 87;
				if (i == 1)
					option_ydi[l, i] += 23 - 3 - 4 + 4 - 1;
				option_y[l, i] = (option_y[l, 0] + option_yditotal[l, (i - 1)] + option_ydi[l, i]);	
				option_yditotal[l, i] = (option_yditotal[l, (i - 1)] + option_ydi[l, i]);
			}
		
			option_hal[l] = fa_left;
			option_heartx[l, i] = (option_x[l, i] - 22);
			
			option_bgx[l] = (option_x[l, 0] - 10 - 44);
			option_bgy[l] = (option_y[l, 0] - (option_h[l, 0] / 2) - 22);
			option_bgw[l] = (44 + 10 + option_w[l, 0] + 10 + 22);
			option_bgh[l] = (22 + option_h[l, 0] + 22);
		}
		else if (l == 2) || (l == 6) // configurações, controles
		{
			var _maxwidth = (option_whigh[l] + string_width("  100%"));
			option_x[l, i] = ((room_width / 2) - (_maxwidth / 2));
			if (l == 6)
				option_x[l, i] = 44;
			
			option_y[l, 0] = 40;
			if (i > 0)
			{
				option_ydi[l, i] = 40;
				option_y[l, i] = (option_y[l, 0] + option_yditotal[l, (i - 1)] + option_ydi[l, i]);	
				option_yditotal[l, i] = (option_yditotal[l, (i - 1)] + option_ydi[l, i]);
			}

			option_hal[l] = fa_left;
			option_heartx[l, i] = (option_x[l, i] - 22);
			
			option_bgx[l] = (option_x[l, 0] - 44 - 10);
			option_bgy[l] = -12;
			option_bgw[l] = (44 + 10 + _maxwidth + 44 + 10);
			option_bgh[l] = (12 + room_height + 12);
			if (l == 6)
				option_bgw[l] = (10 + 44 + room_width + 44 + 10);
		}
		else if (l == 3) || (l == 4) // conquistas, créditos
		{
			option_x[l, i] = ((room_width / 2) + 11);
			option_y[l, i] = (room_height - 60);
			
			option_heartx[l, i] = (option_x[l, i] - (option_w[l, i] / 2) - 22);
			
			option_bgx[l] = (option_x[l, 0] - (option_whigh[l] / 2) - 44 - 10);
			option_bgy[l] = (option_y[l, 0] - 44);
			option_bgw[l] = (44 + 10 + (option_w[l, 0] / 2) + (option_x[l, i] - option_x[l, 0]) + (option_w[l, i] / 2) + 10 + 22);
			option_bgh[l] = (44 + (option_y[l, i] - option_y[l, 0]) + 44);
		}
		else if (l == 5) // jogar (continuar jogo)
		{
			option_x[l, i] = (room_width / 2);
			
			option_y[l, 0] = 340;
			if (i > 0)
			{
				option_ydi[l, i] = 40;
				option_y[l, i] = (option_y[l, 0] + option_yditotal[l, (i - 1)] + option_ydi[l, i]);	
				option_yditotal[l, i] = (option_yditotal[l, (i - 1)] + option_ydi[l, i]);
			}
			
			option_heartx[l, i] = (option_x[l, i] - (option_w[l, i] / 2) - 22);
			
			option_bgx[l] = (option_x[l, 0] - (option_whigh[l] / 2) - 44 - 10);
			option_bgy[l] = (option_y[l, 0] - 44);
			option_bgw[l] = (44 + 10 + option_whigh[l] + 44 + 10);
			option_bgh[l] = (44 + (option_y[l, i] - option_y[l, 0]) + 44);
			
			/*
			menu_option_x[5, i] = 320;
			menu_option_y[5, i] = (room_height - string_height(string_upper(menu_option[4, 0])) - 38 - (40 * (menu_option_length[5] - 1)) + (40 * i));
			menu_option_align[5, i] = 0;
			menu_option_heartx[5, i] = (menu_option_x[5, i] - (string_width(string_upper(menu_option[5, i])) / 2) - 20);;
			menu_option_hearty[5, i] = menu_option_y[5, i];
			*/
		}
		else if (l == 7) // jogar (novo jogo)
		{
			option_x[l, 0] = (room_width / 4);
			if (i > 0)
			{
				option_xdi[l, i] = (room_width / 4);
				option_x[l, i] = (option_x[l, 0] + option_xditotal[l, (i - 1)] + option_xdi[l, i]);
				option_xditotal[l, i] = (option_xditotal[l, (i - 1)] + option_xdi[l, i]);
			}
			option_y[l, i] = (room_height - 60);
			
			option_heartx[l, i] = (option_x[l, i] - (option_w[l, i] / 2) - 22);
			
			option_bgx[l] = (option_x[l, 0] - (option_whigh[l] / 2) - 44 - 10);
			option_bgy[l] = (option_y[l, 0] - 44);
			option_bgw[l] = (44 + 10 + (option_w[l, 0] / 2) + (option_x[l, i] - option_x[l, 0]) + (option_w[l, i] / 2) + 10 + 44);
			option_bgh[l] = (44 + (option_y[l, i] - option_y[l, 0]) + 44);
		}
		
		option_hearty[l, i] = option_y[l, i];
	}


	
	/*
	// posição das opções
	option_x[l, 0] = 0;
	option_y[l, 0] = 0;
	option_xdi[l] = 0; // diferença horizontal entre cada opção [nível]
	option_ydi[l] = 0; // diferença vertical entre cada opção [nível]
	
	// align das opções
	option_val[l] = fa_middle; // align vertical
	option_hal[l] = fa_center; // align horizontal
	
	// quantidade e largura das opções
	option_w[l, 0] = 0;
	option_whigh[l] = string_width(option[l, 0]);
	option_length[l] = 0;
	for (var i = 0; i < 99; i++)
	{
		if (option[l, i] != "")
		{
			option_w[l, i] = string_width(option[l, i]);
			if (i > 0)
				option_whigh[l] = max(option_whigh[l], option_w[l, i]);
		}
		else
		{
			option_length[l] = i;
			break;
		}
	}
	
	// indicador
	option_heartx[l, 0] = 0;
	option_hearty[l, 0] = 0;
	
	// fundo das opções
	option_bgx[l] = 0;
	option_bgy[l] = 0;
	option_bgw[l] = 0;
	option_bgh[l] = 0;
	
	// definir as posições
	for (var i = 0; i < option_length[l]; i++)
	{
		// título
		if (l == 0)
		{
			debug("i; " + string(i) + " | legnth: " + string(option_length[l]));
			option_x[l, i] = (room_width / 2);
			option_y[l, i] = 250;
			option_ydi[l] = 40;
				
			option_val[l] = fa_middle; 
			option_hal[l] = fa_center;
				
			option_heartx[l, i] = (option_x[l, i] - (option_w[l, i] / 2) - 20);
		}
			
		// configurações
		else if (l == 2)
		{
			option_x[l, i] = ( (room_width / 2) - ((option_whigh[l] + string_width("  100%")) / 2) );
			option_y[l, i] = 40;
			option_ydi[l] = 40;
			
			option_val[l] = fa_top; 
			option_hal[l] = fa_left;
			
			option_heartx[l, i] = (option_x[l, i] - 20);
		}
		
		option_hearty[l, i] = option_y[l, i];
	}
	
	// definir a posição e o tamanho do fundo das opções
	option_bgx[0] = (option_x[0, 0] - (option_whigh[0] / 2) - 48);
	option_bgy[0] = (option_y[0, 0] - 40);
	option_bgw[0] = (48 + option_whigh[0] + 48);
	option_bgh[0] = (20 + (option_ydi[0] * option_length[0]) + 20);
	*/
}




/*
function get_menutitle(_levelname)
{
	return get_text("menu_" + string(argument0) + "_title");
}
function get_menuoption(_levelname, _id, _opttype, _keybonus)
{
	var _type = "";
	if (argument2 == 1)
		_type = "_desc"
	if (argument2 != 2)
		return get_text("menu_" + string(argument0) + "_" + string(argument1) + string(_type));
	else
		return get_text("menu_settings_key_" + string(argument3));
}
for (var l = 0; l < 7; l++)
{	
	// get menu levels id
	var _name = "title";
	if (l == 1)
		_name = "play";
	else if (l == 2)
		_name = "settings";
	else if (l == 3)
		_name = "achievements";
	else if (l == 4)
		_name = "credits";
	else if (l == 5)
		_name = "continue";
	else if (l == 6)
		_name = "controls";
	
	// get title
	menu_title[l] = "";
	if (get_menutitle(_name) != undefined)
		menu_title[l] = get_menutitle(_name);
	menu_option_length[l] = 0;
		
	// get options, and options descriptions and keys
	for (var i = 0; i < 99; i++)
	{
		menu_option[l, i] = "";
		menu_option_key[l, i] = "";
		menu_option_desc[l, i] = "";
		
		menu_option_x[l, i] = 0;
		menu_option_y[l, i] = 0;
		menu_option_width[l, i] = 0;
		menu_option_align[l, i] = -1;
		
		menu_option_heartx[l, i] = 0;
		menu_option_hearty[l, i] = 0;
		
		// get options, descriptions and width
		if (get_menuoption(_name, i, 0) != undefined)
		{
			menu_option[l, i] = get_menuoption(_name, i, 0);
			menu_option_length[l] += 1;
			draw_set_font(fnt_main_big);
			menu_option_width[l, i] = string_width(menu_option[l, i]);
		}
		if (get_menuoption(_name, i, 1) != undefined)
			menu_option_desc[l, i] = get_menuoption(_name, i, 1);
		
		// set options keys
		event_user(1);
	}
		
	array_sort(menu_option_width[l], function(xx, yy)
	{
		return yy - xx;
	});
	
	// get options and heart positions, and align
	for (var i = 0; i < 99; i++)
	{
		// get options and heart positions, and options aligns
		menu_option_x[0, i] = 320;
		menu_option_y[0, i] = (250 + (40 * i));
		menu_option_align[0, i] = 0;
		menu_option_heartx[0, i] = (menu_option_x[0, i] - (string_width(string_upper(menu_option[0, i])) / 2) - 20);;
		menu_option_hearty[0, i] = menu_option_y[0, i];
		
		// play (new game)
		if (l == 1)
		{
			menu_option_x[l, i] = ((room_width / 4) * (i + 1))
			draw_set_font(fnt_main_big);
			menu_option_y[l, i] = (room_height - string_height(string_upper(menu_option[l, 0])) - 38);
			menu_option_align[l, i] = 0;
			menu_option_heartx[l, i] = (menu_option_x[l, i] - (string_width(string_upper(menu_option[l, i])) / 2) - 20);;
			menu_option_hearty[l, i] = menu_option_y[l, i];
		}
		
		// settings, controls
		if (l == 2) || (l == 6)
		{
			draw_set_font(fnt_main_big);
			menu_option_x[l, i] = (320 - ((menu_option_width[l, 0] + string_width("  YES")) / 2));
			menu_option_y[l, i] = (40 + (40 * i));
			menu_option_align[l, i] = 1;
			menu_option_heartx[l, i] = (menu_option_x[l, i] - 20);
			menu_option_hearty[l, i] = menu_option_y[l, i];
		}
		
		// achievements
		if (l == 3)
		{
			menu_option_x[3, i] = 40;
			menu_option_y[3, i] = (40 + (40 * i));
			menu_option_align[3, i] = 1;
			menu_option_heartx[3, i] = (menu_option_x[3, i] - 20);
			menu_option_hearty[3, i] = menu_option_y[3, i];	
		}
		
		// credits
		if (l == 4)
		{
			menu_option_x[4, i] = 320;
			draw_set_font(fnt_main_big);
			menu_option_y[4, i] = (room_height - string_height(string_upper(menu_option[4, 0])) - 38);
			menu_option_align[4, i] = 0;
			menu_option_heartx[4, i] = (menu_option_x[4, i] - (string_width(string_upper(menu_option[4, i])) / 2) - 20);;
			menu_option_hearty[4, i] = menu_option_y[4, i];
		}
		
		// play (continue)
		if (l == 5)
		{
			menu_option_x[5, i] = 320;
			menu_option_y[5, i] = (room_height - string_height(string_upper(menu_option[4, 0])) - 38 - (40 * (menu_option_length[5] - 1)) + (40 * i));
			menu_option_align[5, i] = 0;
			menu_option_heartx[5, i] = (menu_option_x[5, i] - (string_width(string_upper(menu_option[5, i])) / 2) - 20);;
			menu_option_hearty[5, i] = menu_option_y[5, i];
		}
	}

	// level scroll setup
	menu_scroll[l] = 0;
	menu_scroll[2] = 1;
	menu_scroll[6] = 1;
	menu_scroll_basey = 0;
}
*/
