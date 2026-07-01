
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_ctrl = key("ctrl_press");
press_enter = key("enter_press");
press_shift = key("shift_press");
press_esc = key("pausegame");

// control chara menu
if (global.chara_menu == 1)
{
	// get info for movement
	if (global.charamenu_lvl == 0) // main
	{
		var _pos = mainopt_pos;
		var _length = mainopt_length;
		var _heart_targetx = (mainopt_x[mainopt_pos] - 24);
		var _heart_targety = mainopt_y[mainopt_pos];
	}
	if (global.charamenu_lvl == 1) || (global.charamenu_lvl == 3) || (global.charamenu_lvl == 3.2) || (global.charamenu_lvl == 3.3) // inventory and cellphone
	{
		var _pos = levelopt_pos;
		var _length = levelopt_length;
		var _heart_targetx = (levelopt_x[levelopt_pos] - 11);
		var _heart_targety = levelopt_y[levelopt_pos];
	}
	if (global.charamenu_lvl == 0) || (global.charamenu_lvl == 1) || (global.charamenu_lvl >= 3 && global.charamenu_lvl < 4) // main, inventory and cellphone
	{
		var _key0 = press_u;
		var _key1 = press_d;	
	}
	if (global.charamenu_lvl == 1.5) // inventory (other)
	{
		var _pos = otheropt_pos;
		var _key0 = press_l;
		var _key1 = press_r;
		var _length = 3;
		var _heart_targetx = (otheropt_x[otheropt_pos] - 8);
		var _heart_targety = otheropt_y[otheropt_pos];
	}

	// move, select and return
	if (global.charamenu_move == 1)
	{
		// move
		if (global.charamenu_lvl != 2)
		{
			_pos += (_key1 - _key0);
			if (_pos >= _length)
				_pos = 0;
			if (_pos < 0)
				_pos = (_length - 1);
			if (_key0 == 1) || (_key1 == 1)
				audio_play(snd_option_move, 0, VOLUME_SOUND);
				
			heart_posx = _heart_targetx;
			heart_posy = _heart_targety;
		
			if (global.charamenu_lvl == 0)
				mainopt_pos = _pos;
			if (global.charamenu_lvl == 1) || (global.charamenu_lvl == 3)
				levelopt_pos = _pos;
			if (global.charamenu_lvl == 1.5)
				otheropt_pos = _pos;
		}
		
		// select
		if (global.charamenu_lvl != 2 && press_enter == 1 && press_shift == 0)
		{
			var _cancheck = 1;
			audio_play(snd_option_select, 0, VOLUME_SOUND);	
	
			// main
			if (global.charamenu_lvl == 0 && _cancheck == 1)
			{
				global.charamenu_lvl = (mainopt_pos + 1);
				levelopt_pos = 0;
				heart_posx = (levelopt_x[levelopt_pos] - 11);
				heart_posy = levelopt_y[levelopt_pos];
				if (global.charamenu_lvl == 2)
				{
					heart_posx = -20;
					heart_posy = -20;
				}
				_cancheck = 0;
			}
			
			// inventory, cellphone
			if ((global.charamenu_lvl == 1 || global.charamenu_lvl == 3) && _cancheck == 1)
			{
				if (levelopt[levelopt_pos] != "")
				{
					if (global.charamenu_lvl == 1)
					{
						global.charamenu_lvl = 1.5;
						otheropt_pos = 0;
					}
					else if (global.charamenu_lvl == 3)
					{
						global.charamenu_lvl += (0.1 * (levelopt_pos + 1));	
						levelopt_pos = 0;
					}
				}
				else
				{
					audio_stop(snd_option_select);
					audio_play(snd_option_cantselect, 0, 0);	
				}
				_cancheck = 0;
			}
		
			// inventory (other)
			if (global.charamenu_lvl == 1.5 && _cancheck == 1)
			{
				global.charamenu_move = 0;
				global.charamenu_lvl = 0;
			
				if (otheropt_pos == 0) // USE
					writer("charamenu_inventory_item_use", -1, -1);
				if (otheropt_pos == 1) // INFO
					writer("charamenu_inventory_item_info", -1, -1)
				if (otheropt_pos == 2) // DROP
					writer("charamenu_inventory_item_drop", -1, -1)
			
				_cancheck = 0;
			}
		
			press_enter = 0;
		}

		// return
		if (global.charamenu_lvl >= 1 && press_shift == 1)
		{
			if (global.charamenu_lvl != 1.5 && !(global.charamenu_lvl > 3 && global.charamenu_lvl < 4))
			{
				global.charamenu_lvl = 0;
				heart_posx = (mainopt_x[mainopt_pos] - 24);
				heart_posy = mainopt_y[mainopt_pos];
			}
			else
			{
				if (global.charamenu_lvl == 1.5)
					global.charamenu_lvl = 1;
				if (global.charamenu_lvl > 3 && global.charamenu_lvl < 4)
				{
					levelopt_pos = (0 + ((global.charamenu_lvl - 3.1) * 10));
					global.charamenu_lvl = 3;
				}
			}		
		
			audio_play(snd_option_return, 0, VOLUME_SOUND);
			press_shift = 0;
		}
	}
	
	// return movement after textbox
	if (global.charamenu_move == 0 && exists(thiswriter) == 0)
	{
		global.charamenu_move = 1;
		heart_posx = (mainopt_x[mainopt_pos] - 24);
		heart_posy = mainopt_y[mainopt_pos];
		press_enter = 0;
	}
	
	// close
	if ((press_ctrl == 1 || press_shift == 1) && global.charamenu_lvl == 0 && global.charamenu_move == 1)
	{
		audio_play(snd_option_return, 0, VOLUME_SOUND);
		global.chara_interact = 1;
		global.chara_menu = 0;
		global.chara_move = 1;
	}
}
else
{
	mainopt_pos = 0;
	heart_posx = heart_defaultx;
	heart_posy = heart_defaulty;
	
	// open
	if (press_ctrl == 1 && global.chara_move == 1 && global.chara_cutscene == 0 && global.chara_openmenu == 1 && instance_exists(obj_chara) == 1 && obj_chara.isafk == 0)
	{
		audio_play(snd_option_move, 0, VOLUME_SOUND);
		chara_stop();
		global.chara_interact = 0;
		global.chara_move = 0;
		global.chara_menu = 1;
	}
}

