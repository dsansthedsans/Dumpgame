
hold_l = key("left_hold");
hold_r = key("right_hold");
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_enter = key("enter_press");
event_user(1);
event_user(3);

// start
if (startcon == 0)
{
	alarm[2] = 60;
	startcon = 1;
}
if (startcon == 2)
{
	warning_alpha += 0.05;
	if (warning_alpha >= 1)
	{
		alarm[2] = 180;
		startcon = 4;
	}
}
if (startcon == 5)
{
	warning_alpha -= 0.05;
	if (warning_alpha <= 0)
	{
		alarm[2] = 180;
		startcon = 6;
	}
}
if (startcon >= 7 && startcon <= 23 && (startcon / 2) != round(startcon / 2))
{
	if (title_length < 8)
	{
		title_length += 1;
		audio_play(snd_impact, 0, VOLUME_SOUND);
	}
	else
		audio_play(snd_dumpgame, 0, VOLUME_SOUND);
		
	var _name = "Dumpgame";
	if (dumpgaem == 1)
		_name = "Dumpgaem";
	var _caption = "";
	for (var i = 1; i < (title_length + 1); i++)
		_caption += string_char_at(_name, i);
	window_set_caption(_caption);
	
	alarm[2] = 30;
	startcon += 1;
}
if (startcon == 25)
{	
	alarm[2] = 60;
	startcon = 26;
}
if (startcon == 27)
{
	var _spd = 0.075;
	alpha = lerp(alpha, 1, _spd);
	title_y = lerp(title_y, 70, _spd);
	startalpha = lerp(startalpha, 0, _spd);
	var _ydist = abs(title_y - 70);
	if (_ydist < 1)
	{
		move = 1;
		alpha = 1;
		title_y = 70;
		startalpha = 0;
		startcon = 28;
		started = 1;
	}
}

