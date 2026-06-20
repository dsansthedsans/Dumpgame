
if (ready == 1)
{
	if (global.drpenabled == 1)
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
				state = "Achievements - " + string(achievement_achieved()) + "/" + string(global.achievement_total) + "";
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
		
		// definir presence
		np_setpresence_more(face_info, "Made by dsans and migel8022", 0);
		np_setpresence(state, details, "cover", face);		
	}
	else
		np_clearpresence();	
}

np_update();