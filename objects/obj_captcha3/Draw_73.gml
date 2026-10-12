// Timer
timer.alpha = lerp(timer.alpha, timer.active, ((global.visualeff == true) ? 0.15 : 1));
if (timer.fog.active == true && timer.seconds <= timer.fog.secondsMin && chara_murder() < 1 && global.visualeff == true)
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
timer.color_green = lerp(timer.color_green, 0, ((global.visualeff == true) ? 0.05 : 1));
timer.scale = lerp(timer.scale, 1, ((global.visualeff == true) ? 0.1 : 1));
draw_set_color(merge_color(make_color_rgb(255, timer.color_green, 0), c_white, 0.2));
if (chara_murder() >= 1)
	draw_set_color(c_white);
draw_set_alpha(timer.alpha);


// Timer
draw_set_font(fnt_main_big);
var _timer_seconds_text = $"{timer.seconds}";
var _timer_seconds_width = string_width(_timer_seconds_text);
var _timer_seconds_height = string_height(_timer_seconds_text);
draw_set_font(fnt_main);
var _timer_milliseconds_text = $".{((timer.milliseconds >= 10) ? "" : "0")}{timer.milliseconds}";
var _timer_milliseconds_width = string_width(_timer_milliseconds_text);
var _timer_milliseconds_height = string_height(_timer_milliseconds_text);
var _timer_width = (_timer_seconds_width + _timer_milliseconds_width);
// Panel
var _panel_x = (game.cam_x + 4);
var _panel_y = (game.cam_y + 4);
var _panel_paddingX = 12;
var _panel_paddingY = 4;
var _panel_width = (_panel_paddingX + _timer_width + _panel_paddingX);
var _panel_height = (_panel_paddingY + _timer_seconds_height + _panel_paddingY);
draw_sprite_stretched(spr_writer_textbox, 0, _panel_x, _panel_y, _panel_width, _panel_height);
// Timer
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var _timer_seconds_x = (_panel_x + _panel_paddingX + (_timer_seconds_width / 2));
var _timer_seconds_y = (_panel_y + (_panel_height / 2));
draw_set_font(fnt_main_big);
draw_text_transformed(_timer_seconds_x, _timer_seconds_y, _timer_seconds_text, timer.scale, timer.scale, 0);
var _timer_milliseconds_x = (_panel_x + _panel_width - _panel_paddingX - (_timer_milliseconds_width / 2))
var _timer_milliseconds_y = (_panel_y + _panel_height - _panel_paddingY - (_timer_seconds_height / 2) + (_timer_milliseconds_height / 4));
draw_set_font(fnt_main);
draw_text_transformed(_timer_milliseconds_x, _timer_milliseconds_y, _timer_milliseconds_text, timer.scale, timer.scale, 0);
/*
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

draw_text_transformed((_panel_x + (_panel_width / 2) - (_timer_width / 2) + _timer_widthSeconds), (_panel_y + (_panel_height / 2)), );
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);

draw_text_transformed((_panel_x + (_panel_width / 2) - (_timer_width / 2) + _timer_widthSeconds), (_panel_y + (_panel_height / 2) + floor(_timer_heightSeconds / 3)), , timer.scale, timer.scale, 0);
*/
draw_set_alpha(1);