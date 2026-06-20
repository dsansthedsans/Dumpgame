
var _type = async_load[? "event_type"];

if (_type == "DiscordReady")
{
	ready = 1;
	debug("--- aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdhjasdhj");
}

#region
/*
if (_type == "DiscordReady" && drp == 1 && global.drpenabled == 1)
{
	details = "Salenis";
	state = "Salenis";
	
	// pegar informações
	if (room == room_loading) // carregando
	{
		details = "Loading...";
		state = "";
	}
	else if (global.inmenu == 1) // menu
	{
		details = "In Main Menu";
		
		controller = obj_menu_controller;
		var _savefile = (controller.play_save + 1);
		
		var l = global.menu_lvl;
		if (l == 0)
		{
			state = "Title";
			if (audio_playing(SND_OVOS) == 1)
				state = "Ovos";
		}
		else if (l == 1)
			state = "Selecting save file";
		else if (l == 2)
			state = "Settings";
		else if (l == 3)
			state = "Achievements - " + string(global.achievement_achieved) + "/" + string(global.achievement_total) + "";
		else if (l == 4)
			state = "Credits - Page " + string(controller.credits_pos + 1) + "";
		else if (l == 5)
			state = "Continue game - File " + string(_savefile) + "";
		else if (l == 6)
			state = "Controls";
		else if (l == 7)
			state = "Writing name - File " + string(_savefile) + "";
	}
	else if (global.inintro == 1) // intro
	{
		details = "Watching Intro";
		state = "";
		thatwriter = obj_intro_controller.thiswriter;
		if (exists(thatwriter) == 1)
		{
			var _msg = thatwriter.msg[thatwriter.page];
			_msg = string_replace_all(_msg, "^1", "");
			_msg = string_replace_all(_msg, "^2", "");
			_msg = string_replace_all(_msg, "^3", "");
			_msg = string_replace_all(_msg, "&!", " ");
			_msg = string_replace_all(_msg, "&", "");
			state = _msg;
		}
	}
	else if (global.inbattle == 1) // batalha
	{
		details = "In Battle";
		state = "";
		
		controller = obj_battle_controller;
		
		var _length = 0;
		var _marked_pos = 0;
		for (var i = 0; i < 3; i++)
		{
			name[i] = "";
			marked[i] = 0;
			if (controller.enemy_type[i] != 0)
			{
				name[i] = controller.enemy_name[i];
				marked[_marked_pos] = i;
				_marked_pos += 1;
				_length += 1;
			}
		}
		if (_length > 0 && controller.battle_group != 0 && controller.battle_won == 0 && controller.fleeing == 0)
		{
			if (_length == 1)
				state = name[marked[0]];
			else if (_length == 2)
				state = string(name[marked[0]]) + ", " + string(name[marked[1]]);
			else if (_length == 3)
				state = string(name[0]) + ", " + string(name[1]) + ", " + string(name[2]);
		}
		else if (controller.battle_won == 1)
		{
			state = "YOU WON!"
			if (controller.battle_group == 0)
				state = "But nobody came.";
		}
		else if (controller.fleeing == 1) // flee
			state = "Fleeing...";
	}
	else if (global.ingameover == 1) // Game over
	{
		details = "Game Over";
		state = "";
		thatwriter = obj_gameover_controller.thiswriter;
		if (exists(thatwriter) == 1)
		{
			
		}
	}
	else if (global.ingame == 1) // Overworld
	{
		details = chara_world_name(global.chara_world);
		state = chara_room_name(room);
	}

	// ponto de interrogação (sem save)
	if (global.savefile_selected == -1)
	{
		face = "noface";
		face_info = "No save file selected";
	}
	
	// rosto do carlinhos (com save)
	else
	{
		face = "face0";
		if (global.chara_murder >= 2)
			face = "face1";
		var _name = "\"" + string(global.chara_name) + "\"";
		if (_name == "\"\"")
			_name = "(UNNAMED)";
		face_info = string(_name) + " - [LVL " + string(global.chara_lvl) + "]";
	}

	// atualizar informações
	np_setpresence_more(face_info, "Made by dsans and migel8022", 0);
	np_setpresence(state, details, "cover", face);
}
*/
#endregion



































