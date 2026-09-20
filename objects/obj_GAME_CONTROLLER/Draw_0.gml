
// debug
if (global.indebug == 1)
{
	var _cx = cam_x;
	var _cy = cam_y;
	var _cw = 320;
	var _ch = 240;
	draw_set_alpha(1);
	draw_set_font(fnt_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_right);
	draw_text_outline((_cx + _cw - 5), (_cy + 3), "DEBUG", c_orange, 1, c_black);
	if (global.debug_hud == true)
	{
		var _str_chara = 
		"savefile_selected:  " + string(global.savefile_selected)
		+ "\nchara_run:  " + string(global.chara_run)
		+ "\nchara_move:  " + string(global.chara_move)
		+ "\nchara_interact:  " + string(global.chara_interact)
		+ "\nchara_cutscene:  " + string(global.chara_cutscene)
		+ "\nchara_open_menu:  " + string(global.chara_open_menu)
		+ "\nchara_pause_game:  " + string(global.chara_pause_game)
		+ "\nchara_camera_move:  " + string(global.chara_camera_move)
		+ "\nchara_room:  " + string(room_name(global.chara_room));
		if (exists(obj_chara) == 1)
		{
			_str_chara +=
			"\n\nchara_steps:  " + string(global.chara_steps)
			+ "\nmaxsteps:  " + string(obj_chara.maxsteps)
			+ "\nchara_encounter:  " + string(global.chara_encounter);
		}
		draw_set_alpha(0.75);
		draw_text_outline_transformed((_cx + _cw - 5), (_cy + 3 + string_height("ABC") + 2), _str_chara, c_orange, 0.5, c_black, 0.5, 0.5, 0);
		
		var _str_flag_0 = "";
		var _str_flag_1 = "";
		var _str_flag_2 = "";
		var _str_flag_3 = "";
		for (var f = 0; f < array_length(global.flag); f++)
		{
			if (f <= 28)
				_str_flag_0 += $"flag[{f}]:  {global.flag[f]}\n";
			else if (f >= 29 && f <= 57)
				_str_flag_1 += $"flag[{f}]:  {global.flag[f]}\n";
			else if (f >= 58 && f <= 86)
				_str_flag_2 += $"flag[{f}]:  {global.flag[f]}\n";
			else if (f >= 87 && f <= array_length(global.flag))
				_str_flag_3 += $"flag[{f}]:  {global.flag[f]}\n";
		}
		draw_set_alpha(1);
		draw_set_font(fnt_main);
		draw_set_halign(fa_left);
		draw_text_outline_transformed((_cx + 5), (_cy + 3), _str_flag_0, c_orange, 0.5, c_black, 0.5, 0.5, 0);
		draw_text_outline_transformed((_cx + 5 + (string_width(_str_flag_0) / 2) + 5), (_cy + 3), _str_flag_1, c_orange, 0.5, c_black, 0.5, 0.5, 0);
		draw_text_outline_transformed((_cx + 5 + (string_width(_str_flag_0) / 2) + 5 + (string_width(_str_flag_1) / 2) + 5), (_cy + 3), _str_flag_2, c_orange, 0.5, c_black, 0.5, 0.5, 0);
		draw_text_outline_transformed((_cx + 5 + (string_width(_str_flag_0) / 2) + 5 + (string_width(_str_flag_1) / 2) + 5 + (string_width(_str_flag_2) / 2) + 5), (_cy + 3), _str_flag_3, c_orange, 0.5, c_black, 0.5, 0.5, 0);
	}
}

draw_set_alpha(1);
