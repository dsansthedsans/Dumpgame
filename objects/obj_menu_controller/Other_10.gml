/// @descr opções
draw_set_font(option_font);
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
	}
}
event_user(1);
for (var l = 0; l < 8; l++)
{
	for (var i = 0; i < option_length[l]; i++)
	{			
		option_x[l, i] = 0;
		option_y[l, i] = 0;
		option_val[l] = fa_middle; // align vertical
		option_hal[l] = fa_center; // align horizontal
		option_xdi[l, i] = 0; // diferença horizontal entre cada opção [nível]
		option_ydi[l, i] = 0; // diferença vertical entre cada opção [nível]
		option_xditotal[l, i] = 0; // diferença horizontal de cada opção em relação à primeira opção
		option_yditotal[l, i] = 0; // diferença vertical de cada opção em relação à primeira opção
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
		if (l == 0) // título
		{
			option_x[l, i] = (room_width / 2);
			
			option_y[l, 0] = (250 + 20);
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
}