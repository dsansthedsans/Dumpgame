
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
	if (keyboard_check_pressed(ord("R")) == 1) // reiniciar jogo
		game_restart();	
	if (keyboard_check_pressed(ord("E")) == 1 && keyboard_check(vk_end) == false && instance_exists(obj_chara) == 1) // entrar em batalha
	{
		if (keyboard_check(vk_shift) == 1)
			global.battle_nextgroup = 6;
		if (keyboard_check(vk_control) == 1)
			global.battle_nextgroup = 1000;
		if (keyboard_check(vk_tab) == 1)
			global.battle_nextgroup = 13;
		if (keyboard_check(vk_space) == 1)
			global.battle_nextgroup = 1;
		if (keyboard_check(vk_backspace) == 1)
			global.battle_nextgroup = 12;
		battle();
	}
	if (keyboard_check(ord("E")) == true && keyboard_check(vk_end) == true && exists(obj_battle_controller) == true)
		obj_battle_controller.battle_turntime = 0;
	if (keyboard_check_pressed(vk_numpad7) == 1)
		global.debug_hud = !global.debug_hud;
	if (keyboard_check_pressed(ord("F")) == 1) // ir para o próximo quarto
	{
		room_goto_next();
		chara_change(-1, true, true, false, true, true, true);
	}
	if (keyboard_check_pressed(ord("G")) == 1) // ir para o quarto anterior
	{
		room_goto_previous();
		chara_change(-1, true, true, false, true, true, true);
	}
	if (keyboard_check_pressed(ord("A")) == true && exists(obj_battle_controller) == true && obj_battle_controller.assist.active == true)
		obj_battle_controller.assist.curr = obj_battle_controller.assist.max;
	if (keyboard_check_pressed(ord("M")) == 1)
	{
		global.world_curpopulation[chara_world()] = clamp((global.world_curpopulation[chara_world()] + (1 * ((keyboard_check(vk_backspace) == true) ? 1 : -1))), 0, global.world_maxpopulation[chara_world()]);
		if (keyboard_check(ord("T")) == false)
		{
			global.chara_exp += 3;
			global.chara_kills += 1;
		}
		else
		{
			global.chara_exp += (3 * global.world_maxpopulation[chara_world()]);
			global.chara_kills += global.world_maxpopulation[chara_world()];
			global.world_curpopulation[chara_world()] = 0;
			global.flag[22] = true;
			if (global.flag[39] == true)
				global.flag[38] = true;
		}
		
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
	if (keyboard_check(ord("Y")) == true)
	{
		var _amt = 1000 * clamp((global.chara_heals / 1000), 1, infinity);
		global.chara_exp += _amt;
		global.chara_money += _amt;
		global.chara_spares += _amt;
		global.chara_deaths += _amt;
		global.chara_kills += _amt;
		global.chara_heals += _amt;
	}
}