/*
if (global.discordrpc == 1 && global.discordrpc_enabled == 1)
{	
	// get details and state
	if (global.ingame == 1 && global.inmenu == 0 && global.inintro == 0 && global.inbattle == 0 && global.ingameover == 0) // overworld
	{
		details = chara_world_name(global.chara_world);
		state = chara_room_name(room);
		
		// custom
		if (room == room_corridors_14 && exists(obj_captcha3) == 1 && obj_captcha3.stage >= 1 && obj_captcha3.stage < 9)
		{
			var _zero0 = "";
			if (obj_captcha3.timer[0] < 10)
				_zero0 = "0";
				
			var _zero1 = "";
			if (obj_captcha3.timer[1] < 10)
				_zero1 = "0";
			
			state = string(state) + " (" + string(_zero0) + string(obj_captcha3.timer[0]) + "." + string(_zero1) + string(obj_captcha3.timer[1]) + ")" 	
		}
		if (room == room_corridors_18 && global.flag[60] == 1 && global.flag[61] == 0)
			state = string(state) + " (Run, Forrest, Run)";
		
		// paused
		var _paused = "";
		if (global.chara_pause == 1)
			_paused = " (Game paused)";
		
		state = string(state) + string(_paused);
	}
	else if (global.inmenu == 1) // menu
	{
		details = "In Main Menu";
		if (global.menu_lvl == -1)
			state = "Starting...";
		else if (global.menu_lvl == 0)
			state = "Title";
		else if (global.menu_lvl == 1)
			state = "Play - Selecting save file";
		else if (global.menu_lvl == 2)
			state = "Settings";
		else if (global.menu_lvl == 3)
			state = "Achievements"; // - [" + string(chara_getachievements(0)) + "/" + string(chara_getachievements(1)) + "]";
		else if (global.menu_lvl == 4)
			state = "Credits - Page " + string(obj_menu_controller.credits_page + 1);
		else if (global.menu_lvl == 5)
			state = "Play - Continue";
		else if (global.menu_lvl == 6)
			state = "Controls";
		else if (global.menu_lvl == 7)
		{
			state = "Play - New Game";
			if (exists(obj_menu_namer) == 1)
				state = "Writing name";
		}
	}
	else if (global.inintro == 1) // intro
	{
		details = "Watching Intro";
		state = "";
	}
	else if (global.inbattle == 1) // battle
	{
		details = "In Battle";
		state = "";
		controller = obj_battle_controller;
		
		// get enemy names
		var _length = 0;
		var _marked_pos = 0;
		for (var i = 0; i < 3; i++)
		{
			name[i] = "";
			marked[i] = 0;
			if (controller.enemy_type[i] != 0)
			{
				name[i] = controller.enemy_name[i];
				marked[_marked_pos] = i;
				_marked_pos += 1;
				_length += 1;
			}
		}
		
		// set state
		if (_length > 0 && controller.battle_group != 0 && controller.battle_won == 0 && controller.fleeing == 0) // enemy names
		{
			if (_length == 1)
				state = name[marked[0]];
			else if (_length == 2)
				state = string(name[marked[0]]) + ", " + string(name[marked[1]]);
			else if (_length == 3)
				state = string(name[0]) + ", " + string(name[1]) + ", " + string(name[2]);
		}
		else if (controller.battle_won == 1)
		{
			state = "YOU WON!"
			if (controller.battle_group == 0)
				state = "But nobody came.";
		}
		else if (controller.fleeing == 1) // flee
			state = "Fleeing...";
	}
	else if (global.ingameover == 1) // game over
	{
		details = "Game Over";
		state = "";
	}
	
	// get face and face info
	face = "face0";
	if (global.chara_murder >= 2)
		face = "face1";
	var _name = "\"" + string(global.chara_name) + "\"";
	if (_name == "\"\"")
		_name = "(UNNAMED)";
	face_info = string(_name) + " - [HP " + string(global.chara_curhp) + "/" + string(global.chara_maxhp) + "]";
	
	// set presence
	np_setpresence_more(face_info, "Made by dsans and migel8022", 0);
	np_setpresence(state, details, "cover", face);
	np_update();

}
*/



