// movimento e seleção
if (move == 1)
{
	// pegar teclas do movimento
	var _key0 = press_d;
	var _key1 = press_u;
	if (global.menu_lvl == 7)
	{
		_key0 = press_r;
		_key1 = press_l;
	}
	
	// movimento
	var _oldpos = option_pos;
	option_pos += (_key0 - _key1);
	if (option_pos >= option_length[global.menu_lvl])
		option_pos = 0;
	if (option_pos < 0)
		option_pos = (option_length[global.menu_lvl] - 1);
	if (option_pos != _oldpos)
	{
		audio_play(snd_option_move, 0, VOLUME_SOUND);
		if (play_erase > 0)
		{
			option[5, 2] = string_upper(get_text("menu_5_2"));
			play_erase = 0;	
		}
	}
	
	// seleção
	if (press_enter == 1) || (keyboard_check_pressed(vk_f10) == 1 && global.menu_lvl == 6 && option_pos == 1)
	{	
		// título
		if (global.menu_lvl == 0)
		{
			// jogar/continuar
			if (option_pos != (option_length[0] - 1))
			{
				global.menu_lvl = (option_pos + 1);
				//if (global.menu_lvl == 1 && global.hasfile == 1)
				//	global.menu_lvl = 5;
				option_pos = 0;
				audio_play(snd_option_select, 0, VOLUME_SOUND);
				event_user(5);
			}
			
			// sair do jogo
			else
				game_end();
		}
	
		// voltar
		else if (global.menu_lvl > 0 && option_pos == 0)
		{
			// normal
			if (global.menu_lvl < 5)
			{
				option_pos = (global.menu_lvl - 1);
				global.menu_lvl = 0;
			}
			
			// específico
			else
			{	
				// controles
				if (global.menu_lvl == 6)
				{
					option_pos = 1;
					global.menu_lvl = 2;	
				}
				
				// jogar (continuar jogo), jogar (novo jogo)
				else if (global.menu_lvl == 5) || (global.menu_lvl == 7)
				{
					// normal
					if !(global.menu_lvl == 7 && play_continue == 1)
					{
						option_pos = (play_save + 1);
						global.menu_lvl = 1;
					}
					
					// veio do jogar (continuar jogo)
					else
					{
						global.chara_name = "";
						
						option_pos = 2;
						play_continue = 0;
						global.menu_lvl = 5;
					}
				}
			}
			
			audio_play(snd_option_return, 0, VOLUME_SOUND);
		}

		// jogar (selecionar arquivo)
		else if (global.menu_lvl == 1)
		{
			if (option_pos > 0)
			{
				play_save = (option_pos - 1);
				global.menu_lvl = 7;
				if (file_exists("savefile" + string(play_save) + ".txt") == 1) // continuar
					global.menu_lvl = 5;
				option_pos = 0;
				audio_play(snd_option_select, 0, VOLUME_SOUND);
			}
		}
		
		// configurações
		else if (global.menu_lvl == 2)
		{
			var _pos = option_pos;
			if (_pos == 1)
			{
				option_pos = 0;
				global.menu_lvl = 6;	
			}
			if (_pos == 3)
				global.fullscreen = !global.fullscreen;
			if (_pos == 4)
				global.visualeff = !global.visualeff;
			if (_pos == 8)
				global.autorun = !global.autorun;
			if (_pos == 9)
				global.showfps = !global.showfps;
			if (_pos == 10)
				global.showsw = !global.showsw;
			if (_pos == 11)
				global.hidenotif = !global.hidenotif;
			if (_pos == 12)
				global.drpenabled = !global.drpenabled;
			if (_pos == 13)
				global.bloodgore = !global.bloodgore;
			if (_pos == 14)
				global.fastmenu = !global.fastmenu;

			event_user(1);
			audio_play(snd_option_select, 0, VOLUME_SOUND);
		}	
		
		// jogar (continuar jogo)
		else if (global.menu_lvl == 5)
		{
			if (option_pos == 1)
			{
				move = 0;
				global.savefile_selected = play_save;
				savefile_load(global.savefile_selected);
				room_go(global.chara_room, -1, -1);
				audio_play(snd_option_select, 0, VOLUME_SOUND);
			}
			if (option_pos == 2)
			{
				play_erase += 1;
				audio_play(snd_option_select, 0, VOLUME_SOUND);
				
				if (play_erase == 1)
					option[5, 2] = string_upper(get_text("menu_5_2_erase"));
				
				if (play_erase == 2)
				{
					savefile_erase(play_save);
					option[5, 2] = string_upper(get_text("menu_5_2"));
					play_erase = 0;
				
					option_pos = (play_save + 1);
					global.menu_lvl = 1;
				}
			}
		}
		
		// controles
		else if (global.menu_lvl == 6)
		{
			if (option_pos >= 2)
			{
				move = 0;
				controls_changing = 1;
				keyboard_lastkey = 0;
				audio_play(snd_option_select, 0, VOLUME_SOUND);
			}
		}
		
		// jogar (novo jogo)
		else if (global.menu_lvl == 7)
		{
			if (option_pos == 1 && namer_state == 0)
			{
				move = 0;
				option_alpha = 0;
				create(0, 0, obj_menu_namer);
				audio_play(snd_option_select, 0, VOLUME_SOUND);
			}
			
			if (option_pos == 2)
			{
				if (block == 0)
				{
					global.savefile_selected = play_save;
					room_goto(global.game_startroom[1]);
					audio_play(snd_option_select, 0, VOLUME_SOUND);
				}
				else
					audio_play(snd_option_cantselect, 0, VOLUME_SOUND);
			}
		}
	}
	
	// movimento e seleção específica
	if (global.menu_lvl == 2) // configurações
	{
		// alterar idioma
		if (option_pos == 2 && (press_l == 1 || press_r == 1))
		{
			if (global.lang == "en")
				global.lang = "pt";
			else
				global.lang = "en";
			event_user(0);
			settings_write();
			start_achievements();
		}
		
		// alterar volume
		if (option_pos >= 5 && option_pos <= 7 && (hold_l == 1 || hold_r == 1))
		{
			var _pos = (option_pos - 5);
			var _amt = 0.005;
			var _mult = 1;
			if (key("ctrl_hold") == 1) || (key("shift_hold") == 1)
				_mult = 200;
			var _dir = 1;
			if (hold_l == 1)
				_dir = -1;
		
			global.volume[_pos] += ((_amt * _mult) * _dir);
			global.volume[_pos] = clamp(global.volume[_pos], 0, 1);
		
			event_user(1);
			if (audio_playing(snd_option_movehold) == 0)
				audio_play(snd_option_movehold, 0, VOLUME_SOUND);
		}
		else
			audio_stop(snd_option_movehold);	
	}
	if (global.menu_lvl == 3) // conquistas
	{
		var _oldpos = achievement_pos;
		achievement_pos += (press_r - press_l);
		if (achievement_pos < 0) || (achievement_pos >= array_length(global.achievement))
			achievement_pos = _oldpos;
		if (_oldpos != achievement_pos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);
	}
	if (global.menu_lvl == 4) // créditos
	{
		var _oldpos = credits_pos;
		credits_pos += (press_r - press_l);
		if (credits_pos < 0) || (credits_pos >= 3)
			credits_pos = _oldpos;
		if (_oldpos != credits_pos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);
	}
	if (global.menu_lvl == 6) // controles
	{
		// resetar controles
		if (controls_changing == 0 && ((press_enter == 1 && option_pos == 1) || (keyboard_check_pressed(vk_f10) == 1)))
		{
			start_controls();
			event_user(1);
			audio_play(snd_keyreset, 0, VOLUME_SOUND);
		}
	}
}
namer_state = 0;

