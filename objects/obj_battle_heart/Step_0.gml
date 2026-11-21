
press_l = key("left_hold");
press_r = key("right_hold");
press_u = key("up_hold");
press_d = key("down_hold");
press_shift = key("shift_hold");
if (exists(control) == true)
{
	// appearance
	image_blend = global.c_dump;
	if (control.heart_type == 1) // blue
		image_blend = global.c_yellow;//#003CFF;
	// movement
	if (control.heart_move == 1) 
	{
		var _boxx = control.box_x;
		var _boxy = control.box_y;
		var _boxw = control.box_w;
		var _boxh = control.box_h;
		var _lbox = (_boxx - (_boxw / 2) + (sprite_width / 2) - 2);
		var _rbox = (_boxx + (_boxw / 2) - (sprite_width / 2) + 3);
		var _ubox = (_boxy - (_boxh / 2) + (sprite_height / 2) - 2);
		var _dbox = (_boxy + (_boxh / 2) - (sprite_height / 2) + 3);
		curspeed = wspeed;
		if (press_shift == 1)
			curspeed = (wspeed / 2);
		if (control.heart_type == 0) // default
		{
			x += ((press_r - press_l) * curspeed);
			y += ((press_d - press_u) * curspeed);
		}
		else if (control.heart_type == 1) // blue
		{
			x += ((press_r - press_l) * curspeed);
			if (jumpstage == 0)
			{
				if (y < _dbox)
					gravity = 0.1;
				else
				{
					y = _dbox;
					speed = 0;
					gravity = 0;
					if (press_u == true)
					{
						vspeed = -round(wspeed * 2);
						jumpstage = 1;
					}
				}
			}
			if (jumpstage == 1)
			{
				if (press_u == true)
				{
					vspeed += 0.1;
					if (vspeed >= 0)
					{
						vspeed = 0;
						jumpstage = 0;
					}
				}
				else
				{
					vspeed = -(wspeed / 2);
					jumpstage = 0;
				}
			}
		}
		x = clamp(x, _lbox, _rbox);
		y = clamp(y, _ubox, _dbox);
	}
	if (control.heart_move == false) || (control.heart_move == true && control.heart_type != 1)
	{
		speed = 0;
		vspeed = 0;
		gravity = 0;
		jumpstage = 0;
	}
	// animation
	if (control.fleeing == 0)
	{
		if (invtime > 0)
			invtime -= 1;
		else
		{
			image_speed = 0;
			image_index = 0;
		}
	}
	else
	{
		sprite_index = spr_battle_heartFlee;
		image_speed = 1;
		x -= (wspeed / 2);
	}
	graze.x = x;
	graze.y = y;
	if (global.indebug == true && global.debug_hud == true)
		debug($"--- obj_battle_heart.x = {x} | obj_battle_heart.y = {y}");
}