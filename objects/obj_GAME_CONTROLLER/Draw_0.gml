
// hud
if (active == 1)
{
	var _cx = obj_GAME_CONTROLLER.cam_x;
	var _cy = obj_GAME_CONTROLLER.cam_y;
	var _scale = 1;
	if (global.inmenu == 1) || (global.inbattle == 1) || (global.ingameover == 1)
		_scale = 2;
	
	// pegar strings
	hud_string[0] = "";
	hud_string[1] = "";
	if (global.showsw == 1)
	{
		// adicionar tempo
		if (global.ingame == 1 && global.flag[0] == 1 && exists(obj_chara_pause) == 0) || (global.inbattle == 1) || (global.ingameover == 1)
		{
			sw_time[0] += 1;	
			if (sw_time[0] >= 60)
			{
				sw_time[0] = 0;
				sw_time[1] += 1;	
			}
			if (sw_time[1] >= 60)
			{
				sw_time[1] = 0;
				sw_time[2] += 1;
			}
			if (sw_time[2] >= 60)
			{
				sw_time[2] = 0;
				sw_time[3] += 1;
			}
		}
	
		// adicionar zeros
		if (sw_time[0] < 10)
			sw_zero[0] = "0";	
		else if (sw_time[0] >= 10)
			sw_zero[0] = "";	
		if (sw_time[1] < 10)
			sw_zero[1] = "0";	
		else 
			sw_zero[1] = "";	
		if (sw_time[2] < 10)
			sw_zero[2] = "0";	
		else 
			sw_zero[2] = "";	
	
		// string final
		hud_string[0] = (string(sw_time[3]) + ":" + string(sw_zero[2]) + string(sw_time[2]) + ":" + string(sw_zero[1]) + string(sw_time[1]) + "." + string(sw_zero[0]) + string(sw_time[0]));
	}
	if (global.showfps == 1)
		hud_string[1] = string(fps) + " FPS";
	
	// pegar localização
	draw_set_font(fnt_mars_6);
	hud_y[0] = 2;
	hud_y[1] = (2 + ((string_height("ABC") - 1) * global.showsw));
	
	draw_set_alpha(1);
	draw_set_color(c_ltgray);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	for (var i = 0; i < 2; i++)
		draw_text_outline_transformed((_cx + 3 * _scale), (_cy + hud_y[i] * _scale), hud_string[i], c_ltgray, _scale, c_black, _scale, _scale, 0);
}

// debug
if (global.indebug == 1)
{
	var _cx = cam_x;
	var _cy = cam_y;
	var _cw = 320;
	var _ch = 240;
	// desenhar título
	draw_set_alpha(1);
	draw_set_font(fnt_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_right);
	draw_text_outline((_cx + _cw - 5), (_cy + 3), "IN DEBUG", c_orange, 1, c_black);
	// desenhar informações
	if (exists(obj_chara) == 1)
	{
		var _str_chara = 
		"savefile_selected:  " + string(global.savefile_selected)
		+ "\nchara_run:  " + string(global.chara_run)
		+ "\nchara_move:  " + string(global.chara_move)
		+ "\nchara_interact:  " + string(global.chara_interact)
		+ "\nchara_cutscene:  " + string(global.chara_cutscene)
		+ "\nchara_open_menu:  " + string(global.chara_open_menu)
		+ "\nchara_pause_game:  " + string(global.chara_pause_game)
		+ "\nchara_camera_move:  " + string(global.chara_camera_move);
		var _str_encounter = 
		"chara_steps:  " + string(global.chara_steps)
		+ "\nmaxsteps:  " + string(obj_chara.maxsteps)
		+ "\nchara_encounter:  " + string(global.chara_encounter);
		var _str = string(_str_chara) + "\n\n" + string(_str_encounter);
		draw_set_alpha(0.75);
		draw_text_outline_transformed((_cx + _cw - 5), (_cy + 3 + string_height("ABC") + 2), _str, c_orange, 0.5, c_black, 0.5, 0.5, 0);
	}
}

draw_set_alpha(1);
