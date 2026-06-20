
if (active == 1)
{
	chara_inwhat();
	chara_world();
	chara_stats();
	chara_murder();

	// fullscreen
	if (key("fullscreen") == 1)
	{
		global.fullscreen = !global.fullscreen;
		settings_write();
	}
	if (fullscreen != global.fullscreen && fullscreen_delay <= 0)
	{
		window_set_fullscreen(global.fullscreen);
		fullscreen = global.fullscreen;
		fullscreen_delay = fullscreen_delaymax;
	}
	else if (fullscreen_delay > 0)
	{
		fullscreen_delay -= 1;
		if (fullscreen_delay == (fullscreen_delaymax - 10) && global.fullscreen == 0)
			window_center();
	}
}

// debug
if (keyboard_check_pressed(vk_numpad7) == 1 && global.chara_name == "CRAZYCAT")
	global.indebug = !global.indebug;
if (global.indebug == 1)
{
	chara = obj_chara;
	
	// principais
	if (keyboard_check_pressed(ord("R")) == 1) // reiniciar jogo
		game_restart();
		
	if (keyboard_check_pressed(ord("E")) == 1 && instance_exists(obj_chara) == 1) // entrar em batalha
		battle();
		
	if (keyboard_check_pressed(ord("F")) == 1) // ir para o próximo quarto
	{
		if (room_next(room) != room_last)
			room_goto_next();
		else
			room_goto(room_first);
	}
	if (keyboard_check_pressed(ord("G")) == 1) // ir para o quarto anterior
	{
		if (room_previous(room) != room_first)
			room_goto_previous();
		else
			room_goto(room_last);
	}
	
	// outros
	if (keyboard_check(ord("P")) == 1) // party
	{
		if (keyboard_check_pressed(ord("O")) == 1)
			party_create((chara.x - 40), (chara.y - 40), "m6", UP);
		
		if (keyboard_check_pressed(vk_backspace) == 1)
			party_change(0, -1, -1);
		if (keyboard_check_pressed(vk_numpad0) == 1)
			party_change(0, 0, -1);
		if (keyboard_check_pressed(vk_numpad1) == 1)
			party_change(0, 1, choose(LEFT, RIGHT, UP, DOWN));
		
		/*
		if (keyboard_check_pressed(ord("B")) == 1)
		{
			party_change(0, 0, 0, -1, -1);
		}
		if (keyboard_check_pressed(ord("N")) == 1)
		{
			party_change(0, 1, 0, -1, -1);
		}
		if (keyboard_check_pressed(ord("M")) == 1)
		{
			party_change(0, 1, 1, -1, -1);
		}
		*/
	}
	
	
	
	
	// outros
	
	/*
	if (keyboard_check_pressed(ord("R")) == 1)
		game_restart();
	if (keyboard_check_pressed(vk_space) == 1)
		writer("event_gabee_chase_3", -1, -1);
	if (keyboard_check_pressed(ord("E")) == 1 && instance_exists(obj_chara) == 1)
		battle();
	if (keyboard_check_pressed(ord("G")) == 1)
		global.battle_nextgroup = -2000;
	if (keyboard_check_pressed(ord("T")) == 1)
	{
		if (room == room_caverns_3)
			room_goto(room_corridors_4);
		else
			room_goto(room_caverns_3);
	}
	if (keyboard_check_pressed(ord("I")) == 1 && instance_exists(obj_chara) == 1)
		side_create( obj_chara.x - 60, obj_chara.y, "m6");
	if (keyboard_check(ord("U")) == 1)
	{
		global.chara_exp += (100 * global.chara_lvl);
		global.chara_money += (100 * global.chara_lvl);
	}
	if (keyboard_check_pressed(ord("K")) == 1)
	{
		shakescreen(4, 4);
	}
	if (keyboard_check_pressed(ord("L")) == 1)
		create_notification("m6toy");
	if (keyboard_check_pressed(ord("J")) == 1 && instance_exists(obj_sidechara) == 1)
		obj_sidechara.following = !obj_sidechara.following;
	if (keyboard_check_pressed(ord("H")) == 1 && instance_exists(obj_sidechara) == 1)
		obj_sidechara.movement = !obj_sidechara.movement;
	if (keyboard_check_pressed(ord("M")) == 1)
	{
		global.chara_murder += 1;
		
		//////
		var _maxpop = global.world_maxpopulation[global.chara_world];
		
		global.world_curpopulation[global.chara_world] -= (_maxpop / 2);
		global.chara_exp += (3 * (_maxpop / 2));
		global.chara_money += (2 * (_maxpop / 2));
		global.chara_kills += (_maxpop / 2);
		/////
	}
	if (keyboard_check_pressed(ord("B")) == 1)
		chara_addhp(9999999);
	if (keyboard_check_pressed(vk_numpad3) == 1)
	{
		create(obj_chara.x, obj_chara.y, obj_enemy_body);
		thisobj.type = irandom_range(1, 4);
	}
	
	if (keyboard_check_pressed(ord("N")) == 1)
	{
		if (room_next(room) != room_last)
			room_goto_next();
		else
			room_goto(room_first);
	}
	if (keyboard_check_pressed(ord("P")) == 1)
	{
		if (room_previous(room) != room_first)
			room_goto_previous();
		else
			room_goto(room_last);
	}
	*/
}