
var _cx = obj_GAME_CONTROLLER.cam_x;
var _cy = obj_GAME_CONTROLLER.cam_y;
draw_set_alpha(alpha);
draw_set_color(c_white);


// fundo das informações principais
draw_sprite_stretched(spr_writer_textbox, 0, (_cx + bg_x[0]), (_cy + bg_y[0]), bg_w[0], bg_h[0]);


// informações principais
var _bg1_di = 10;
draw_set_valign(fa_top);

var _name_y = (_cy + bg_y[0] + _bg1_di);
draw_set_font(fnt_main_spaced);
draw_set_halign(fa_center);
draw_text_width((_cx + bg_x[0] + (bg_w[0] / 2)), _name_y, string(global.chara_name), (bg_w[0] - (_bg1_di * 2)));

var _info1 = "lvl\nhp\n$";
var _info2 = string(global.chara_lvl) + "\n" + string(global.chara_curhp) + "/" + string(global.chara_maxhp) + "\n" + string(global.chara_money);
var _info_y = (_name_y + string_height(global.chara_name) + (_bg1_di / 2) - 2);
draw_set_font(fnt_mars_6);
draw_set_halign(fa_left);
draw_text((_cx + bg_x[0] + _bg1_di), _info_y, _info1);
draw_text((_cx + bg_x[0] + _bg1_di + 25), _info_y, _info2);


// fundo das opções principais
draw_sprite_stretched(spr_writer_textbox, 0, (_cx + bg_x[1]), (_cy + bg_y[1]), bg_w[1], bg_h[1]);


// opções principais
for (var i = 0; i < option_length[0]; i++)
{
	var _color = c_white;
	if (lvl == 0 && i == option_pos && thiswriter == -1)
		_color = c_yellow;
	if (lvl != 0 && i == option_pos_orig)
		_color = global.c_dump;
	draw_set_font(fnt_main);
	draw_set_color(_color);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text((_cx + option_x[0, i]), (_cy + option_y[0, i]), option[0, i]);
}


// inventário
if (lvl == 1) || (lvl == 2)
{
	draw_set_font(fnt_main_spaced);
	
	// fundo das opções
	draw_sprite_stretched(spr_writer_textbox, 0, (_cx + bg_x[2]), (_cy + bg_y[2]), bg_w[2], bg_h[2]);
	
	// fundo do título
	draw_sprite_stretched(spr_writer_textbox, 1, (_cx + bg_x[2]), (_cy + bg_y[2]), bg_w[2], title_bgh);

	// título
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text((_cx + bg_x[2] + (bg_w[2] / 2)), (_cy + bg_y[2] + (title_bgh / 2)), title[0]);
	
	// fundo das outras opções
	draw_sprite_stretched(spr_writer_textbox, 2, (_cx + bg_x[2]), (_cy + bg_y[2] + bg_h[2] - title_bgh), bg_w[2], title_bgh);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// opções principais
	for (var i = 0; i < option_length[1]; i++)
	{
		// opção
		if (option[1, i] != undefined)
		{
			var _color = c_white;
			if (lvl == 1 && i == option_pos && thiswriter == -1)
				_color = c_yellow;
			if (lvl == 2 && i == option_pos_old) || (lvl == 1 && i == option_pos && thiswriter != -1)
				_color = global.c_dump;
			draw_set_color(_color);
			draw_text((_cx + option_x[1, i]), (_cy + option_y[1, i]), option[1, i]);
		}
		
		// linha
		else
		{
			var _y = (_cy + option_y[1, i] + (string_height(option[1, i]) / 2) - 1);
			draw_set_color(merge_color(c_black, global.c_dump, 0.5));
			draw_line_width((_cx + option_x[1, i]), _y, (_cx + option_x[1, i] + (bg_w[2] - (((22 / 1.5) + 10) * 2))), _y, 1);
		}
	}
	
	// outras opções
	for (var i = 0; i < option_length[2]; i++)
	{
		var _color = c_white;
		if (lvl == 2 && i == option_pos)
			_color = c_yellow;
		draw_set_color(_color);
		draw_text((_cx + option_x[2, i]), (_cy + option_y[2, i]), option[2, i]);	
	}
}


