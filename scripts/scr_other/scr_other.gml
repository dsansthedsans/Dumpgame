
function key(_id)
{
	k = argument0;
	
	for (var p = 0; p < array_length(global.keybind); p++)
		keybind[p] = global.keybind[p];
	
	// mainchara movement
	if (k == "left_hold")
		return keyboard_check(keybind[0]);
	if (k == "right_hold")
		return keyboard_check(keybind[1]);
	if (k == "up_hold")
		return keyboard_check(keybind[2]);	
	if (k == "down_hold")
		return keyboard_check(keybind[3]);
	if (k == "shift_hold")
		return keyboard_check(keybind[8]) || keyboard_check(keybind[9]);
	
	// option movement
	if (k == "left_press")
		return keyboard_check_pressed(keybind[0]);
	if (k == "right_press")
		return keyboard_check_pressed(keybind[1]);
	if (k == "up_press")
		return keyboard_check_pressed(keybind[2]);	
	if (k == "down_press")
		return keyboard_check_pressed(keybind[3]);
	
	// select/unselect
	if (k == "enter_press")
		return keyboard_check_pressed(keybind[4]) || keyboard_check_pressed(keybind[5]);
	if (k == "shift_press")
		return keyboard_check_pressed(keybind[6]) || keyboard_check_pressed(keybind[7]);
		
	// in-game menu
	if (k == "ctrl_hold")
		return keyboard_check(keybind[10]) || keyboard_check(keybind[11]);
	if (k == "ctrl_press")
		return keyboard_check_pressed(keybind[10]) || keyboard_check_pressed(keybind[11]);
	
	// other
	if (k == "fullscreen")
		return keyboard_check_pressed(keybind[13]);
	if (k == "pausegame")
		return keyboard_check_pressed(keybind[12]);
	
}
function key_name(_key)
{	
	switch (argument0)
	{
		case 8:
	        return "Backspace";
		case 9:
	        return "Tab";
	    case 13:
	        return "Enter";
	    case 16:
	        return "Shift";
	    case 17:
	        return "Ctrl";
	    case 18:
	        return "Alt";
	    case 27:
	        return "Escape";
	    case 32:
	        return "Space Bar";
	    case 37:
	        return "Left Arrow";
	    case 38:
	        return "Up Arrow";
	    case 39:
	        return "Right Arrow";
	    case 40:
	        return "Down Arrow";
	    case 112:
	        return "F1";
	    case 113:
	        return "F2";
	    case 114:
	        return "F3";
	    case 115:
	        return "F4";
	    case 116:
	        return "F5";
	    case 117:
	        return "F6";
	    case 118:
	        return "F7";
	    case 119:
	        return "F8";
	    case 120:
	        return "F9";
	    case 121:
	        return "F10";
	    case 122:
	        return "F11";
	    case 123:
	        return "F12";
	    case 160:
	        return "Left Shift";
	    case 161:
	        return "Right Shift";
	    case 162:
	        return "Left Ctrl";
	    case 163:
	        return "Right Ctrl";
	    case 164:
	        return "Left Alt";
	    case 165:
	        return "Right Alt";
		default:
			if (is_string(argument0) == 1)
				return argument0;
			else
			{
				if (argument0 != -1)
					return chr(argument0);
				else
					return "Undefined";
			}
		break;
	}
	return "Undefined";
}

function create(_x, _y, _instance)
{
	thisobj = instance_create_layer(argument0, argument1, "Instances", argument2);
	return thisobj;
}
function exists(_instance)
{
	return instance_exists(argument0);	
}
function destroy(_instance)
{
	return instance_destroy(argument0);	
}
function roundpos(_instance)
{
	argument0.x = round(argument0.x);
	argument0.y = round(argument0.y);
}

function create_moveable(_x, _y, _canmove, _xflagid, _yflagid)
{
	mymoveable = instance_create_layer(argument0, argument1, "Instances", obj_moveable_block);
	mymoveable.canmove = argument2;
	mymoveable.xflagid = argument3;
	mymoveable.yflagid = argument4;
}
function create_notification(_id)
{
	if (global.hidenotif == 0 && global.notification[9] == 0)
	{
		notif = instance_create_layer(-40, -40, "Instances", obj_notification_controller);
		notif.myid = argument0;
		
		var i = 0;
		while (global.notification[i] != 0)
			i += 1;
		global.notification[i] = notif;
		notif.myself = i;
	}
}

