depth = 0;
image_alpha = 0;
chara = obj_chara;
m6 = obj_party;
stage = 0;
// Levers
for (var l = 0; l < 2; l++)
{
	levers[l] =
	{
		active : false,
		distance : 30,
		object : marker((90 + (120 * l)), 1180, spr_overworld_lever, 1, 1, 1, 0, 0, 0, c_white, 0),
	}
	levers[l].object.depth = -levers[l].object.bbox_bottom;
}
// Doors
doors_length = 4;
for (var d = 0; d < doors_length; d++)
{
	doors[d] =
	{
		active : false,
		object : create(140, 0, obj_solid_parent),
	}
	doors[d].object.index = d;
	with (doors[d].object)
	{
		switch (index)
		{
			case 0:
			y = 1145;
			break;
			case 1:
			y = 845;
			break;
			case 2:
			y = 545;
			break;
			case 3:
			y = 245;
			break;
		}
		visible = true;
		depth = -y;
		sprite_index = spr_overworld_bigdoor_closed;
		image_alpha = 1;
	}
}
// Gate
gate =
{
	active : false,
	sprite : spr_overworld_bottomgate,
	x : 285,
	y : 220,
	width : 0,
	widthMax : 41,
	widthTime : 30,
	object : undefined,
}
// Timer
timer =
{
	active : false,
	seconds : 0,
	secondsTotal : 60,
	milliseconds : 0,
	millisecondsTotal : 60,
	color_green : 0,
	alpha : 0,
	scale : 1,
	// Fog
	fog :
	{
		active : true,
		secondsMin : 30,
		color : c_red,
		alpha : 0,
		alpha_max : 0.2,
		alpha_time : (60 * 5),
		alpha_siner : 0,
	},
}
// Buttons
buttons_word = ((global.flag[55] == "") ? string_upper(choose("Misunderstanding", "Incomprehensible", "Responsibilities")) : global.flag[55]);
global.flag[55] = buttons_word;
buttons_wordCurr = "";
buttons_length = 16;
for (var v = 0; v < sqrt(buttons_length); v++)
{
	for (var h = 0; h < sqrt(buttons_length); h++)
	{
		buttons[h, v] =
		{
			active : false,
			letter : "",
			object : marker((100 + (20 * h)), (995 + (15 * v)), spr_overworld_captcha_button, 1, 1, 1, 0, 0, 0, c_white, (50 - (v * (h + 1)))),
		}
	}
}
buttons_path = ((global.flag[56] == -1) ? choose(0, 1) : global.flag[56])
global.flag[56] = buttons_path;
switch (buttons_path)
{
	case 0:
	/* MISUNDERSTANDING
	M I S U | 01 02 03 04
	R E D N | 08 07 06 05
	S T A N | 09 10 11 12
	G N I D | 16 15 14 13
	*/
	for (var v = 0; v < sqrt(buttons_length); v++)
	{
		for (var h = 0; h < sqrt(buttons_length); h++)
		{
			buttons[h, v].letter = string_char_at(buttons_word, (h + (4 * v) + 1));
			if (v % 2 == 1)
				buttons[h, v].letter = string_char_at(buttons_word, (1 + (4 * v) + 3 - h));
		}
	}
	break;
	case 1:
	/* MISUNDERSTANDING
	E D N U
	R N I S
	S G D I
	T A N M
	*/
	// MISU
	buttons[3, 3].letter = string_char_at(buttons_word, 1);
	buttons[3, 2].letter = string_char_at(buttons_word, 2);
	buttons[3, 1].letter = string_char_at(buttons_word, 3);
	buttons[3, 0].letter = string_char_at(buttons_word, 4);
	// NDE
	buttons[2, 0].letter = string_char_at(buttons_word, 5);
	buttons[1, 0].letter = string_char_at(buttons_word, 6);
	buttons[0, 0].letter = string_char_at(buttons_word, 7);
	// RST
	buttons[0, 1].letter = string_char_at(buttons_word, 8);
	buttons[0, 2].letter = string_char_at(buttons_word, 9);
	buttons[0, 3].letter = string_char_at(buttons_word, 10);
	// AN
	buttons[1, 3].letter = string_char_at(buttons_word, 11);
	buttons[2, 3].letter = string_char_at(buttons_word, 12);
	// DI
	buttons[2, 2].letter = string_char_at(buttons_word, 13);
	buttons[2, 1].letter = string_char_at(buttons_word, 14);
	// NG
	buttons[1, 1].letter = string_char_at(buttons_word, 15);
	buttons[1, 2].letter = string_char_at(buttons_word, 16);
	break;
}
// Reset button
buttonsReset =
{
	active : false,
	object : marker(200, 1020, spr_overworld_captcha_button, 1, 1, 1, 0, 2, 0, c_white, 0),
}
// Moveable
moveable =
{
	startX : 80,
	startY : 760,
	endX : 220,
	endY : 660,
	object : create_moveable(0, 0, false, -1, -1),
}
// Plates
plates_length = 9;
for (var v = 0; v < sqrt(plates_length); v++)
{
	for (var h = 0; h < sqrt(plates_length); h++)
	{
		plates[h, v] =
		{
			active : false,
			activated : false,
			object : marker((90 + (40 * h)), (370 + (40 * v)), spr_overworld_captcha_plate, 1, 1, 1, 0, 0, 0, c_white, -100),
			colors : [(#433F5E), global.c_dump],
		}
	}
}
plates_activeAll = false;
platesReset =
{
	active : false,
	object : marker(210, 410, spr_overworld_captcha_button, 1, 1, 1, 0, 2, 0, c_white, 0),
}
	

if (global.flag[51] == true)
{
	buttons_wordCurr = buttons_word;
	if (global.flag[54] == true)
	{
		moveable.object.x = moveable.endX;
		moveable.object.y = moveable.endY;
		moveable.object.depth = -moveable.object.bbox_bottom;
		if (global.flag[50] == true)
		{
			stage = 16;
			for (var l = 0; l < 2; l++)
				levers[l].active = true;
			for (var d = 0; d < doors_length; d++)
				doors[d].active = true;
			plates_activeAll = true;
		}
	}
}


skip = false;
if (skip == true)
	stage = 1;