// status
if (lvl == 3)
{
	draw_set_font(fnt_main_spaced);
	
	// fundo principal
	draw_sprite_stretched(spr_writer_textbox, 0, (_cx + bg_x[3]), (_cy + bg_y[3]), bg_w[3], bg_h[3]);
	
	// fundo do título
	draw_sprite_stretched(spr_writer_textbox, 1, (_cx + bg_x[3]), (_cy + bg_y[3]), bg_w[3], title_bgh);
	
	// título
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text((_cx + bg_x[3] + (bg_w[3] / 2)), (_cy + bg_y[3] + (title_bgh / 2)), title[1]);
	
	var _imx = (_cx + bg_x[3] + (bg_w[3] / 2));
	var _ilx = (_cx + bg_x[3] + 15);
	var _irx = (_cx + bg_x[3] + bg_w[3] - 15);
	var _iy = (_cy + bg_y[3] + title_bgh + 16);
	
	// nome
	draw_text(_imx, _iy, "\"" + string(global.chara_name) + "\"");
	
	// informações
	draw_set_halign(fa_left);
	
		// esquerda (primeiro)
	draw_text(_ilx, (_iy + 25), "HP   " + string(global.chara_curhp) + "/" + string(global.chara_maxhp));
	draw_text(_ilx, (_iy + 40), "LVL  " + string(global.chara_lvl));
	draw_text(_ilx, (_iy + 55), "ATK  " + string((global.chara_atk - 10) + global.chara_wstrength));
	
		// direita (primeiro)
	info[0] = "$    " + string(global.chara_money);
	info[1] = "EXP  " + string(global.chara_exp) + "/" + string(global.chara_nextexp);
	info[2] = "DEF  " + string((global.chara_def - 10) + global.chara_astrength);
	for (var i = 0; i < 3; i++)
		info_w[i] = string_width(info[i]);
	info_maxw = max(info_w[0], info_w[1], info_w[2]);
	for (var i = 0; i < 3; i++)
		draw_text((_irx - info_maxw), (_iy + 25 + (15 * i)), info[i]);
	
		// esquerda (segundo)
	draw_text(_ilx, (_iy + 80), "SPARES  " + string(global.chara_spares));
	draw_text(_ilx, (_iy + 95), "HEALS   " + string(global.chara_heals));
	
		// direita (segundo)
	info[0] = "KILLS   " + string(global.chara_kills);
	info[1] = "DEATHS  " + string(global.chara_deaths);
	for (var i = 0; i < 2; i++)
		info_w[i] = string_width(info[i]);
	info_maxw = max(info_w[0], info_w[1]);
	for (var i = 0; i < 2; i++)
		draw_text((_irx - info_maxw), (_iy + 80 + (15 * i)), info[i]);
		
		// arma e armadura
	draw_text(_ilx, (_iy + 120), "WEAPON  " + string(global.chara_wname) + " (+" + string(global.chara_wstrength) + ")");
	draw_text(_ilx, (_iy + 135), "ARMOR   " + string(global.chara_aname) + " (+" + string(global.chara_astrength) + ")");
}	


// indicador das opções
if (thiswriter == -1 && lvl != 3)
{
	var _font = draw_get_font();
	var _bonusy = 0;
	if (_font == fnt_main_spaced)
		_bonusy = -2;
	draw_sprite_ext(spr_heart_small, 0, (_cx + option_x[lvl, option_pos] - 11), (_cy + option_y[lvl, option_pos] + 8 + _bonusy), 1, 1, 0, c_white, alpha);
}


draw_set_alpha(1);



/*

HP   20/20		$	 50
LVL  1			EXP  20
ATK  5			DEF  5

SPARES  5		KILLS   0
HEALS	3		DEATHS  2

WEAPON  Broomstick (+0)
ARMOR   Bandage (+0)

*/