function marker(_x, _y, _sprite, _alpha, _xscale, _yscale, _img_speed, _img_index, _angle, _blend, _depth)
{
	thismarker = instance_create_layer(argument0, argument1, "Instances", obj_marker);
	thismarker.sprite_index = argument2;
	thismarker.image_alpha = argument3;
	thismarker.image_xscale = argument4;
	thismarker.image_yscale = argument5;
	thismarker.image_speed = argument6;
	thismarker.image_index = argument7;
	thismarker.image_angle = argument8;
	thismarker.image_blend = argument9;
	thismarker.depth = argument10;
}
function surprise(_obj)
{
	marker(argument0.x, (argument0.y - argument0.sprite_height - 2), spr_surprise, 1, 1, 1, 0, 0, 0, c_white, -9999);
	thissurprise = thismarker;
}
function explosion(_x, _y)
{
	marker(argument0, argument1, spr_explosion1, 1, 1, 1, 1, 0, 0, c_white, -1000);
	audio_play(snd_explosion1, 0, VOLUME_SOUND);	
}
function afterimage()
{
	if (global.visualeff == 1)
	{
		after_image = instance_create_layer(x, y, "Instances", obj_particle_afterimage);
		after_image.sprite_index = sprite_index;
		after_image.image_alpha = (image_alpha / 2);
		after_image.image_xscale = image_xscale;
		after_image.image_yscale = image_yscale;
		after_image.image_speed = 0;
		after_image.image_index = image_index;
		after_image.image_angle = image_angle;
		after_image.image_blend = image_blend;
		after_image.depth = (depth + 0.25);
	}
}

function room_go(_room, _x, _y)
{
	if (exists(obj_room_transition) == 0)
	{
		trans_obj = instance_create_layer(-40, -40, "Instances", obj_room_transition);
		trans_obj.rr = argument0;
		trans_obj.xx = argument1;
		trans_obj.yy = argument2;
	}
	else
	{
		trans_obj = obj_room_transition;
		trans_obj.rr = argument0;
		trans_obj.xx = argument1;
		trans_obj.yy = argument2;
		trans_obj.con = 1;
		trans_obj.altcon = 1;
	}
}

function shakeobj(_obj, _xint, _yint, _intlower)
{
	shaker = instance_create_layer(0, 0, "Instances", obj_shakeobj)
	shaker.obj = argument0;
	shaker.xint = argument1;
	shaker.yint = argument2;
	shaker.intlower = argument3;
}
function shakeobj_normal() 
{
	shakeobj(id, 2, 2, 1);
}
function shakeobj_small() 
{
	shakeobj(id, 2, 2, 0.5);
}	

function screenpos(_x, _y)
{
	obj_GAME_CONTROLLER.cam_x = argument0;
	obj_GAME_CONTROLLER.cam_y = argument1;
}
function shakescreen(_xint, _yint)
{
	obj_GAME_CONTROLLER.cam_shake_xint = argument0;
	obj_GAME_CONTROLLER.cam_shake_yint = argument1;
	obj_GAME_CONTROLLER.cam_shake_stage = 1;
}

function movetopoint(_x, _y, _movemax, _obj)
{
	thismover = instance_create_layer(x, y, "Instances", obj_movetopoint);
	thismover.movex = argument0;
	thismover.movey = argument1;
	thismover.movemax = argument2;
	thismover.target = argument3;
	return thismover;
}
function movetopoint_facing(_x, _y, _movemax, _obj, _facingvar)
{
	movetopoint(argument0, argument1, argument2, argument3);

	var _curx = argument3.x;
	var _cury = argument3.y;
	var _targetx = argument0;
	var _targety = argument1;
	var _result = UP;
	var _xdist = (_curx - _targetx);
	var _ydist = (_cury - _targety);
	if (_xdist > _ydist)
	{
		if (_xdist > 0)
			_result = LEFT;
		else
			_result = RIGHT;
	}
	else if (_xdist < _ydist)
	{
		if (_ydist > 0)
			_result = UP;
		else
			_result = DOWN;
	}
		
	if (argument4 == global.chara_facing)
		global.chara_facing = _result;
	else if (argument4 == global.party_facing[0])
		global.party_facing[0] = _result;	
}

function draw_text_width(_x, _y, _string, _total_width)
{
    var _stringxscale = 1;
    var _stringwidth = string_width(argument2);
    if (_stringwidth >= argument3)
        _stringxscale = (argument3 / _stringwidth);
    draw_text_transformed(argument0, argument1, argument2, _stringxscale, 1, 0);
}

