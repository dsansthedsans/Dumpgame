
var _alpha = 1;
if (createbubble == 1) || (startattack == 1)
	_alpha = 0.25;
button_alpha = lerp(button_alpha, _alpha, 0.2);
gui_alpha = lerp(gui_alpha, _alpha, 0.2);

// draw buttons
for (var i = 0; i < (button_length * button_active); i++)
{
	var _index = (i == button_pos && button_select == 1);
	if (global.lang == "ptBR" && i != 2)
		_index += 2;
	draw_sprite_ext(button_spr[i], _index, button_x[i], button_y[i], 2, 2, 0, button_color[(i == button_pos && button_select == 1)], button_alpha);
}

// draw chara info
if (charainfo_active == true)
{
	var _inbetween = (box_defaulty + round(box_defaulth / 2) + box_borderw);
	_inbetween = (button_y[0] - round((button_y[0] - _inbetween) / 2));
	if (button_active == false)
		_inbetween = (box_y + round(box_h / 2) + box_borderw);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_set_font(global.fnt_mars);
	var _chara_icon_spr = spr_chara_d;
	if (global.CHARAFRISK_ENABLED == true && string_upper(global.chara_name) == "FRISK")
		_chara_icon_spr = spr_charaFrisk_d;
	var _chara_icon_width = sprite_get_width(_chara_icon_spr);
	var _chara_name_text = string_upper(global.chara_name);
	var _chara_name_scale = 3;
	var _chara_name_width = (string_width(_chara_name_text) * _chara_name_scale);
	var _chara_name_xDist = ((_chara_icon_width * 2) - 2 + 8);
	var _chara_bar_widthMax = (100 + (4 * (((global.CHARAFRISK_ENABLED == false || string_upper(global.chara_name) != "FRISK") ? global.chara_lvl : 20) - 1)));
	var _chara_bar_xDist = (_chara_name_width + 1 + 16);
	var _chara_icon_x = (box_defaultx - round(box_defaultw / 2) - box_borderw - 2);
	if (button_active == false)
		_chara_icon_x = (box_x - ((_chara_name_xDist + _chara_bar_xDist + _chara_bar_widthMax) / 2));
	var _chara_icon_y = (_inbetween - (16 * button_active) + (3 * !button_active));
	var _chara_icon_alpha = ((button_active == true) ? gui_alpha : 1);
	var _chara_name_x = (_chara_icon_x + _chara_name_xDist);
	var _chara_name_y = ((_chara_icon_y + 16) + 3);
	var _chara_bar_x = (_chara_name_x + _chara_bar_xDist);
	var _chara_bar_y = (box_y + round(box_h / 2) + box_borderw + 11);
	var _chara_bar_alpha = 1;
	/*chara_icon*/ draw_sprite_part_ext(_chara_icon_spr, 0, 0, 1, _chara_icon_width, 16, _chara_icon_x, _chara_icon_y, 2, 2, c_white, _chara_icon_alpha);
	if (chara_murder() >= 1)
		/*chara_icon_geno*/ draw_sprite_part_ext(spr_chara_genoshadow, DOWN, 0, 1, _chara_icon_width, 16, _chara_icon_x, _chara_icon_y, 2, 2, c_white, (_chara_icon_alpha * ((chara_murder() == 1) ? 0.5 : 1)));
	if (chara_murder() >= 2 && global.flag[75] == 1 && global.CHARAGENOSLIME_ENABLED == true)
        /*chara_icon_genosmile*/ draw_sprite_part_ext(spr_chara_genosmile, DOWN, 0, 1, _chara_icon_width, 16, _chara_icon_x, _chara_icon_y, 2, 2, c_white, _chara_icon_alpha);
    draw_set_alpha(_chara_icon_alpha);
	/*chara_name*/ draw_text_outline_transformed(_chara_name_x, _chara_name_y, _chara_name_text, c_white, 2, c_black, _chara_name_scale, _chara_name_scale, 0);
	if (guicolmerge_chara > 0.01)
        guicolmerge_chara = lerp(guicolmerge_chara, 0, 0.1);
    else
        guicolmerge_chara = 0;
    /*chara_bar*/ draw_battle_bar(((global.chara_curhp >= 10) ? "" : "0") + string(round(global.chara_curhp)) + " / "  + string(round(global.chara_maxhp)), global.chara_curhp, global.chara_maxhp, _chara_bar_x, _chara_bar_y, _chara_bar_widthMax, /*#FFDC31*/ merge_color(global.c_orange, c_white, guicolmerge_chara), global.c_red, _chara_bar_alpha);
    if (global.flag[2] == true && assist.active == true && button_active == true)
	{
		draw_set_alpha(gui_alpha);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_left);
		draw_set_font(global.fnt_mars);
		var _m6_icon_spr = spr_m6_d_default;
		if (party_typeM6_isSerious() == true)
			_m6_icon_spr = spr_m6_d_neutral;
		var _m6_icon_x = (box_defaultx + round(box_defaultw / 2) + box_borderw + 2 - (sprite_get_width(_m6_icon_spr) * 2) + 1);
		var _m6_name_text = "MEE6";
		var _m6_name_scale = 3;
		var _m6_name_x = (_m6_icon_x - (string_width(_m6_name_text) * _m6_name_scale) + 5 - 8);
		var _m6_bar_widthMax = 75;
		var _m6_bar_x = (_m6_name_x - _m6_bar_widthMax - 16 - (2 + 4) + 1);
		draw_sprite_part_ext(_m6_icon_spr, 0, 0, 1, sprite_get_width(_m6_icon_spr), 16, _m6_icon_x, (_inbetween - 16 + 2), 2, 2, c_white, gui_alpha);
		draw_text_outline_transformed(_m6_name_x, (_inbetween + 3), _m6_name_text, c_white, 2, c_black, _m6_name_scale, _m6_name_scale, 0);
        if (guicolmerge_m6 > 0.01)
            guicolmerge_m6 = lerp(guicolmerge_m6, 0, 0.1);
		else
        	guicolmerge_m6 = 0;
        draw_battle_bar($"{round(assist.curr)}%", assist.curr, assist.max, _m6_bar_x, _chara_bar_y, _m6_bar_widthMax, merge_color(global.c_m6, c_white, guicolmerge_m6), global.c_m6Darker, 1);
	}
}


