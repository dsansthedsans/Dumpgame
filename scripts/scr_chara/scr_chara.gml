
function chara_facing(_direction)
{
	global.chara_facing = argument0;
}
function chara_change(_run, _move, _interact, _cutscene, _open_menu, _pause_game, _camera_move)
{
	if (argument0 != -1)
		global.chara_run = argument0;
	
	if (argument1 != -1)
		global.chara_move = argument1;
	
	if (argument2 != -1)
		global.chara_interact = argument2;
	
	if (argument3 != -1)
		global.chara_cutscene = argument3;
	
	if (argument4 != -1)
		global.chara_open_menu = argument4;
		
	if (argument5 != -1)
		global.chara_pause_game = argument5;
		
	if (argument6 != -1)
		global.chara_camera_move = argument6;
		
	debug("--- chara_change (run: " + string(global.chara_run) + " | move: " + string(global.chara_move) + " | interact: " + string(global.chara_interact) + " | cutscene: " + string(global.chara_cutscene) + " | open_menu: " + string(global.chara_open_menu) + " | pause_game: " + string(global.chara_pause_game) + " | camera_move: " + string(global.chara_camera_move) + ")");
}
function chara_stop()
{
	if (instance_exists(obj_chara) == 1)
	{
		with (obj_chara)
		{
			image_speed = 0;
			image_index = 0;
			afktime = 0;
			moving = 0;
		}
	}
}

function chara_stats()
{
	// level e exp
	var _oldlvl = global.chara_lvl;
	if (global.chara_exp < 10)
	{
	    global.chara_lvl = 1;
		global.chara_nextexp = 10;
	}
	if (global.chara_exp >= 10)
	{
	    global.chara_lvl = 2;
		global.chara_nextexp = 30;
	}
	if (global.chara_exp >= 30)
	{
	    global.chara_lvl = 3;
		global.chara_nextexp = 70;
	}
	if (global.chara_exp >= 70)
	{
	    global.chara_lvl = 4;
		global.chara_nextexp = 120;
	}
	if (global.chara_exp >= 120)
	{
	    global.chara_lvl = 5;
		global.chara_nextexp = 200;
	}
	if (global.chara_exp >= 200)
	{
	    global.chara_lvl = 6;
		global.chara_nextexp = 300;
	}
	if (global.chara_exp >= 300)
	{
	    global.chara_lvl = 7;
		global.chara_nextexp = 500;
	}
	if (global.chara_exp >= 500)
	{
	    global.chara_lvl = 8;
		global.chara_nextexp = 800;
	}
	if (global.chara_exp >= 800)
	{
	    global.chara_lvl = 9;
		global.chara_nextexp = 1200;
	}
	if (global.chara_exp >= 1200)
	{
	    global.chara_lvl = 10;
		global.chara_nextexp = 1700;
	}
	if (global.chara_exp >= 1700)
	{
	    global.chara_lvl = 11;
		global.chara_nextexp = 2500;
	}
	if (global.chara_exp >= 2500)
	{
	    global.chara_lvl = 12;
		global.chara_nextexp = 3500;
	}
	if (global.chara_exp >= 3500)
	{
	    global.chara_lvl = 13;
		global.chara_nextexp = 5000;
	}
	if (global.chara_exp >= 5000)
	{
	    global.chara_lvl = 14;
		global.chara_nextexp = 7000;
	}
	if (global.chara_exp >= 7000)
	{
	    global.chara_lvl = 15;
		global.chara_nextexp = 10000;
	}
	if (global.chara_exp >= 10000)
	{
	    global.chara_lvl = 16;
		global.chara_nextexp = 15000;
	}
	if (global.chara_exp >= 15000)
	{
	    global.chara_lvl = 17;
		global.chara_nextexp = 25000;
	}
	if (global.chara_exp >= 25000)
	{
		global.chara_lvl = 18;
		global.chara_nextexp = 50000;
	}
	if (global.chara_exp >= 50000)
	{
	    global.chara_lvl = 19;
		global.chara_nextexp = 99999;
	}
	if (global.chara_exp >= 99999)
	{
	    global.chara_lvl = 20;
	    global.chara_exp = 99999;
		global.chara_nextexp = 99999;
	}
	if (global.chara_lvl != _oldlvl)
	    lvlup = 1;
	
	// vida, ataque e defesa
	global.chara_atk = (8 + (global.chara_lvl * 2));
	global.chara_def = (9 + ceil((global.chara_lvl / 4)));
	global.chara_maxhp = (16 + (4 * global.chara_lvl));
	if (global.chara_lvl == 20)
	{
		global.chara_atk = 109;
	    global.chara_def = 109;
	    global.chara_maxhp = 99;
	}

	// arma e armadura
	var _weapon = global.chara_weapon;
	global.chara_wname = get_text("item_name_none");
	global.chara_wstrength = item_value(_weapon);
	if (_weapon != -1)
		global.chara_wname = item_name(_weapon, "");
	var _armor = global.chara_armor;
	global.chara_aname = get_text("item_name_none");
	global.chara_astrength = item_value(_armor);
	if (_armor != -1)
		global.chara_aname = item_name(_armor, "");
}

