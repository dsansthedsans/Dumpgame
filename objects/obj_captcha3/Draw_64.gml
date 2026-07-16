// Timer
timer.alpha = lerp(timer.alpha, timer.active, 0.15);
if (timer.fog.active == true && timer.seconds <= timer.fog.secondsMin)
{
	// Fog
	timer.fog.alpha = clamp((timer.fog.alpha + (timer.fog.alpha_max / timer.fog.alpha_time)), 0, timer.fog.alpha_max);
	var _fog_alpha = timer.fog.alpha;
	if (timer.fog.alpha >= timer.fog.alpha_max)
	{
		timer.fog.alpha_siner += 0.75;
		var _sin = ((dsin(timer.fog.alpha_siner * 5) * 0.5) /*+ 0.5*/);
		_fog_alpha += (_sin / 15);
	}
	draw_set_alpha(_fog_alpha * timer.alpha);
	draw_rectangle_colour(-20, -20, (20 + room_width + 20), (20 + room_height + 20), timer.fog.color, timer.fog.color, timer.fog.color, timer.fog.color, false);
}
timer.color_green = lerp(timer.color_green, 0, 0.05);
timer.scale = lerp(timer.scale, 1, 0.1);
draw_set_color(merge_color(make_color_rgb(255, timer.color_green, 0), c_white, 0.2));
draw_set_alpha(timer.alpha);
draw_set_font(fnt_main_big);
var _timer_widthSeconds = (string_width("00") * 1);
var _timer_heightSeconds = (string_height("00") * 1);
draw_set_font(fnt_main);
var _timer_widthMilliseconds = (string_width(".00") * 1);
var _timer_widthTotal = (_timer_widthSeconds + _timer_widthMilliseconds);
// Panel
var _panel_x = 4;
var _panel_y = 4;
var _panel_padding = 4;
var _panel_width = 72;
var _panel_height = (_panel_padding + _timer_heightSeconds + _panel_padding);
draw_sprite_stretched(spr_writer_textbox, 0, _panel_x, _panel_y, _panel_width, _panel_height);
// Timer
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
draw_set_font(fnt_main_big);
draw_text_transformed((_panel_x + (_panel_width / 2) - (_timer_widthTotal / 2) + _timer_widthSeconds), (_panel_y + (_panel_height / 2)), $"{((timer.seconds >= 10) ? "" : "0")}{timer.seconds}", timer.scale, timer.scale, 0);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_set_font(fnt_main);
draw_text_transformed((_panel_x + (_panel_width / 2) - (_timer_widthTotal / 2) + _timer_widthSeconds), (_panel_y + (_panel_height / 2) + floor(_timer_heightSeconds / 3)), $".{((timer.milliseconds >= 10) ? "" : "0")}{timer.milliseconds}", timer.scale, timer.scale, 0);



draw_set_alpha(1);