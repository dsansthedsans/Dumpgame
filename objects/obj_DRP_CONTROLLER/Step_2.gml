if (ready == 1)
{
	if (global.drpenabled == 1)
	{
		details = room_name(room);
		state = "Salenis";
		if (room == room_loading) // carregando
			state = textdata_get("start");
		else if (global.inmenu == 1) // menu
			state = textdata_get($"drp_state_menu_{global.menu_lvl}");
		else if (global.inintro == 1) // intro
			state = "";
			/*thatwriter = obj_intro_controller.thiswriter;
			if (exists(thatwriter) == 1)
			{
				var _msg = thatwriter.msg[thatwriter.page];
				_msg = string_replace_all(_msg, "^1", "");
				_msg = string_replace_all(_msg, "^2", "");
				_msg = string_replace_all(_msg, "^3", "");
				_msg = string_replace_all(_msg, "&!", " ");
				_msg = string_replace_all(_msg, "&", "");
				state = _msg;
			}*/
		else if (global.inbattle == 1) // batalha
		{
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
				state = textdata_get($"drp_state_battle_won_{controller.battle_group == 0}");
			else if (controller.fleeing == 1) // flee
				state = textdata_get("drp_state_battle_fleeing");
		}
		else if (global.ingameover == 1) // Game over
			state = "";
		else if (global.ingame == 1) // Overworld
		{
			details = chara_world_name(chara_world());
			state = room_name(room);
		}
		face = "noface";
		faceInfo = textdata_get($"drp_faceInfo_{global.savefile_selected != -1}");
		if (global.savefile_selected != -1)
		{
			face = "face0";
			if (chara_murder() >= 2)
				face = "face1";
			faceInfo = string_replace_all(faceInfo, "{name}", global.chara_name);
			faceInfo = string_replace_all(faceInfo, "{lvl}", global.chara_lvl);
		}
		np_setpresence(state, details, "cover", face);
		np_setpresence_more(faceInfo, textdata_get("start"), 0);
	}
	else
		np_clearpresence();	
}
np_update();