// manage encounters
chara_getencounter();
if (encounter == 1 && encountered == 0 && global.chara_encounter >= maxsteps && global.chara_move == 1 && global.chara_menu == 0 && global.chara_cutscene == 0)
{
	global.chara_move = 0;
	global.chara_encounter = 0;
	surprise(obj_chara);
	audio_play(snd_surprise, 0, VOLUME_SOUND);
	chara_stop();
	alarm[1] = 45;
	encountered = 1;
}

// control pause menu
if (global.chara_pause == 1)
{
	// get movement info
	var _pos = pause_option_pos;
	var _key0 = press_d;
	var _key1 = press_u;
	var _length = pause_option_length;
	if (pause_warning == 1)
	{
		_pos = pause_warning_pos;
		_key0 = press_r;
		_key1 = press_l;
		_length = 2;	
	}
	
	// main movement
	if (pause_move == 1)
	{
		var _oldpos = _pos;
		_pos += (_key0 - _key1);
		if (_pos >= _length)
			_pos = 0;
		if (_pos < 0)
			_pos = (_length - 1);
		if (_pos != _oldpos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);
		if (pause_warning == 0)
			pause_option_pos = _pos;
		else
			pause_warning_pos = _pos;
	}
	
	// close
	if (press_esc == 1) || (pause_option_pos == 0 && press_enter == 1)
	{
		audio_resume_all();
		sprite_delete(surfacespr);
		instance_activate_all();
		audio_play(snd_option_return, 0, VOLUME_SOUND);
		global.chara_pause = 0;
		global.chara_move = 1;
		pause_option_pos = 0;
		pause_warning = 0;
		pause_warning_pos = 0;
		surfacespr = -1;
		press_enter = 0;
		press_esc = 0;
		
		/*
		audio_resume_all();
		audio_play(snd_option_return, 0, 0);
		global.chara_pause = 0;
		global.chara_move = 1;
		pause_option_pos = 0;
		pause_warning = 0;
		pause_warning_pos = 0;
		sprite_delete(surfacespr);
		surfacespr = -1;
		instance_activate_all();
		*/
	}
	
	// selection
	else if (pause_option_pos != 0 && press_enter == 1 && pause_move == 1)
	{
		if (pause_warning == 0)
		{
			pause_warning = 1;
			pause_warning_pos = 0;
			audio_play(snd_option_select, 0, VOLUME_SOUND);
		}
		else
		{
			if (pause_warning_pos == 0)
			{
				pause_warning = 0;
				audio_play(snd_option_return, 0, VOLUME_SOUND);
			}
			else
			{
				if (pause_option_pos == 1)
				{
					global.resetfile = 1;
					global.chara_pause = 0;
					sprite_delete(surfacespr);
					surfacespr = -1;
					instance_activate_all();
					audio_stop_all();
					audio_play(snd_option_select, 0, VOLUME_SOUND);
					room_go(room_menu, -1, -1);
				}
				else
					game_end();
			}
		}
	}
}
else
{
	// pause
	if (press_esc == 1 && global.chara_move == 1 && global.chara_cutscene == 0 && global.chara_menu == 0 && global.chara_canpause == 1)
	{
		chara_stop();
		global.chara_move = 0;
		global.chara_pause = 1;
		
		surface = application_surface;
		surfacew = surface_get_width(surface);
		surfaceh = surface_get_height(surface);
		surfacespr = sprite_create_from_surface(surface, 0, 0, surfacew, surfaceh, 0, 0, 0, 0);
		
		instance_deactivate_all(true);
		instance_activate_object(obj_DISCORD_RPC);
		instance_activate_object(obj_GAME_CONTROLLER);
		instance_activate_object(obj_notification_controller)
		
		audio_pause_all();
		audio_play(snd_option_move, 0, VOLUME_SOUND);
		audio_resume(snd_notification_message);
		audio_resume(snd_notification_achievement);
	}
}