function draw_text_outline(_x, _y, _string, _color, _outline_width, _outline_color)
{
	var _myx = argument0;
	var _myy = argument1;
	var _mytext = argument2;
	var _mycolor = argument3;
	var _out_width = argument4;
	var _out_color = argument5;
	draw_set_color(_out_color);
	
	draw_text((_myx - _out_width), (_myy - _out_width), _mytext);
	draw_text((_myx + _out_width), (_myy - _out_width), _mytext);
	draw_text((_myx - _out_width), (_myy + _out_width), _mytext);
	draw_text((_myx + _out_width), (_myy + _out_width), _mytext);
	
	draw_text((_myx + _out_width), _myy, _mytext);
	draw_text((_myx - _out_width), _myy, _mytext);
	draw_text(_myx, (_myy - _out_width), _mytext);
	draw_text(_myx, (_myy + _out_width), _mytext);
	
	draw_set_color(_mycolor);
	draw_text(_myx, _myy, _mytext);
}
function draw_text_outline_ext(_x, _y, _string, _color, _sep, _w, _outline_width, _outline_color)
{
	var _myx = argument0;
	var _myy = argument1;
	var _mytext = argument2;
	var _mycolor = argument3;
	var _mysep = argument4;
	var _mywid = argument5;
	var _out_width = argument6;
	var _out_color = argument7;

	draw_set_color(_out_color);
	draw_text_ext((_myx - _out_width), (_myy - _out_width), _mytext, _mysep, _mywid);
	draw_text_ext((_myx + _out_width), (_myy - _out_width), _mytext, _mysep, _mywid);
	draw_text_ext((_myx - _out_width), (_myy + _out_width), _mytext, _mysep, _mywid);
	draw_text_ext((_myx + _out_width), (_myy + _out_width), _mytext, _mysep, _mywid);
	
	draw_text_ext((_myx + _out_width), _myy, _mytext, _mysep, _mywid);
	draw_text_ext((_myx - _out_width), _myy, _mytext, _mysep, _mywid);
	draw_text_ext(_myx, (_myy - _out_width), _mytext, _mysep, _mywid);
	draw_text_ext(_myx, (_myy + _out_width), _mytext, _mysep, _mywid);
	
	draw_set_color(_mycolor);
	draw_text_ext(_myx, _myy, _mytext, _mysep, _mywid);
}

function draw_text_outline_transformed(_x, _y, _string, _color, _outline_width, _outline_color, _xscale, _yscale, _angle)
{
	var _myx = argument0;
	var _myy = argument1;
	var _mytext = argument2;
	var _mycolor = argument3;
	var _out_width = argument4;
	var _out_color = argument5;
	var _myxsc = argument6;
	var _myysc = argument7;
	var _myang = argument8;
	draw_set_color(_out_color);
	
	draw_text_transformed((_myx - _out_width), (_myy - _out_width), _mytext, _myxsc, _myysc, _myang);
	draw_text_transformed((_myx + _out_width), (_myy - _out_width), _mytext, _myxsc, _myysc, _myang);
	draw_text_transformed((_myx - _out_width), (_myy + _out_width), _mytext, _myxsc, _myysc, _myang);
	draw_text_transformed((_myx + _out_width), (_myy + _out_width), _mytext, _myxsc, _myysc, _myang);
	
	draw_text_transformed((_myx + _out_width), _myy, _mytext, _myxsc, _myysc, _myang);
	draw_text_transformed((_myx - _out_width), _myy, _mytext, _myxsc, _myysc, _myang);
	draw_text_transformed(_myx, (_myy - _out_width), _mytext, _myxsc, _myysc, _myang);
	draw_text_transformed(_myx, (_myy + _out_width), _mytext, _myxsc, _myysc, _myang);
	
	draw_set_color(_mycolor);
	draw_text_transformed(_myx, _myy, _mytext, _myxsc, _myysc, _myang);
}

function draw_sprite_outline(_x, _y, _sprite, _index, _xscale, _yscale, _rot, _color, _alpha, _outline_width, _outline_color)
{
	var _myx = argument0;
	var _myy = argument1;
	var _myspr = argument2;
	var _myind = argument3;
	var _myxscale = argument4;
	var _myyscale = argument5;
	var _myangle = argument6;
	var _mycolor = argument7;
	var _myalpha = argument8;
	var _out_width = argument9;
	var _out_color = argument10;
		
	draw_sprite_ext(_myspr, _myind, (_myx - _out_width), (_myy - _out_width), _myxscale, _myyscale, _myangle, _out_color, _myalpha);
	draw_sprite_ext(_myspr, _myind, (_myx + _out_width), (_myy - _out_width), _myxscale, _myyscale, _myangle, _out_color, _myalpha);
	draw_sprite_ext(_myspr, _myind, (_myx - _out_width), (_myy + _out_width), _myxscale, _myyscale, _myangle, _out_color, _myalpha);
	draw_sprite_ext(_myspr, _myind, (_myx + _out_width), (_myy + _out_width), _myxscale, _myyscale, _myangle, _out_color, _myalpha);
	
	draw_sprite_ext(_myspr, _myind, _myx, _myy, _myxscale, _myyscale, _myangle, _mycolor, _myalpha);
}
function draw_rectangle_outline(_x1, _y1, _x2, _y2, _color, _outline_width, _outline_color)
{
	
	var _myx1 = argument0;
	var _myy1 = argument1;
	var _myx2 = argument2;
	var _myy2 = argument3;
	var _mycolor = argument4;
	var _out_width = argument5;
	var _out_color = argument6;
	
	draw_set_color(_out_color)
	draw_rectangle((_myx1 - _out_width), (_myy1 - _out_width), (_myx2 + _out_width), (_myy2 + _out_width), 0);
	
	draw_set_color(_mycolor)
	draw_rectangle(_myx1, _myy1, _myx2, _myy2, 0);
	
}