// scroll
if (global.menu_lvl == 2) || (global.menu_lvl == 6)
{
	var _pos = option_pos;
	var _length = option_length[global.menu_lvl];
	var _scrollstartpos = 6;
	var _maxscrollamt = (_length - _scrollstartpos - 5);
	var _apparentpos = (_pos - _scrollstartpos);
	_apparentpos = clamp(_apparentpos, 0, _maxscrollamt);
	old_scroll_y = scroll_y;
	scroll_y = lerp(scroll_y, (-40 * _apparentpos), 0.3)
	if (old_scroll_y != scroll_y && global.visualeff == 1123)
	{
		for (var i = 0; i < particle_max; i++)
		{
			if (particle[i] != -1 && exists(particle[i]) == 1)
				particle[i].y -= (old_scroll_y - scroll_y);
		}
	}
}
else
	scroll_y = 0;

// controles
if (global.menu_lvl == 6)
{
	if (controls_changing == 1 && keyboard_lastkey != 0)
	{
		var k = keyboard_lastkey;
		var _pos = option_pos;
		var _key = -1;
		if (_pos > 1)
			_key = (_pos - 2);
		if (k == 8) || (k == 13) || (k >= 16 && k <= 18) || (k == 27) || (k == 32) || (k >= 37 && k <= 40) || (k >= 48 && k <= 57) || (k >= 65 && k <= 90) || (k >= 112 && k <= 123) || (k >= 160 && k <= 165)
		{
			global.keybind[_key] = k;
			move = 1;
			controls_changing = 0;
			audio_play(snd_option_select, 0, VOLUME_SOUND);
			event_user(1);
		}
		else
			keyboard_lastkey = 0;	
	}
	
	/*
	// resetar controles
	if (changingkey == 0 && ((press_enter == 1 && option_pos == 1) || (keyboard_check_pressed(vk_f10) == 1)))
	{
		CONTROLS_START();
		event_user(1);
		audio_play(snd_keyreset, 0, 0);
	}
	
	// changing a keybind
	else if (keyboard_lastkey != 0 && canchange == 1)
	{
		var k = keyboard_lastkey;
		var _pos = option_pos;
		var _key = -1;
		if (_pos > 1)
			_key = (_pos - 2);
		if (k == 8) || (k == 13) || (k >= 16 && k <= 18) || (k == 27) || (k == 32) || (k >= 37 && k <= 40) || (k >= 48 && k <= 57) || (k >= 65 && k <= 90) || (k >= 112 && k <= 123) || (k >= 160 && k <= 165)
		{
			global.keybind[_key] = k;
			move = 1;
			changingkey = 0;
			audio_play(snd_option_select, 0, 0);
			event_user(1);
		}
		else
			keyboard_lastkey = 0;	
	}
	canchange = 1;

	*/
}

// ovos
if (started == 1 && controls_changing == 0 && !(exists(obj_menu_namer) == 1 && obj_menu_namer.typing == 1))
{
	if (string_ends_with(string_upper(keyboard_string), "MIGEL") == 1 && ovos == 0)
	{
		audio_play(SND_OVOS, 0, VOLUME_SOUND);
		ovos = 1;
	}
	if (ovos == 1 && audio_playing(SND_OVOS) == 0)
	{
		keyboard_string = "";
		ovos = 0;	
	}
}





