// draw box
var _x1 = (box_x - (box_w / 2));
var _y1 = (box_y - (box_h / 2));
var _x2 = (box_x + (box_w / 2));
var _y2 = (box_y + (box_h / 2));
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle((_x1 - box_borderw - 2), (_y1 - box_borderw - 2), (_x2 + box_borderw + 2), (_y2 + box_borderw + 2), 0);
draw_rectangle_outline(_x1, _y1, _x2, _y2, c_black, box_borderw, c_white);

// draw enemy's hp and spare bar
if ((battle_lvl == 1.0 || battle_lvl == 2.0) && exists(global.writer_old) == false) || (battle_lvl == 2.1 && exists(global.writer_old) == 1)
{
	for (var i = 0; i < 3; i++)
	{
		if (enemy_type[i] != 0)
		{
			var _curamt = enemy_curhp[i];
			var _maxamt = enemy_maxhp[i];
			if (battle_lvl == 2.0) || (battle_lvl == 2.1)
			{
				_curamt = enemy_spare[i];
				_maxamt = 100;
			}
			var _amt = ((_curamt / _maxamt) * 100);
			var _x1 = (box_x - (box_w / 2) + 335 + 40 + 10);
			var _y1 = (box_y - (box_h / 2) + 23 + (32 * i));
			var _y2 = (_y1 + 17);
			draw_battle_bar($"{round(_amt)}%", round(_curamt), round(_maxamt), _x1, _y1, 100, level_curbarcolor[(battle_lvl - 1)], level_maxbarcolor[(battle_lvl - 1)], 1);
            for (var a = 0; a < 3; a++)
            {
                if (enemy_statArrow[i, a] != 0)
                {
                    for (var b = 0; b < abs(enemy_statArrow[i, a]); b++)
                    {
                        var _clamp = clamp(enemy_statArrow[i, a], -1, 1);
                        var _color = global.c_red;
                         if (a == 1)
                             _color = global.c_blue;
                         if (a == 2)
                             _color = global.c_pink;
                         var _sprite = spr_enemy_statArrow;
                         var _x = round(_x1 + 100 + 24 + (16 * a) - sprite_get_width(_sprite));
                         var _y = round(_y1 + ((_y2 - _y1) / 2) - (sprite_get_height(spr_enemy_statArrow) * _clamp) + (2 * (_clamp == -1)) + (8 * _clamp * b));
                         for (var o = 0; o < 2; o++)
                             draw_sprite_outline(_x, _y, _sprite, 0, 2, 2 * _clamp, 0, _color, 1, (4 - (2 * o)), ((o == 0) ? c_white : c_black));
                    }
                }
            }
        }
	}
	if (battle_group == 1)
		draw_sprite_ext(spr_battle_dummy_arrow, round(battle_lvl - 1 + (2 * (global.lang == "ptBR"))), (_x1 + 75 + (irandom(1) * global.visualeff)), (box_y + 16 + (irandom(1) * global.visualeff)), 1, 1, 0, c_white, 1);
}
if (battle_lvl == 30 && ((exists(global.writer_old) == false) || (exists(global.writer_old) == true && itemdescWriter_destroy == true)))
{
    var _arrow_x = round(box_x + (box_w / 2) - box_borderw - sprite_get_width(spr_battle_itemdescArrow) - 4);
    var _arrow_y = [0, 0];
    var _arrow_yAdd = ((box_h / 2) - box_borderw - sprite_get_height(spr_battle_itemdescArrow) - 6);
    for (var a = 0; a < 2; a++)
    {
        _arrow_y[a] = round(box_y + (_arrow_yAdd * ((a == 0) ? -1 : 1)));
        //if (a == 0 && level_pos == 0) || (a == 1 && level_pos == (level_length - 1))
            //continue;
        draw_sprite_ext(spr_battle_itemdescArrow, 0, _arrow_x, (_arrow_y[a] + (itemdescArrow_offsetY * ((a == 0) ? -1 : 1))), 2, (2 * ((a == 0) ? 1 : -1)), 0, c_white, 1);
    }
    for (var i = 0; i < global.item_length; i++)
    {
        var _item_x = (_arrow_x - 1);
        var _item_yGap = 15;
        var _item_y = round(_arrow_y[0] + _item_yGap + (i * ((_arrow_y[1] - _arrow_y[0] - (_item_yGap * 2)) / (global.item_length - 1))));
        draw_sprite_ext(spr_battle_itemdescArrow, 1, _item_x, _item_y, 2, 2, 0, ((i < level_length) ? c_white : c_dkgray), 1);
        if (i == level_pos && itemdescWriter_destroy == false)
        {
            heart.x = _item_x;
            heart.y = _item_y;
        }
    }
    if (itemdescArrow_offsetDelay > 0)
        itemdescArrow_offsetDelay -= 1;
    else
    {
        itemdescArrow_offsetY += 2;
        if (itemdescArrow_offsetY >= 6)
            itemdescArrow_offsetY = 0;
        itemdescArrow_offsetDelay = itemdescArrow_offsetDelay_max;
    }
}

draw_set_alpha(1);