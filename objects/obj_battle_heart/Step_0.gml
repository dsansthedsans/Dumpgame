
press_l = key("left_hold");
press_r = key("right_hold");
press_u = key("up_hold");
press_d = key("down_hold");
press_shift = key("shift_hold");

debug(string(exists(obj_battle_controller)) + string($"   ||| {room_get_name(room)}  ||  ") + string("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"));
if (controller.heart_move == 1) // movement
{
	curspeed = wspeed;
	if (press_shift == 1)
		curspeed = (wspeed / 2);
	
	x += ((press_r - press_l) * curspeed);
	y += ((press_d - press_u) * curspeed);
	
	var _boxx = controller.box_x;
	var _boxy = controller.box_y;
	var _boxw = controller.box_w;
	var _boxh = controller.box_h;
	
	var _lbox = (_boxx - (_boxw / 2) + (sprite_width / 2) - 2);
	var _rbox = (_boxx + (_boxw / 2) - (sprite_width / 2) + 3);
	x = clamp(x, _lbox, _rbox);
	
	var _ubox = (_boxy - (_boxh / 2) + (sprite_height / 2) - 2);
	var _dbox = (_boxy + (_boxh / 2) - (sprite_height / 2) + 3);
	y = clamp(y, _ubox, _dbox);
}

if (controller.fleeing == 0) // normal image speed
{
	if (invtime > 0)
		invtime -= 1;
	else
	{
		image_speed = 0;
		image_index = 0;
	}
}
else // fleeing animation
{
	sprite_index = spr_battle_heart_flee;
	image_speed = 0.25;
	x -= 1.5;
}

graze.x = x;
graze.y = y;

/*
if (controller.fleeing == 0) // take damage
{
	if (place_meeting(x, y, obj_battle_blt) == 1 && invtime <= 0)
	{
		image_speed = 1;
		global.chara_curhp -= 2;
		audio_play(snd_battle_hurt, 0, 0);
		invtime = 60;
	}
	else if (invtime > 0)
		invtime -= 1;
	else
	{
		image_speed = 0;
		image_index = 0;
	}
}
else // flee animation
{
	sprite_index = spr_battle_heart_flee;
	image_speed = 1;
	x -= 1.5;
}
*/

/*
// movement
if (global.battle_heart_move == 1)
{
	movex = 0;
	movey = 0;
	curspeed = wspeed;
	
	// normal movement
	if (global.battle_heart_mode == HEART_MODE_NORMAL) || (global.battle_heart_mode == HEART_MODE_YELLOW)
	{		
		if (press_shift == 1)
			curspeed = (wspeed / 2);	
			
		if (press_l == 1)
			movex = -curspeed;
		if (press_r == 1 && press_l == 0)
			movex = curspeed;
		if (press_u == 1)
			movey = -curspeed;
		if (press_d == 1 && press_u == 0)
			movey = curspeed;
	}
	
	// gravity movement
	if (global.battle_heart_mode = HEART_MODE_BLUE)
	{
		if (press_l == 1)
			movex = -curspeed;
		if (press_r == 1 && press_l == 0)
			movex = curspeed;
		
		if (jumpstage == 0)
			gravity = 0.12;
		if (y >= (global.box_y + (global.box_height / 2) - 8))
		{
			vspeed = 0;
			gravity = 0;
			jumpstage = 1;
		}
		if (jumpstage == 1)
		{
			if (press_u == 1)
			{
				jumpstage = 2;
				vspeed = -3;
			}
		}
		if (jumpstage == 2)
		{
			if (press_u == 0 && vspeed <= -0.5)
				vspeed = -0.5
		    if (vspeed > 0.25 && vspeed < 4)
		        vspeed += 0.15
		    if (vspeed > -0.5 && vspeed <= 0.25)
		        vspeed += 0.05
		    if (vspeed > -2 && vspeed <= -0.5)
		        vspeed += 0.125
		    if (vspeed <= -2)
		        vspeed += 0.05
		}
	}
	
	x += movex;
	y += movey;
	x = clamp(x, (global.box_x - (global.box_width / 2) + 8), (global.box_x + (global.box_width / 2) - 8));
	y = clamp(y, (global.box_y - (global.box_height / 2) + 8), (global.box_y + (global.box_height / 2) - 8));
	x = round(x);
	y = round(y);
}
else
{
	if (fleeing == 0)
	{
		hspeed = 0;
		vspeed = 0;
		jumpstage = 0;
	}
}

// set image
image_alpha = 1;
if (global.battle_fading == 1)
	image_alpha = (global.battle_alpha - global.battle_fade_alpha);

if (global.battle_heart_mode == HEART_MODE_NORMAL) // normal
	image_blend = global.c_dump;
if (global.battle_heart_mode == HEART_MODE_BLUE) // blue
	image_blend = #3262FF;
if (global.battle_heart_mode == HEART_MODE_YELLOW) // yellow
{
	image_angle = 180;
	image_blend = #FFDC31;
}
else
	image_angle = 0;

// i-frames
if (global.battle_heart_inv > 0)
{
	image_speed = 0.5;
	if (global.battle_heart_inv == 60)
		image_index = 1;
	global.battle_heart_inv -= 1;
}
else if (global.battle_heart_inv <= 0 && fleeing == 0)
{
	image_speed = 0;
	image_index = 0;
}

// fleeing
if (fleeing == 1)
{
	global.battle_heart_move = -1;
	sprite_index = spr_battle_heart_flee;
	image_speed = 0.2;
	image_index = 0;
	hspeed = -1;
	fleeing = 2;
}
*/
