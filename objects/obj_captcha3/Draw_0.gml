
draw_set_alpha(1);

// draw lever and its wires
for (var i = 0; i < 2; i++)
{
	var _flag = global.flag[(50 + i)];
	
	// wire
	var _spr = spr_overworld_captcha_leverwire_off;
	if (_flag == 1)
		_spr = spr_overworld_captcha_leverwire_on;
	
	var _scale = 1;
	if (i == 1)
		_scale = -1;
		
	draw_sprite_ext(_spr, leverwire_index, (108 + (104 * i)), 1270, _scale, 1, 0, c_white, 1);
	
	// lever
	draw_sprite_ext(spr_overworld_lever, _flag, (100 * (i + 1)), 1260, 1, 1, 0, c_white, 1);
}
leverwire_index += (sprite_get_speed(spr_overworld_captcha_leverwire_on) / 60);

// draw puzzle 1
draw_sprite_ext(spr_overworld_captcha_screen2, 0, 80, 1040, 1, 1, 0, c_white, 1);


draw_set_font(fnt_main_spaced);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var _x = (80 + (sprite_get_width(spr_overworld_captcha_screen2) / 2));
var _y = (1040 + (sprite_get_height(spr_overworld_captcha_screen2) / 2) - 1);
draw_text_color(_x, _y, puzzle_trtword, c_white, c_white, c_grey, c_grey, 1);

var _color0 = global.c_dump;
var _color1 = #1E994E;
if (string_starts_with(puzzle_trtword, puzzle_curword) == 0)
{
	_color0 = #FF1947;
	_color1 = #CC1357;
}
draw_set_halign(fa_left);
draw_text_color((_x - (string_width(puzzle_trtword) / 2)), _y, puzzle_curword, _color0, _color0, _color1, _color1, 1);

for (var h = 0; h < 4; h++)
{
	for (var v = 0; v < 4; v++)
	{
		draw_set_font(fnt_main)
		draw_set_color(#161419);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text((button[h, v].x + 10), (button[h, v].y + 7 + (3 * button_pressed[h, v])), button_letter[h, v]);
	}
}

// draw puzzle 3
for (var h = 0; h < 3; h++)
{
	for (var v = 0; v < 3; v++)
	{
		var _color = #7E8899;
		if (plate_color[h, v] == 1)
			_color = global.c_dump;
		draw_set_color(_color);
		draw_rectangle(plate_x[h, v], plate_y[h, v], (plate_x[h, v] + 18), (plate_y[h, v] + 18), 0);	
	}	
}

// draw room covers
draw_set_color(c_black);

var _x1 = 0;
var _y1 = 0;
var _x2 = room_width;
var _y2 = 1229;
if (stage >= 1)
	_y2 = 929;
if (stage >= 3)
	_y2 = 629;
if (stage >= 5)
	_y2 = 329;
if (stage >= 7)
	_y2 = 0;
draw_rectangle(_x1, _y1, _x2, _y2, 0); // main cover

_x1 = 140;
_x2 = (_x1 + 40);
_y2 = 1299;
if (stage >= 1)
	_y2 = 999;
if (stage >= 3)
	_y2 = 699;
if (stage >= 5)
	_y2 = 399;
if (stage >= 7)
	_y2 = 0;
draw_rectangle(_x1, _y1, _x2, _y2, 0); // corridor cover

// countdown
/*
if (stage >= 1)
{
	var _x = obj_GAME_CONTROLLER.cam_x;
	var _y = obj_GAME_CONTROLLER.cam_y;
	draw_set_alpha(timer_alpha);
	
	draw_sprite_stretched(spr_writer_textbox, 0, (_x + 255), (_y + 5), 61, 38);
	
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	timer_color = lerp(timer_color, 0, 0.05);
	draw_set_color(make_color_rgb(255, timer_color, 0));
	draw_set_font(fnt_main_big);
	var _string0 = timer[0];
	if (timer[0] < 10)
		_string0 = "0" + string(timer[0]);
	draw_text((_x + 264), (_y + 40), _string0);
	
	draw_set_font(fnt_main);
	var _string1 = timer[1];
	if (timer[1] < 10)
		_string1 = "0" + string(timer[1]);
	draw_text((_x + 264 + string_width(_string0) + 14), (_y + 36), "." + string(_string1));
}
*/

draw_set_alpha(1);

