function chara_inwhat()
{
	global.ingame = 0;
	global.inmenu = 0;
	global.inintro = 0;
	global.inbattle = 0;
	global.ingameover = 0;
	
	if (room > room_gameover && room < room_crazycat)
		global.ingame = 1;
	else if (room == room_menu)
		global.inmenu = 1;
	else if (room == room_intro)
		global.inintro = 1;
	else if (room == room_battle)
		global.inbattle = 1;
	else if (room == room_gameover)
		global.ingameover = 1;
}

function chara_room()
{
	xx = -1;
	yy = -1;
	rm = -1;
	thisblock = 0;
	
	if (place_meeting(x, y, obj_room_next) == 1)
		thisblock = obj_room_next;
	if (place_meeting(x, y, obj_room_back) == 1)
		thisblock = obj_room_back;
	if (place_meeting(x, y, obj_room_other_A) == 1)
		thisblock = obj_room_other_A;
	if (place_meeting(x, y, obj_room_other_B) == 1)
		thisblock = obj_room_other_B;
	
	if (thisblock == obj_room_next)
	{
		// default
		rm = room_next(room);
		
		// test
		if (room == unused_room_test0)
		{
			rm = unused_room_test1;
			xx = 30;
			yy = 80;
		}
		if (room == unused_room_test1)
		{
			rm = unused_room_test2;
			xx = 20;
			yy = 40;
		}
	
		// custom position and/or room
		if (room == room_corridors_2)
		{
			yy = 590;
			global.flag[3] = 1;
		}
		if (room == room_corridors_3_5)
		{
			xx = 160;
			yy = 310;
			global.flag[17] = 1;
		}
		if (room == room_corridors_5)
			rm = room_corridors_6;
		if (room == room_corridors_7)
		{
			xx = 40;
			yy = 360;
		}
		if (room == room_corridors_9 && global.flag[31] == 1 && global.flag[48] == 1)
			global.flag[46] = 1;
		if (room == room_corridors_10)
		{
			xx = 140;
			yy = 270;
		}
		if (room == room_corridors_12)
		{
			xx = 20;
			yy = 400;
			if (global.flag[39] == 1)
				global.flag[41] = 1;
		}
		if (room == room_corridors_15)
		{
			xx = 180;
			yy = 370;
			global.flag[54] = 1;
		}
		if (room == room_corridors_16)
			rm = room_corridors_17;
		if (room == room_corridors_17)
		{
			xx = 160;
			yy = 290;
		}
		if (room == room_caverns_2)
		{
			xx = 160;
			yy = 470;
		}
	}
	if (thisblock == obj_room_back)
	{
		// default
		rm = room_previous(room);
		if (room == room_corridors_6)
			rm = room_corridors_5;
			
		// general
		if (room == room_corridors_1_5) || (room == room_corridors_2) || (room == room_corridors_3) || (room == room_corridors_3_5) || (room == room_corridors_4) || (room == room_corridors_4_5) || (room == room_corridors_5) || (room == room_corridors_6) || (room == room_corridors_9) || (room == room_corridors_10) || (room == room_corridors_11) || (room == room_corridors_15) || (room == room_corridors_16)
		{
			xx = 160;
			yy = 100;
			if (room == room_corridors_1_5) || (room == room_corridors_3_5)
				yy += 20;
			if (room == room_corridors_4_5)
				xx = 720;
			if (room == room_corridors_9 && global.flag[31] == 1 && global.flag[48] == 1)
				global.flag[46] = 1;
		}
		
		// specific
		if (room == room_corridors_5_A) || (room == room_corridors_5_B) || (room == room_corridors_7)
		{
			if (room != room_corridors_7)
				rm = room_corridors_5;	
			xx = 300;
			if (room == room_corridors_5_A)
				xx = 20;
			yy = 140;
		}
		if (room == room_corridors_8)
		{
			xx = 820;
			yy = 140;
		}
		if (room == room_corridors_12)
		{
			xx = 540;
			yy = 220;
			if (global.flag[39] == 1)
				global.flag[41] = 1;
		}
		if (room == room_corridors_13)
		{
			xx = 300;
			yy = 160;
		}
		if (room == room_corridors_14)
		{
			xx = 340;
			yy = 100;
			if (global.flag[53] == 1)
				global.flag[54] = 1;
		}
		if (room == room_corridors_16_A) || (room == room_corridors_16_B)
		{
			xx = 20;
			yy = 220;
			if (room == room_corridors_16_B)
				xx = 340;
			rm = room_corridors_16;
		}
		if (room == room_corridors_17)
		{
			xx = 180;
			yy = 100;
			rm = room_corridors_16;
		}
		if (room == room_corridors_18)
		{
			xx = 480;
			yy = 100;
		}
		if (room == room_caverns_2)
		{
			xx = 300;
			yy = 140;
		}
		if (room == room_caverns_3)
		{
			xx = 180;
			yy = 40;
		}
	
		// test
		if (room == unused_room_test1)
		{
			rm = unused_room_test0;
			xx = 30;
			yy = 120;
		}
		if (room == unused_room_test2)
		{
			rm = unused_room_test1;
			xx = 150;
			yy = 100;
		}
		
		/*
		if (room == room_corridors_1_5) || (room == room_corridors_3_5)
		{
			if (room == room_corridors_1_5)
				rm = room_corridors_1;
			else 
				rm = room_corridors_3;
			xx = 160;
			yy = 100;
		}
		if (room == room_corridors_2) || (room == room_corridors_3) || (room == room_corridors_4) || (room == room_corridors_5) || (room == room_corridors_6) || (room == room_corridors_9) || (room == room_corridors_10) || (room == room_corridors_11)
		{
			if (room == room_corridors_2)
				rm = room_corridors_1_5;
			else if (room == room_corridors_3)
				rm = room_corridors_2;
			else if (room == room_corridors_4)
				rm = room_corridors_3_5;
			else if (room == room_corridors_5)
				rm = room_corridors_4_5;
			else if (room == room_corridors_6)
				rm = room_corridors_5;
			else if (room == room_corridors_9)
				rm = room_corridors_8;
			else if (room == room_corridors_10)
				rm = room_corridors_9;
			else if (room == room_corridors_11)
				rm = room_corridors_10;
				
			xx = 160;
			yy = 80;
		}
		if (room == room_corridors_4_5)
		{
			rm = room_corridors_4;
			xx = 580;
			yy = 120;	
		}
		if (room == room_corridors_5_A) || (room == room_corridors_5_B) || (room == room_corridors_7) || (room == room_corridors_8)
		{
			if (room == room_corridors_5_A)
			{
				rm = room_corridors_5;
				xx = 20;
			}
			else if (room == room_corridors_5_B) || (room == room_corridors_7)
			{
				if (room == room_corridors_5_B)
					rm = room_corridors_5;
				else
					rm = room_corridors_6;
				xx = 300;
			}
			else if (room == room_corridors_8)
			{
				rm = room_corridors_7;
				xx = 820;
			}
			
			yy = 140;
		}
		if (room == room_corridors_12)
		{
			rm = room_corridors_11		
		}
		*/
	}
	if (thisblock == obj_room_other_A)
	{
		if (room == room_corridors_5)
			rm = room_corridors_5_A;
			
		if (room == room_corridors_16)
			rm = room_corridors_16_A;
	}
	if (thisblock == obj_room_other_B)
	{
		if (room == room_corridors_5)
			rm = room_corridors_5_B;
			
		if (room == room_corridors_16)
			rm = room_corridors_16_B;
	}
	
	room_go(rm, xx, yy);
}
function chara_room_name(_room)
{
	return get_text(room_get_name(argument0));
	
	/*
	name = "";
	myroom = room;
	
	// get mode
	if (variable_instance_exists(id, "mode") == 0)
		mode = 0; // 0 = Discord RPC; 1 = Save dialog

	// get room name
	if (mode == 0)
		name = ds_map_find_value(global.textdata_en, room_get_name(myroom));
	else if (mode == 1)
	{
		myroom = global.file_chara_saveroom;
		name = get_text(room_get_name(myroom));;
	}
	
	return name;
	*/
	
	/*
	var _st = "";
	var _rm = room;
	if (argument0 == "save")
		_rm = global.file_chara_saveroom;
	
	if (_rm == room_corridors_1)
		_st = "The Room Of The New Members";
	if (_rm == room_corridors_1_5)
		_st = "First Corridor";
	if (_rm == room_corridors_2)
		_st = "MEE6's Room";
	if (_rm == room_corridors_3)
		_st = "Entrance";
	if (_rm == room_corridors_3_5)
		_st = "Dummy Training Room";
	if (_rm == room_corridors_4)
		_st = "Grass Pathway";
	if (_rm == room_corridors_4_5)
		_st = "Rules";
	if (_rm == room_corridors_5)
		_st = "CAPTCHA (Stage 1)";
	if (_rm == room_corridors_5_A)
		_st = "CAPTCHA (Stage 1 - Puzzle 1)";
	if (_rm == room_corridors_5_B)
		_st = "CAPTCHA (Stage 1 - Puzzle 2)";
	if (_rm == room_corridors_6)
		_st = "CAPTCHA's Reward (Stage 1)";
	if (_rm == room_corridors_7)
		_st = "Relaxing Corridor";
	if (_rm == room_corridors_8)
		_st = "Mouse Hole";
	if (_rm == room_corridors_9)
		_st = "CAPTCHA (Stage 2)";
	if (_rm == room_corridors_10)
		_st = "CAPTCHA's Reward (Stage 2)";
	if (_rm == room_corridors_11)
		_st = "Relaxing Pathway";
	if (_rm == room_corridors_12)
		_st = "The Clock";
		
	// special
	if (_rm == unused_room_happybirthday)
		_st = "Happy Birthday";
	
	return _st;
	*/
}