function draw_self_border()
{
	borderl = (controller.box_x - (controller.box_w / 2) - 0.5);
	borderr = (controller.box_x + (controller.box_w / 2));
	bordert = (controller.box_y - (controller.box_h / 2) - 0.5);
	borderb = (controller.box_y + (controller.box_h / 2));
	l = 0;
	t = 0;
	w = sprite_width;
	h = sprite_height;
	offx = 0;
	offy = 0;
	ll = (borderl - x + 1 - offx);
	tt = (bordert - y + 1 - offy);
	ww = (x + w - borderr - 1);
	hh = (y + h - borderb - 1);
	
	if (ll > 0) 
		l += ll;
	if (tt > 0) 
		t += tt;
	if (ww > 0) 
		w -= ww;
	if (hh > 0) 
		h -= hh;
		
	w = round(w);
	h = round(h);
	l = round(l);
	t = round(t);
	
	if (w + offx > 0 && h + offy > 0 && l < w && t < h) 
	{
		draw_set_alpha(1);
		draw_sprite_part(sprite_index, image_index, l, t, (w - l + offx), (h - t + offy), (x + l - offx), (y + t - offy));
	}
}

function draw_chapter_name(_alpha)
{
	var _number = get_text($"chapter_number_{global.chara_world}");
	if (is_undefined(_number))
		_number = "X";
	var _name = get_text($"chapter_name_{global.chara_world}");
	if (is_undefined(_name))
		_name = "SALENIS";
	draw_set_alpha(_alpha);
	draw_set_font(fnt_main_spaced);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_outline((obj_GAME_CONTROLLER.cam_x + 160), (obj_GAME_CONTROLLER.cam_y + 120), $"{get_text("chapter_main")} {_number}:\n{_name}", c_white, 0.5, c_dkgrey);
}

function debug(_string)
{
	return show_debug_message(argument0);	
}

function dumpparticle_start()
{
	particle_pos = 0;
	particle_max = 10000;
	particle_delay = 0;
	for (var i = 0; i < particle_max; i++)
		particle[i] = -1;
}
function dumpparticle_manage()
{
	// create particles
	if (global.visualeff == 1)
	{
		// create particles
		if (particle_delay >= 20)
		{	
			// reset particles
			if (particle_pos == particle_max)
				dumpparticle_start();
		
			// create particles
			for (var i = 0; i < 2; i++)
			{
				var z = (i + 1);
				var _utheart = irandom(1000);
				marker(irandom_range(0, room_width), 660, spr_dumpparticle_heart, 0, (1 / z), (1 / z), 0, 0, (irandom_range(80, 100) - 90), c_white, (-900 + (100 * i)));
				p = thismarker;
				p.mydir = choose(1, -1);
				p.myfade = 0;
				p.myalpha = (1 / z);
				p.speed = (irandom_range(1.2, 2) / z);
				p.direction = (image_angle + 90);
				if (_utheart == 0)
					p.image_index = 1;
				particle[particle_pos] = p;
				particle_pos += 1;
			}
			particle_delay = 0;
		} 
		
		// manage particles appearance
		else
		{
			particle_delay += 1;
			
			
			/*
			for (var i = 0; i < particle_max; i++)
			{
				if (particle[i] != -1 && exists(particle[i]) == 1)
				{
					with (particle[i])
					{
						image_angle += (0.01 * mydir);
						direction = (image_angle + 90)
	
						if (y <= 240)
							myfade += 0.005;
						image_alpha = (myalpha - myfade)
	
						if (x <= -20) || (x >= (room_width + 20)) || (y <= -20) || (image_alpha <= 0)
							destroy(id);
					}
				}
			}
			*/
		}
	}
	
	// destroy particles
	else if (exists(obj_marker) == 1)
	{
		dumpparticle_start()
		destroy(obj_marker);
	}
}

function display_gui_fix()
{	
	var sc = (640 / camera_get_view_width(view_camera[0]));
	
	display_set_gui_maximize(2, 2);
	
	/*
	var c = view_camera[0];
	var cw = camera_get_view_width(c);
	var ch = camera_get_view_height(c);
	display_set_gui_size(cw, ch);
	*/
}