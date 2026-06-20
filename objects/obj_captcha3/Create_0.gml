
depth = 0;
image_alpha = 0;
stage = 0;
delay = 0;
timer[0] = 60;
timer[1] = 0;
timer_color = 0;
timer_alpha = 1;
death_stage = 0;
death_delay = 0;

puzzle_trtword = irandom_range(0, 2);
if (puzzle_trtword == 0)
	puzzle_trtword = "constructiveness";
else if (puzzle_trtword == 1)
	puzzle_trtword = "characterization";
else
	puzzle_trtword = "conversationally";
if (global.flag[55] == "")
	global.flag[55] = puzzle_trtword;
else
	puzzle_trtword = global.flag[55];
puzzle_trtword = string_upper(puzzle_trtword);
puzzle_curword = "";
leverwire_index = 0;

// create doors
door_x = 140;
door_y[0] = 1220;
door_y[1] = 920;
door_y[2] = 620;
door_length = 4;
for (var i = 0; i < door_length; i++)
{
	create(140, (1220 - (300 * i)), obj_overworld_solid);
	thisobj.sprite_index = spr_overworld_bigdoor_closed;
	thisobj.image_speed = 0;
	thisobj.depth = -thisobj.bbox_bottom;
	door[i] = thisobj;
}

// create lever interact blocks
for (var i = 0; i < 2; i++)
{
	create((100 * (i + 1)), 1280, obj_interact_block);
	thisobj.result = 5;
}

// create buttons
for (var h = 0; h < 4; h++)
{
	for (var v = 0; v < 4; v++)
	{
		create((100 + (20 * h)), (1075  + (15 * v)), obj_marker);
		thisobj.sprite_index = spr_overworld_captcha_button;
		thisobj.image_speed = 0;
		thisobj.depth = (50 - (1 * v));
		button[h, v] = thisobj; // coluna, linha
		
		button_pressed[h, v] = 0;
	}
}

create(200, 1100, obj_marker);
thisobj.sprite_index = spr_overworld_captcha_button;
thisobj.image_speed = 0;
thisobj.image_index = 2;
thisobj.depth = (-thisobj.bbox_bottom + 20);
thisobj.pressed = 0;
thisobj.canpress = 1;
button_reset = thisobj;

function c3_l(_char)
{
	return string_char_at(puzzle_trtword, argument0);
}
button_way = irandom_range(0, 1);
if (global.flag[56] == -1)
	global.flag[56] = button_way;
else
	button_way = global.flag[56];
if (button_way == 0)
{
	button_letter[0, 0] = c3_l(1);
	button_letter[1, 0] = c3_l(2);
	button_letter[2, 0] = c3_l(3);
	button_letter[3, 0] = c3_l(4);
	
	button_letter[0, 1] = c3_l(8);
	button_letter[1, 1] = c3_l(7);
	button_letter[2, 1] = c3_l(6);
	button_letter[3, 1] = c3_l(5);
	
	button_letter[0, 2] = c3_l(9);
	button_letter[1, 2] = c3_l(10);
	button_letter[2, 2] = c3_l(11);
	button_letter[3, 2] = c3_l(12);
	
	button_letter[0, 3] = c3_l(16);
	button_letter[1, 3] = c3_l(15);
	button_letter[2, 3] = c3_l(14);
	button_letter[3, 3] = c3_l(13);
}
else
{
	button_letter[3, 3] = c3_l(1);
	button_letter[3, 2] = c3_l(2);
	button_letter[3, 1] = c3_l(3);
	button_letter[3, 0] = c3_l(4);
	
	button_letter[2, 0] = c3_l(5);
	button_letter[1, 0] = c3_l(6);
	button_letter[0, 0] = c3_l(7);
	
	button_letter[0, 1] = c3_l(8);
	button_letter[0, 2] = c3_l(9);
	button_letter[0, 3] = c3_l(10);
	
	button_letter[1, 3] = c3_l(11);
	button_letter[2, 3] = c3_l(12);
	
	button_letter[2, 2] = c3_l(13);
	button_letter[2, 1] = c3_l(14);
	
	button_letter[1, 1] = c3_l(15);
	button_letter[1, 2] = c3_l(16);
}

// create moveable
var _pos = irandom_range(0, 3);
var _x = 80;
var _y = 840;
if (_pos == 1)
	_x = 120;
else if (_pos == 2)
	_x = 140;
else if (_pos == 3)
{
	_x = 160;
	_y = 740;
}
create(_x, _y, obj_moveable_block);
thisobj.canmove = 1;
moveable = thisobj;

// create pressure plates
for (var h = 0; h < 3; h++)
{
	for (var v = 0; v < 3; v++)
	{
		plate_x[h, v] = (90 + ((20 * 2) * h));
		plate_y[h, v] = (450 + ((20 * 2) * v));
		create(plate_x[h, v], plate_y[h, v], obj_marker);
		thisobj.sprite_index = spr_overworld_captcha_plate;
		thisobj.depth = -100;
		thisobj.pressed = 0;
		plate[h, v] = thisobj;
		plate_color[h, v] = 0;
	}
}
function c3_p(_h, _v)
{
	plate_color[argument0, argument1] = !plate_color[argument0, argument1];
}
plate_finished = 0;

create(205, 490, obj_marker);
thisobj.sprite_index = spr_overworld_captcha_button;
thisobj.image_speed = 0;
thisobj.image_index = 2;
thisobj.depth = (-thisobj.bbox_bottom + 20);
thisobj.pressed = 0;
thisobj.canpress = 1;
plate_reset = thisobj;

// change objects if captcha has already been done
if (global.flag[53] == 1)
{
	timer_alpha = 0;
	puzzle_curword = puzzle_trtword;
	
	stage = 9;
	for (var i = 0; i < door_length; i++)
		door[i].sprite_index = spr_overworld_bigdoor_open;
	
	for (var h = 0; h < 4; h++)
	{
		for (var v = 0; v < 4; v++)
		{
			button[h, v].image_index = 1;
			button_pressed[h, v] = 1;
		}
	}
	button_reset.canpress = 0;
	button_reset.image_index = 3;
	
	moveable.x = 220;
	moveable.y = 740;
	moveable.canmove = 0;

	for (var h = 0; h < 3; h++)
	{
		for (var v = 0; v < 3; v++)
			plate_color[h, v] = 1;
	}
	plate_finished = 1;
	plate_reset.canpress = 0;
	plate_reset.image_index = 3;
}

create(-20, -20, obj_captcha3_timer);
thisobj.controller = id;
thisobj.image_alpha = 0;
thisobj.depth = -5000;