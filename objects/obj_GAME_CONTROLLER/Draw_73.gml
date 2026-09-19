if (chara_murder() >= 1)
{
	var _murder_alpha = 0;
	for (var a = 0; a < 3; a++)
	{
		if (a == 0 && chara_murder() >= 1) || (a == 1 && chara_murder() >= 2) || (a == 2 && chara_murder() >= 3)
			_murder_alpha += (0.05 * 0.75);
	}
	murder_alpha = lerp(murder_alpha, _murder_alpha, 0.05);
	draw_set_alpha(murder_alpha);
	draw_set_color(merge_color(c_white, c_red, 0.5));
	draw_rectangle(-20, -20, (20 + room_width + 20), (20 + room_height + 20), false);
}
if (active == 1)
{
	var _hud_string = ["", ""];
	var _hud_scale = 1;
	if (global.inmenu == 1) || (global.inbattle == 1) || (global.ingameover == 1)
		_hud_scale = 2;
	// stopwatch
	var _stopwatch = global.chara_stopwatch;
	if (global.ingame == 1 && global.flag[0] >= 0.5 && exists(obj_chara_pause) == 0) || (global.inbattle == 1) || (global.ingameover == 1)
	{
		_stopwatch.time[0] += 1;	
		if (_stopwatch.time[0] >= 60)
		{
			_stopwatch.time[0] = 0;
			_stopwatch.time[1] += 1;	
		}
		if (_stopwatch.time[1] >= 60)
		{
			_stopwatch.time[1] = 0;
			_stopwatch.time[2] += 1;
		}
		if (_stopwatch.time[2] >= 60)
		{
			_stopwatch.time[2] = 0;
			_stopwatch.time[3] += 1;
		}
	}
	if (global.showsw == true)
	{
		var _stopwatch_zeros = ["", "", ""];
		if (_stopwatch.time[0] < 10)
			_stopwatch_zeros[0] = "0";	
		else if (_stopwatch.time[0] >= 10)
			_stopwatch_zeros[0] = "";	
		if (_stopwatch.time[1] < 10)
			_stopwatch_zeros[1] = "0";	
		else 
			_stopwatch_zeros[1] = "";	
		if (_stopwatch.time[2] < 10)
			_stopwatch_zeros[2] = "0";
		else 
			_stopwatch_zeros[2] = "";
		_hud_string[0] = $"{_stopwatch.time[3]}:{_stopwatch_zeros[2]}{_stopwatch.time[2]}:{_stopwatch_zeros[1]}{_stopwatch.time[1]}.{_stopwatch_zeros[0]}{_stopwatch.time[0]}";
	}
	// fps
	if (global.showfps == 1)
		_hud_string[1] = $"{fps} FPS";
	// stopwatch & fps
	draw_set_font(global.fnt_mars);
	draw_set_alpha(1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	for (var h = 0; h < 2; h++)
		draw_text_outline_transformed((cam_x + (4 * _hud_scale)), (cam_y + ((array_get([4, (4 + ((string_height("ABC") + 2) * global.showsw))], h)) * _hud_scale)), _hud_string[h], c_ltgray, _hud_scale, c_black, _hud_scale, _hud_scale, 0);
}
draw_set_alpha(1);