/*
// fundo das informações principais
draw_sprite_stretched(spr_writer_textbox, 0, bg_x[0], bg_y[0], bg_w[0], bg_h[0]);


// informações principais
var _bg1_di = 10;
draw_set_valign(fa_top);

var _name_y = (bg_y[0] + _bg1_di);
draw_set_font(fnt_main_spaced);
draw_set_halign(fa_center);
draw_text_width((bg_x[0] + (bg_w[0] / 2)), _name_y, string(global.chara_name), (bg_w[0] - (_bg1_di * 2)));

var _info1 = "lvl\nhp\n$";
var _info2 = string(global.chara_lvl) + "\n" + string(global.chara_curhp) + "/" + string(global.chara_maxhp) + "\n" + string(global.chara_money);
var _info_y = (_name_y + string_height(global.chara_name) + (_bg1_di / 2) - 2);
draw_set_font(fnt_mars_6);
draw_set_halign(fa_left);
draw_text((bg_x[0] + _bg1_di), _info_y, _info1);
draw_text((bg_x[0] + _bg1_di + 25), _info_y, _info2);


// fundo das opções principais
draw_sprite_stretched(spr_writer_textbox, 0, bg_x[1], bg_y[1], bg_w[1], bg_h[1]);


// opções principais
for (var i = 0; i < option_length[0]; i++)
{
	var _color = c_white;
	if (lvl == 0 && i == option_pos && thiswriter == -1)
		_color = c_yellow;
	draw_set_font(fnt_main);
	draw_set_color(_color);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(option_x[0, i], option_y[0, i], option[0, i]);
}


// inventário
if (lvl == 1) || (lvl == 2)
{
	draw_set_font(fnt_main_spaced);
	
	// fundo das opções
	draw_sprite_stretched(spr_writer_textbox, 0, bg_x[2], bg_y[2], bg_w[2], bg_h[2]);
	
	// fundo do título
	draw_sprite_stretched(spr_writer_textbox, 1, bg_x[2], bg_y[2], bg_w[2], title_bgh);

	// título
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text((bg_x[2] + (bg_w[2] / 2)), (bg_y[2] + (title_bgh / 2)), title[0]);
	
	// fundo das outras opções
	draw_sprite_stretched(spr_writer_textbox, 2, bg_x[2], (bg_y[2] + bg_h[2] - title_bgh), bg_w[2], title_bgh);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// opções principais
	for (var i = 0; i < option_length[1]; i++)
	{
		// opção
		if (option[1, i] != undefined)
		{
			var _color = c_white;
			if (lvl == 1 && i == option_pos)
				_color = c_yellow;
			if (lvl == 2 && i == option_pos_old)
				_color = global.c_dump;
			draw_set_color(_color);
			draw_text(option_x[1, i], option_y[1, i], option[1, i]);
		}
		
		// linha
		else
		{
			var _y = (option_y[1, i] + (string_height(option[1, i]) / 2) - 1);
			draw_set_color(merge_color(c_black, global.c_dump, 0.5));
			draw_line_width(option_x[1, i], _y, (option_x[1, i] + (bg_w[2] - (((22 / 1.5) + 10) * 2))), _y, 1);
		}
	}
	
	// outras opções
	for (var i = 0; i < option_length[2]; i++)
	{
		var _color = c_white;
		if (lvl == 2 && i == option_pos)
			_color = c_yellow;
		draw_set_color(_color);
		draw_text(option_x[2, i], option_y[2, i], option[2, i]);	
	}
}


// indicador das opções
if (thiswriter == -1)
{
	var _font = draw_get_font();
	var _bonusy = 0;
	if (_font == fnt_main_spaced)
		_bonusy = -2;
	draw_sprite_ext(spr_heart_small, 0, (option_x[lvl, option_pos] - 11), (option_y[lvl, option_pos] + 8 + _bonusy), 1, 1, 0, c_white, alpha);
}


draw_set_alpha(1);
*/














