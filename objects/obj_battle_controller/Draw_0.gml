	
// deltarune style background
/*
if (battle_group == -2)
{
	var _yy = ((room_height / 2) + 205);
	
	// everything
	if (battle_group == -2)
	{	
		// bg
		draw_set_alpha(1);
		draw_set_color(#1D141E);
		draw_rectangle(-20, -20, (room_width + 20), (room_height + 20), 0);
		
		// rails
		for (var i = 0; i < 3; i++)
		{
			draw_sprite_ext(spr_battle_spamtontest_rail, 0, spamtontest_rail_x[i], (_yy - 130), 2, 2, 0, c_white, 1);
			draw_sprite_ext(spr_battle_spamtontest_rail, 0, spamtontest_rail_x[i], (_yy - 220), 2, 2, 0, c_white, 1);
			draw_sprite_ext(spr_battle_spamtontest_rail, 0, spamtontest_rail_x[i], (_yy - 310), 2, 2, 0, c_white, 1);
		
			var _spd = 9;
			spamtontest_rail_x[i] -= _spd;
			if (spamtontest_rail_x[i] < -640)
				spamtontest_rail_x[i] = (640 - _spd);
		}
		
		// cart
		spamtontest_cart_siner += 0.1;
		spamtontest_cart_x += (sin(spamtontest_cart_siner / 2) * 1.25);
		draw_sprite_ext(spr_battle_spamtontest_cart, 0, spamtontest_cart_x, (_yy - 234), 2, 2, 0, c_white, 1);
		
		// carlinhos
		draw_sprite_ext(spr_carlos, 0, (spamtontest_cart_x - 15), (_yy - 253), 2, 2, 0, c_white, 1);
		
		// spamton neo
		draw_sprite_ext(spr_battle_spamtontest, 0, (room_width / 1.3), (_yy - 250), 2, 2, 0, c_white, 1);
	}
	
	// bg trans
	draw_set_color(c_black);
	draw_rectangle(-20, (_yy - 35), (room_width + 20), (room_height + 20), 0);
	draw_sprite_ext(spr_battle_deltabgtrans, 0, 0, (_yy - 25), 160, 2, 0, c_white, 1);
}
*/
var _alpha = 1;
if (createbubble == 1) || (startattack == 1)
	_alpha = 0.25;
button_alpha = lerp(button_alpha, _alpha, 0.2);
gui_alpha = lerp(gui_alpha, _alpha, 0.2);

// draw buttons
for (var i = 0; i < button_length; i++)
{
	var _index = 0;
	if (i == button_pos && button_select == 1)
		_index = 1;
	
	draw_sprite_ext(button_spr[i], _index, button_x[i], button_y[i], 2, 2, 0, button_color[_index], button_alpha);
}

// draw chara info
var _inbetween = (box_defaulty + round(box_defaulth / 2) + box_borderw);
_inbetween = (button_y[0] - round((button_y[0] - _inbetween) / 2));
draw_set_alpha(gui_alpha);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_font(fnt_mars_18);
var _chara_icon_spr = spr_chara_d;
var _chara_icon_x = (box_defaultx - round(box_defaultw / 2) - box_borderw - 2);
var _chara_name_text = global.chara_name;
var _chara_name_x = (_chara_icon_x + (sprite_get_width(_chara_icon_spr) * 2) - 2 + 8);
var _chara_bar_x = (_chara_name_x + string_width(_chara_name_text) + 1 + 16);
var _chara_bar_y = (box_y + round(box_h / 2) + box_borderw + 11);
draw_sprite_part_ext(_chara_icon_spr, 0, 0, 1, sprite_get_width(_chara_icon_spr), 16, _chara_icon_x, (_inbetween - 16), 2, 2, c_white, gui_alpha);
if (global.chara_murder >= 2)
	draw_sprite_part_ext(spr_chara_genoshadow, DOWN, 0, 1, sprite_get_width(_chara_icon_spr), 16, _chara_icon_x, (_inbetween - 16), 2, 2, c_white, gui_alpha);
draw_text_outline(_chara_name_x, (_inbetween + 4), _chara_name_text, c_white, 2, c_black);
draw_battle_bar(((global.chara_curhp >= 10) ? "" : "0") + string(global.chara_curhp) + " / "  + string(global.chara_maxhp), global.chara_curhp, global.chara_maxhp, _chara_bar_x, _chara_bar_y, (100 + (5 * (global.chara_lvl - 1))), /*#FFDC31*/ #F29948, #DD2929, 1);
draw_set_alpha(gui_alpha);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_font(fnt_mars_18);
var _m6_icon_spr = spr_m6_d;
var _m6_icon_x = (box_defaultx + round(box_defaultw / 2) + box_borderw + 2 - (sprite_get_width(_m6_icon_spr) * 2) + 1);
var _m6_name_text = "MEE6";
var _m6_name_x = (_m6_icon_x - string_width(_m6_name_text) + 5 - 8);
var _m6_bar_widthMax = 75;
var _m6_bar_x = (_m6_name_x - _m6_bar_widthMax - 16 - (2 + 4) - 1);
draw_sprite_part_ext(_m6_icon_spr, 0, 0, 1, sprite_get_width(_m6_icon_spr), 16, _m6_icon_x, (_inbetween - 16 + 2), 2, 2, c_white, gui_alpha);
draw_text_outline(_m6_name_x, (_inbetween + 4), _m6_name_text, c_white, 2, c_black);
draw_battle_bar($"{round(assist.curr)}%", assist.curr, assist.max, _m6_bar_x, _chara_bar_y, _m6_bar_widthMax, #4986B7, c_black, 1);


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
if (battle_lvl == 1.0) || (battle_lvl == 2.0) || (battle_lvl == 2.1 && exists(global.writer_old) == 1)
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
			
			var _thislvl = (battle_lvl - 1);
			
			var _x1 = (box_x - (box_w / 2) + 335 + 40);
			
			var _y1 = (box_y - (box_h / 2) + 23 + (32 * i));
			var _y2 = (_y1 + 17);
			
			var _outw1 = 4;
			var _outw2 = (_outw1 / 2);
			
			draw_set_color(c_white);
			draw_rectangle((_x1 - _outw1), (_y1 - _outw1), (_x1 + 100 + _outw1), (_y2 + _outw1), 0);
			draw_rectangle_outline(_x1, _y1, (_x1 + 100), _y2, level_maxbarcolor[_thislvl], _outw2, c_black);
		
			if (_amt > 0) // current amount
			{
				draw_set_color(level_curbarcolor[_thislvl]);
				draw_rectangle(_x1, _y1, (_x1 + _amt), _y2, 0);
			}

			draw_set_font(fnt_mars_12); // amount text
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_text_outline((_x1 + 50), (_y1 + 11), string(round(_amt)) + "%", c_white, 2, c_black);
		}
	}
}

draw_set_alpha(1);