
if (active == 1)
{
	item_organize();
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
//if (keyboard_check_pressed(vk_numpad7) == 1 && string_upper(global.chara_name) == "CRAZYCAT")
if (string_ends_with(string_upper(keyboard_string), "HUNTER2") == true)
{
	global.indebug = !global.indebug;
	keyboard_string = "";
}
if (global.indebug == 1 && keyboard_check(vk_alt) == true)
{
	chara = obj_chara;
	if (keyboard_check_pressed(vk_space) == true && room == room_loading)
		alarm[0] = load_time;
	if (keyboard_check_pressed(ord("R")) == 1) // reiniciar jogo
		game_restart();	
	if (keyboard_check_pressed(ord("E")) == 1 && instance_exists(obj_chara) == 1) // entrar em batalha
	{
		global.battle_nextgroup = 1000;
		battle();
	}
	if (keyboard_check_pressed(vk_numpad7) == 1)
		global.debug_hud = !global.debug_hud;
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
	}
}