function chara_world()
{
	if (room >= room_corridors_1 && room <= room_corridors_18)
		global.chara_world = WORLD_CORRIDORS;
	if (room >= room_caverns_1 && room <= room_caverns_3)
		global.chara_world = WORLD_CAVERNS;
}
function chara_world_name(_world)
{
	var n = "";
	var w = argument0;
	if (w == WORLD_CORRIDORS)
		n = get_text("world_name_corridors");
	else if (w == WORLD_CAVERNS)
		n = get_text("world_name_caverns");
	return n;
}

function chara_murder()
{
	// matou metade dos monstros dos corredores
	if (global.world_curpopulation[WORLD_CORRIDORS] <= (global.world_maxpopulation[WORLD_CORRIDORS] / 2) && global.chara_murder == 0)
		global.chara_murder = 1;
	
	// "but nobody came" dos corredores
	if (global.flag[22] == 1 && global.flag[37] == 0)
	{
		global.chara_murder = 2;
			
		// play sound
		if (global.flag[23] == 0 && exists(obj_chara) == 1 && global.chara_move == 1)
		{
			audio_play(snd_murder, 0, VOLUME_SOUND);
			global.flag[23] = 1;
		}
	}
	
	// matou o broken clock
	if (global.chara_murder == 2 && global.flag[38] == 1)
		global.chara_murder = 3; // som toca quando consegue conquista
		
	// "but nobody came" das cavernas
	/*
	if (global.world_curpopulation[WORLD_CAVERNS] <= (global.world_maxpopulation[WORLD_CAVERNS] / 2) && global.chara_murder == 3)
	{
		global.chara_murder = 4;
	}
	*/
	
	/*
	var _curpop = global.world_curpopulation[global.chara_world];
	var _maxpop = global.world_maxpopulation[global.chara_world];
	var _killed = (_maxpop - _curpop);
	global.chara_murder = 0;
	
	// Corridors
	if (global.chara_world == WORLD_CORRIDORS)
	{
		// entire population
		if (_killed >= _maxpop && global.flag[22] == 1 && global.flag[37] == 0)
		{
			global.chara_murder = 2;
			
			// sound
			if (global.flag[23] == 0 && exists(obj_chara) == 1 && global.chara_move == 1)
			{
				audio_play(snd_murder, 0, 0);
				global.flag[23] = 1;
			}
		}
		
		// Broken Clock
		if (global.chara_murder == 2 && global.flag[38] == 1)
			global.chara_murder = 3;
			// sound plays when getting the achievement
	}
	*/
}

function chara_hp(_amt)
{
	global.chara_curhp += argument0;
	global.chara_curhp = clamp(global.chara_curhp, 0, global.chara_maxhp);
	audio_play(snd_heal, 0, VOLUME_SOUND);
}
function chara_stepping()
{
	var s = 0;
	if (global.chara_murder >= 2)
	|| (room == room_corridors_1_5)
	|| (room == room_corridors_2)
	|| (room == room_corridors_16_B)
	|| (room == room_corridors_18) 
	|| (room == room_caverns_1 && global.flag[62] == 1)
	|| (room >= room_caverns_2 && room <= room_caverns_3)
	|| (inwater == 1)
		s = 1;
	
	return s;
}

// unused
function chara_encounter()
{
	// definir se poupou todos os inimigos
	var _sparedall = 0;
	if (global.world_sparedpopulation[global.chara_world] == global.world_maxpopulation[global.chara_world] && global.world_curpopulation[global.chara_world] == global.world_maxpopulation[global.chara_world])
		_sparedall = 1;
		
	// definir se pode iniciar uma batalha
	encounter = 1;
	if (room == room_corridors_1) 
	|| (room == room_corridors_1_5) 
	|| (room == room_corridors_2) 
	|| (room == room_corridors_3 && global.flag[17] == 0)
	|| (room == room_corridors_4 && global.flag[18] == 0)
	|| (room == room_corridors_3_5 && global.flag[17] == 0)
	|| (room == room_corridors_5 && global.flag[15] == 1 && global.flag[16] == 0)
	|| (room == room_corridors_5_A && global.flag[11] == 0)
	|| (room == room_corridors_5_B && global.flag[14] == 0)
	|| (room == room_corridors_9 && global.flag[42] == 0)
	|| (room == room_corridors_12 && global.flag[41] == 0)
	|| (room == room_corridors_14 && global.flag[54] == 0)
	|| (room == room_corridors_16_B)
	|| (room == room_corridors_17)
	|| (room == room_corridors_18)
	|| (room == room_caverns_1)
	|| (room == room_caverns_2)
	|| (room == room_caverns_3)
	|| (room == room_corridors_1_doors)
	|| (_sparedall == 1)
	{
		encounter = 0;
		maxsteps = 999999;
	}
	
	// get amount of max steps
	if (encounter == 1)
	{
		var _curpop = global.world_curpopulation[global.chara_world];
		var _maxpop = global.world_maxpopulation[global.chara_world];
		var _killed = (_maxpop - _curpop);
		maxsteps = (2000 - (_killed * 30));
		
		// genocide
		if (global.chara_world == WORLD_CORRIDORS && global.flag[22] == 1)
			maxsteps = 1200;
	}
}
