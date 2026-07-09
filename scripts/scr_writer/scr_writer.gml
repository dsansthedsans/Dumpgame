
function writer(_text, _optionalx, _optionaly)
{	
	global.writer_text = _text;
	global.writer_old = global.writer;
	global.writer = instance_create_layer(-20, -20, "Instances", obj_writer_controller);
	global.writer.bubble_x = round(_optionalx);
	global.writer.bubble_y = round(_optionaly);
	global.writer_enemy = -1;
	thiswriter = global.writer;
}
function get_text(_id)
{
	var _msg = "";
	var _key = argument0;
	
	if (global.lang == "en")
		_msg = ds_map_find_value(global.textdata_en, _key);
	else if (global.lang == "pt")
		_msg = ds_map_find_value(global.textdata_pt, _key);
	
	return _msg;
}

function TEXT()
{	
	/*
	RAT NPC
	TEXT_SPEED 1
	* Hello.
	* Hello Hello.
	*/
	
	// intro
	if (text == "intro")
	{
		/*
		msg[0] = "Long ago,^1 three friends&!met each other&!during class."; //"Long ago,^1 two races&!ruled over Earth:^1&!HUMANS and MONSTERS."
		msg[1] = "After some time,^1 they&!decided to create a&!server in Discord.";
		msg[2] = "As months went by,^1&!new members joined&!the server.";
		msg[3] = "One day,^1 the server's&!owner was conducting&!experiments in his room.";
		msg[4] = "But it went very,^1&!very wrong.";
		msg[5] = "Many years later^2^3.^2^3.^2^3.";
		msg[6] = "    CEARÁ,^1 BRAZIL";
		msg[7] = "A brazilian boy was&!playing soccer alone&!in a football pitch.";
		msg[8] = "Suddenly,^1 a white flash&!of light came from a&!dumpster nearby.";
		msg[9] = "Curious, the boy approached the&!dumpster to search the&!origin of the light."
		msg[10] = "He was then gone as if&!nothing happened.";
		*/
		
		
		msg[0] = "Long ago,^1 a group of&!three friends created&!a server in Discord.^2^3";
		msg[1] = "As the months went by,^1&!new members joined&!the server.^2^3";
		msg[2] = "One day,^1 the server's&!owner was conducting&!experiments in his room.^2^3";
		msg[3] = "But it all went very,^1&!very wrong.^2^3";
		msg[4] = "Several years later^2^3.^2^3.^2^3.^2^1";
		msg[5] = "        BRAZIL&       2022^2^3";
		msg[6] = "A boy was playing soccer&!alone in a football&!pitch.";
		msg[7] = "Suddenly,^1 a white flash&!of light came from a&!dumpster nearby.";
		msg[8] = "The boy&!slowly approached the dumpster.";
		msg[9] = "He was then gone as if&!nothing had happened.";
		
		//"Long ago, three friends met each other during class.";
		// Muito tempo no passado, uma grande e bela amizade se iniciou durante uma aula.
		
		msg_skip[0] = 1;
		msg_next[0] = 1;
		msg_type[0] = "intro";
		msg_sound[0] = snd_txt2;
	}
	
	// chara menu
	if (text == "charamenu_item_use")
	{
		item_use();
		msg_format[0] = "textbox_bottom";
	}
	if (text == "charamenu_item_info")
	{
		msg[0] = item_desc(global.item[item_usepos()]);//global.inventory_slot_desc[obj_overworld_controller.levelopt_pos];	
		msg_format[0] = "textbox_bottom";
	}
	if (text == "charamenu_item_drop")
	{
		var _pos = item_usepos();
		msg[0] = string(get_text("item_drop_0.0")) + string(item_name(global.item[_pos], "")) + string(get_text("item_drop_0.1"));
		msg_format[0] = "textbox_bottom";
			
		audio_play(snd_grab, 0, VOLUME_SOUND);
		droppeditem_add(global.item[_pos]);
		global.item[_pos] = -1;
	}
	
	// room_corridors_1
	if (text == "room_lamp")
	{
		msg[0] = get_text("room_lamp_0");
		msg[1] = get_text("room_lamp_1");
	}
	if (text == "room_brokenlamp")
		msg[0] = get_text(text);
	
	// room_corridors_1_5
	if (text == "room_rockpile_0")
		msg[0] = "* (It's a pile of rocks.)";
	if (text == "room_rockpile_1")
		msg[0] = "* (Oh,^3 my God!^1 It can't be!)^2&* (It's a pile of rocks.)";
	
	// obj_event_m6_start
	if (text == "event_m6_start_0") || (text == "event_m6_start_1") || (text == "event_m6_start_2") || (text == "event_m6_start_3") || (text == "event_m6_start_4")
	{
		// get idnum
		var _idnum = 0;
		if (text == "event_m6_start_1")
			_idnum = 1;
		else if (text == "event_m6_start_2")
			_idnum = 2;
		else if (text == "event_m6_start_3")
			_idnum = 3;
		else if (text == "event_m6_start_4")
			_idnum = 4;
			
		// get messages
		for (var z = 0; z < 99; z++)
		{
			if (_idnum != 3) || (_idnum == 3 && z != 8)
			{
				var _bonuscheck = "";
				if (_idnum == 3 && z >= 9 && z <= 10)
					_bonuscheck = "_" + string(question_result[8]);
					
				var _curmsg = get_text("event_m6_start_" + string(_idnum) + "_" + string(z) + string(_bonuscheck));
				if (_curmsg != undefined)
					msg[z] = _curmsg;
			}
			else
			{
				question[8] = get_text("event_m6_start_3_8");
				question_option[1] = get_text("event_m6_start_3_8_1");
				question_option[2] = get_text("event_m6_start_3_8_2");
			}
		}
			
		// get text info
		msg_sound[0] = snd_txt_m6;
		msg_talker[0] = obj_marker;
		
		if (_idnum == 0)
		{
			msg_face[0] = spr_dialogface_m6_neutral;
			msg_face[2] = spr_dialogface_m6_neutralTense;
			msg_face[3] = spr_dialogface_m6_neutral;
		}
		else if (_idnum == 1)
		{
			msg_face[0] = spr_dialogface_m6_default;
			msg_face[2] = spr_dialogface_m6_neutral;
			msg_face[10] = spr_dialogface_m6_default;
		}
		else if (_idnum == 2)
			msg_face[0] = spr_dialogface_m6_neutral;
		else if (_idnum == 3)
		{
			msg_face[0] = spr_dialogface_m6_neutral;
				
			msg_face[8] = -1;
			msg_sound[8] = snd_txt1;
			msg_talker[8] = -1;
			
			msg_face[9] = spr_dialogface_m6_default;
			if (question_result[8] == 2)
			{
				msg_face[9] = spr_dialogface_m6_sassy;
				msg_face[10] = spr_dialogface_m6_default;
				msg_skip[9] = false;
				msg_skip[10] = true;
			}
			msg_sound[9] = snd_txt_m6;
			msg_talker[9] = obj_marker;
		}
		else if (_idnum == 4)
			msg_face[0] = spr_dialogface_m6_default;
	}
	
	// room_corridors_2
	if (text == "room_m6_banner")
	{
		msg[0] = get_text("room_m6_banner_0");
		msg[1] = get_text("room_m6_banner_1");
	}
	if (text == "room_m6_poster")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = get_text("room_m6_poster_" + string(i));
	}
	if (text == "room_m6_papers")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = get_text("room_m6_papers_" + string(i));
	}
	if (text == "room_m6_brokenwall")
	{
		msg[0] = get_text("room_m6_brokenwall_0");
		msg[1] = get_text("room_m6_brokenwall_1");
		msg_format[0] = "textbox_bottom";
		achievement_add(ACHIEVEMENT_M6TOY);
	}
	
	// save point
	if (text == "savepoint")
	{
		var p = 0;
		if (room == room_corridors_3)
		{
			msg[0] = "* (Seeing the dusty gray stairs and the colorful flowers in the grass, ...)";
			msg[1] = "* (... you realize that this is just the beginning to something big.)";
			msg[2] = "* (And that you probably shouldn't have left home.)";
			p = 3;
		}
		msg[p] = get_text("savepoint_def0");
		question[p+1] = get_text("savepoint_def1");
		question_option[1] = get_text("savepoint_def1_1");
		question_option[2] = get_text("savepoint_def1_2");
		msg_type[p+1] = "savepoint";
		if (question_result[p+1] == 1)
		{
			msg[p+2] = "";
			msg_type[p+2] = "savepoint";
			filesaved = 1;
		}
	}
		
	// room_corridors_3
	if (text == "room_stairssign")
	{
		for (var m = 0; m < 4; m++)
			msg[m] = get_text($"room_stairssign_{m}");
	}
	if (text == "room_deadlamp")
		msg[0] = get_text("room_deadlamp");
		
	// obj_event_m6_predummy
	if (text == "event_m6_predummy_0")
	{
		for (var m = 0; m < 99; m++)
		{
			var _curmsg = get_text("event_m6_predummy_0_" + string(m));
			if (_curmsg != undefined)
				msg[m] = _curmsg;
		}
		msg_face[0] = spr_dialogface_m6_default;
		msg_face[3] = spr_dialogface_m6_neutral;
		msg_face[4] = spr_dialogface_m6_default;
		msg_face[7] = spr_dialogface_m6_neutral;
		msg_face[8] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
	}
	if (text == "event_m6_predummy_1")
	{
		for (var m = 0; m < 3; m++)
			msg[m] = get_text("event_m6_predummy_1_" + string(m));
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
			
		question[3] = get_text("event_m6_predummy_1_3");
		question_option[1] = get_text("event_m6_predummy_1_3_1");
		question_option[2] = get_text("event_m6_predummy_1_3_2");
		msg_face[3] = -1;
		msg_sound[3] = snd_txt1;
			
		msg[4] = get_text("event_m6_predummy_1_" + string(question_result[3]) + "_4");
		msg[5] = get_text("event_m6_predummy_1_" + string(question_result[3]) + "_5");
		msg_face[4] = spr_dialogface_m6_default;
		msg_sound[4] = snd_txt_m6;
			
		if (question_result[3] == 1)
		{
			//msg[6] = string(get_text("event_m6_predummy_1_1_6_0")) + string_upper(key_name(global.keybind[04])) + string(get_text("event_m6_predummy_1_1_6_1")) + string_upper(key_name(global.keybind[05])) + string(get_text("event_m6_predummy_1_1_6_2"));
			//msg_face[6] = -1;
			//msg_sound[6] = snd_txt1;
		}
		else if (question_result[3] == 2)
			msg_face[4] = spr_dialogface_m6_neutral;
			
		global.flag[5] = question_result[3];		
	}
	
	// room_corridors_3_5
	if (text == "npc_dummy")
	{
		if (global.flag[6] == 0 && global.flag[7] == 0)
		{
			msg[0] = get_text("npc_dummy_0");
			if (global.flag[4] == 1 && global.flag[5] == 1)
			{
				question[1] = get_text("npc_dummy_1");
				question_option[1] = get_text("npc_dummy_1_1");
				question_option[2] = get_text("npc_dummy_1_2");
				if (question_result[1] == 1)
				{
					global.battle_nextgroup = 1;
					audio_stop(snd_option_select);
					battle();
				}
			}
		}
		else
		{
			msg[0] = "* (......)";
			if (irandom_range(1, 100) == 100)
				msg[0] = "* (.....!)";
			if (global.chara_murder >= 2)
				msg[0] = get_text("npc_dummy_2");
		}
	}
	
	// obj_event_m6_postdummy
	if (text == "event_m6_postdummy")
	{
		msg[0] = get_text("event_m6_postdummy_0");
		msg[1] = get_text("event_m6_postdummy_1");
		msg[2] = get_text("event_m6_postdummy_2");
		msg_face[0] = spr_dialogface_m6_default;
		msg_face[1] = spr_dialogface_m6_sassy;
		msg_face[2] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
	}
		
	// obj_event_m6_dummydoor
	if (text == "event_m6_dummydoor")
	{
		msg[0] = get_text("event_m6_dummydoor_0");
		msg[1] = get_text("event_m6_dummydoor_1_" + string(global.flag[5]));
		msg[2] = get_text("event_m6_dummydoor_2");
		msg_face[0] = spr_dialogface_m6_neutral;
		msg_sound[0] = snd_txt_m6;
	}
	
	// room_corridors_4
	if (text == "npc_armsguy1")
	{
		for (var i = 0; i < 99; i++)
		{
			var _curmsg = get_text("npc_armsguy1_" + string(global.flag[24]) + "_" + string(i));
			if (_curmsg != undefined)
				msg[i] = _curmsg;
		}
		if (global.flag[24] == 0)
			global.flag[24] = 1;
			
		msg_talker[0] = obj_chara.mycol;
	}
	
	// room_corridors_4_5
	if (text == "room_rulesbook")
	{
		for (var m = 0; m < 3; m++)
			msg[m] = get_text($"room_rulesbook_{m}");
		question[m] = get_text($"room_rulesbook_{m}.0");
		if (global.flag[67] > 0)
			question[m] = $"{get_text("room_rulesbook_" + string(m) + ".1_0")}{(global.flag[67] + 1)}{get_text("room_rulesbook_" + string(m) + ".1_" + string(clamp(global.flag[67], 1, 3)))}"
		question_option[1] = get_text($"room_rulesbook_{m}_1");
		question_option[2] = get_text($"room_rulesbook_{m}_2");
		if (question_result[m] == 1)
		{
			if (get_text($"room_rulesbook_{m+2}-{global.flag[67]}") != undefined)
			{
				msg[m+1] = get_text($"room_rulesbook_{m+1}.{(global.flag[67] > 0)}");
				msg[m+2] = get_text($"room_rulesbook_{m+2}-{global.flag[67]}");
				if (global.flag[67] > 0)
					msg_skip[m+2] = global.indebug;
				global.flag[67] += 1;
			}
			else
			{
				msg[m+1] = get_text($"room_rulesbook_{m+3}");
				msg_skip[m+1] = false;
				//FAZER CONQUISTAS !!!!!!! (PRINCIPALMENTE RULES BOOK)
			}
		}
	}
	
	// obj_event_m6_precaptcha1
	if (text == "event_m6_precaptcha1")
	{
		for (var i = 0; i < 4; i++)
			msg[i] = get_text("event_m6_precaptcha1_" + string(i));
		msg_face[0] = spr_dialogface_m6_neutral;
		msg_face[1] = spr_dialogface_m6_neutralTense;
		msg_face[2] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
		msg_format[0] = "textbox_bottom";
	}
		
	// room_corridors_5
	if (text == "room_captcha_mainsign_1")
	{
		for (var i = 0; i < 4; i++)
			msg[i] = get_text("room_captcha_mainsign_1_" + string(i));
	}
		
	// room_corridors_5_A, room_corridors_5_B
	if (text == "room_captcha_guidesign_1")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = get_text("room_captcha_guidesign_1_" + string(i));
	}
		
	// obj_event_m6_postcaptcha1
	if (text == "event_m6_postcaptcha1")
	{
		for (var i = 0; i < 5; i++)
			msg[i] = get_text("event_m6_postcaptcha1_" + string(i));
		msg_face[0] = spr_dialogface_m6_default;
		msg_face[1] = spr_dialogface_m6_pleased;
		msg_face[2] = spr_dialogface_m6_default;
		msg_face[2] = spr_dialogface_m6_defaultTense;
		msg_face[2] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
		msg_talker[0] = global.party[0];
		msg_format[0] = "textbox_bottom";
	}
		
	// room_corridors_6
	if (text == "room_candybowl")
	{
		var _candyamt = global.flag[19];
		var _lastslot = global.item[global.item_last];
			
		// take candy
		if (_candyamt > 0)
		{
			var _start = get_text("room_candybowl_0_0_0") + get_text("room_candybowl_0_0_1");
			var _middle = "";
			var _end = "";	
			if (_candyamt > 1)
			{
				_middle = get_text("room_candybowl_0_0_3");
				_end = get_text("room_candybowl_0_0_5");
			}
			else
			{
				_middle = get_text("room_candybowl_0_0_2");
				_end = get_text("room_candybowl_0_0_4");
			}
			msg[0] = string(_start) + string(_middle) + string(_candyamt) + string(_end);
			question[1] = get_text("room_candybowl_0_1");
			question_option[1] = get_text("room_candybowl_0_1_1");
			question_option[2] = get_text("room_candybowl_0_1_2");
			if (question_result[1] == 1)
			{			
				if (_lastslot == -1)
				{
					msg[2] = get_text("room_candybowl_0_2");
					if (_candyamt == 3)
					{
						var _start = get_text("room_candybowl_0_3_0");
						var _firstkey = key_name(global.keybind[10]);
						var _middle = get_text("room_candybowl_0_3_1");
						var _secondkey = key_name(global.keybind[11]);
						var _end = get_text("room_candybowl_0_3_2");
						msg[3] = string(_start) + string_upper(_firstkey) + string(_middle) + string_upper(_secondkey) + string(_end);
					}
					global.flag[19] -= 1;
					global.item[global.item_last] = ITEM_CANDY;
					audio_play(snd_item, 0, VOLUME_SOUND);
				}
				else
					msg[2] = get_text("room_candybowl_2");
			}
		}
			
		// take bowl
		else if (global.flag[20] == false)
		{
			for (var i = 0; i < 3; i++)
				msg[i] = get_text("room_candybowl_1_" + string(i));
			question[3] = get_text("room_candybowl_1_3");
			question_option[1] = get_text("room_candybowl_1_3_1");
			question_option[2] = get_text("room_candybowl_1_3_2");
			
			if (global.flag[21] == 0)
				msg_skip[0] = 0;
			global.flag[21] = 1;
				
			if (question_result[3] == 1)
			{
				if (_lastslot == -1)
				{
					msg[4] = get_text("room_candybowl_1_4");
					msg_skip[4] = 1;
					global.flag[20] = 1;
					global.item[global.item_last] = ITEM_BOWL;
					audio_play(snd_item, 0, VOLUME_SOUND);
						
					if (global.achievement[ACHIEVEMENT_SBHELMET] == 0)
					{
						global.achievement[ACHIEVEMENT_SBHELMET] = 1;
						create_notification("sbhelmet");
					}
				}
				else
					msg[4] = get_text("room_candybowl_2");
			}
		}
		else
		{
			for (var i = 0; i < 4; i++)
				msg[i] = get_text($"room_candybowl_3_{i}");
		}
	}
	if (text == "room_candysign")
	{
		for (var i = 0; i < 1; i++)
			msg[i] = get_text("room_candysign_" + string(i));
	}
		
	// room_corridors_7
	if (text == "room_relaxsign")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = get_text("room_relaxsign_" + string(i));
	}
	if (text == "room_benchlamp")
	{
		msg[0] = get_text("room_benchlamp_0");
	}
	
	// room_corridors_8
	if (text == "npc_armsguy_lost")
	{
		if (global.flag[45] == 0 && global.flag[48] == 0)
		{
			for (var i = 0; i < 99; i++)
			{
				var _curmsg = get_text("npc_armsguy_lost_0_0_" + string(i));
				if (_curmsg != undefined)
				{
					if (i != 5)
						msg[i] = _curmsg;
					else
					{
						question[i] = _curmsg;
						question_option[1] = get_text($"npc_armsguy_lost_0_0_{i}_1");
						question_option[2] = get_text($"npc_armsguy_lost_0_0_{i}_2");
						break;
					}
				}
			}
			msg_talker[i] = -1;
			msg_talker[i+1] = obj_chara.mycol;
			var _result = question_result[i];
			if (_result == 1)
			{
				for (var b = 0; b < 2; b++)
					msg[i+1+b] = get_text("npc_armsguy_lost_0_1_" + string(b));
				global.flag[45] = 1;
			}
			else if (_result == 2)
				msg[i+1] = get_text("npc_armsguy_lost_0_2_0");
		}
		else
		{
			if (global.flag[48] == 0)
			{
				msg[0] = get_text("npc_armsguy_lost_1_0_0");
				msg[1] = get_text("npc_armsguy_lost_1_0_1");
			}
			else
			{
				if (global.flag[47] = 0)
				{
					var _full = 0;
					if (global.item[global.item_last] != -1)
						_full = 1;
					for (var i = 0; i < 99; i++)
					{
						var _bonus = "";
						if (((i == 0) || (i == 1)) && global.flag[45] == 0)
							_bonus = "__";
						if (i >= 4)
							_bonus = "_" + string(_full);
						var _curmsg = get_text("npc_armsguy_lost_1_1_" + string(i) + string(_bonus));
						if (_curmsg != undefined)
							msg[i] = _curmsg;
						else
							break;
					}
					if (_full == 0)
					{
						msg_talker[5] = -1;
						msg_talker[6] = obj_chara.mycol;
						global.flag[47] = 1;
						global.item[global.item_last] = ITEM_KUNAI;
					}
				}
				else
					msg[0] = get_text("npc_armsguy_lost_1_2_0");
			}
		}
			
		#region
		/*
		if (global.flag[45] == 0 && global.flag[46] == 0)
		{
			msg[0] = "* Hey,^1 You.";
			msg[1] = "* You're A New Member,^1 Right?";
			msg[2] = "* Can You Help Me With Something?";
			msg[3] = "* My Buddy Got Stuck In The Middle Of Captcha's Stage 2.";
			msg[4] = "* He Asked Me To Look For Help.";
			msg[5] = "* I'll Give You A Reward For It.^1&* Don't Worry.";
			question[6] = "* (Do you want to help Armsguy?)";
			question_option[1] = "Yes";
			question_option[2] = "No";
				
			mytalk[6] = 0;
			mytalk[7] = obj_chara.mycol;
			
			var _result = question_result[6];
			if (_result == 1)
			{
				msg[7] = "* Sweet.";
				msg[8] = "* I'll Be Waiting For You Guys Right Here.";
				msg[9] = "* I'm Too Afraid Of Heights To Get Near Those Puzzles.";
				global.flag[45] = 1;
			}
			else if (_result == 2)
			{
				msg[7] = "* That's Alright.";
				msg[8] = "* I Guess I'll Look For Someone Else.";
			}
		}
		else
		{
			if (global.flag[46] == 0)
			{
				msg[0] = "* Do You Even Know Where The Captcha's Second Stage Is?";
				msg[1] = "* It's Right Up There.^1&* After That Door With Pillars.";
			}
			else
			{
				if (global.flag[47] = 0)
				{
					msg[0] = "* Thank You,^1 Human.";
					msg[1] = "* As I Promised,^1 I'll Give You A Reward.";
					msg[2] = "* I'm Not Sure If You'll Use This,^1 But I Found It Around Here.";
					msg[3] = "* It Looks Like A Knife,^1 But Weirder.";
					msg[4] = "* Here.^1&* It's All Yours.";
					msg[5] = "* (You got the :YKunai;D.)";
					msg[6] = "* Hope You Enjoy It.";
					mytalk[5] = 0;
					mytalk[6] = obj_chara.mycol;
					global.flag[47] = 1;
				}
				else
				{
					msg[0] = "* What?^1&* Didn't Like It?";
					msg[1] = "* ...^2 Sorry.";
				}
			}
		}
		*/
		#endregion
			
		msg_talker[0] = obj_chara.mycol;
	}
	if (text == "npc_trashguy_lost2")
	{
		msg[0] = get_text("npc_trashguy_lost2");
		msg_talker[0] = obj_chara.mycol;
	}

	// obj_event_m6_precaptcha2
	if (text == "event_m6_precaptcha2")
	{
		msg[0] = get_text("event_m6_precaptcha2_0");
		msg[1] = get_text("event_m6_precaptcha2_1");
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
		msg_format[0] = "textbox_bottom";
	}
		
	// room_corridors_9
	if (text == "room_captcha_mainsign_2")
	{
		for (var i = 0; i < 2; i++)
			msg[i] = get_text("room_captcha_mainsign_2_" + string(i));
	}
	if (text == "room_captcha_guidesign_2")
	{
		for (var i = 0; i < 1; i++)
			msg[i] = get_text("room_captcha_guidesign_2_" + string(i));
	}
	if (text == "npc_trashguy_lost1")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = get_text("npc_trashguy_lost1_" + string(i));
		msg_talker[0] = obj_chara.mycol;
		global.flag[48] = 1;
	}
				
	// obj_event_m6_postcaptcha2
	if (text == "event_m6_postcaptcha2")
	{
		msg[0] = get_text("event_m6_postcaptcha2_0");
		msg[1] = get_text("event_m6_postcaptcha2_1");
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
		msg_format[0] = "textbox_bottom";
	}
				
	// room_corridors_10
	if (text == "room_chocobowl")
	{
		msg[0] = get_text("room_chocobowl_0");
		if (global.flag[36] == 0)
		{
			msg[1] = get_text("room_chocobowl_1");
			question[2] = get_text("room_chocobowl_2");
			question_option[1] = get_text("room_chocobowl_2_1");
			question_option[2] = get_text("room_chocobowl_2_2");
			if (question_result[2] == 1)
			{
				if (global.item[global.item_last] == -1)
				{
					msg[3] = get_text("room_chocobowl_3_0");
					global.flag[36] = 1;
					global.item[global.item_last] = ITEM_CHOCO;
					audio_play(snd_item, 0, VOLUME_SOUND);
				}
				else
					msg[3] = get_text("room_chocobowl_3_1");
			}
		}
		else if (global.chara_armor == ITEM_BOWL)
			msg[0] = get_text("room_chocobowl_4");
	}
		
	// room_corridors_11
	if (text == "npc_trashguy")
	{
		for (var i = 0; i < 99; i++)
		{
			var _curmsg = get_text("npc_trashguy_" + string(global.flag[43]) + "_" + string(i));
			if (_curmsg != undefined)
				msg[i] = _curmsg;
		}
		//if (global.flag[43] == 0)
		//	global.flag[43] = 1;
	}
	if (text == "room_preclocksign")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = get_text("room_preclocksign_" + string(i));
	}
	
	// obj_event_brock_prebattle
	if (text == "event_brock_prebattle_0")
	{
		for (var i = 0; i < 99; i++)
		{
			var _curmsg = get_text("event_brock_prebattle_0_" + string(i));
			if (_curmsg != undefined)
				msg[i] = _curmsg;
		}
			
		msg_format[0] = "textbox_top";
			
		msg_sound[0] = snd_txt_brock;
			
		msg_face[2] = spr_dialogface_m6_angry;
		msg_sound[2] = snd_txt_m6;
		msg_talker[2] = global.party[0];
			
		msg_face[3] = -1;
		msg_sound[3] = snd_txt_brock;
		msg_talker[3] = -1;
	}
	if (text == "event_brock_prebattle_1")
	{
		for (var i = 0; i < 99; i++)
		{
			var _curmsg = get_text("event_brock_prebattle_1_" + string(i));
			if (_curmsg != undefined)
				msg[i] = _curmsg;
		}
				
		msg_sound[0] = snd_txt_brock;
		msg_format[0] = "textbox_top";
	}
	if (text == "event_brock_prebattle_6_genotest")
	{
		msg[0] = "* WELL,^1 LOOKS LIKE THAT I WAS RIGHT.";
		msg[1] = "* YOU'RE NO DIFFERENT FROM THEM.";
		msg[2] = "* IF YOU REALLY WANT TO END IT LIKE THIS,^1 I WON'T STOP YOU.";
		msg[3] = "* BUT YOU'VE GOTTA UNDERSTAND.";
		msg[4] = "* IN A FIGHT AGAINST ME...";
		msg[5] = "* YOU WOULD NEVER WIN!";
		mytype[0] = 6;
		auto_side[0] = 0;
	}
		
	// obj_event_brock_postbattle
	if (text == "event_brock_postbattle_0")
	{
		for (var i = 0; i < 99; i++)
		{
			var _curmsg = get_text("event_brock_postbattle_0_" + string(i));
			if (_curmsg != undefined)
				msg[i] = _curmsg;
			else
				break;
		}
		msg_sound[0] = snd_txt_brock;
		msg_format[0] = "textbox_top";
	}
	if (text == "event_brock_postbattle_1")
	{
		for (var i = 0; i < 99; i++)
		{
			var _bonuscheck = "";
			if (i >= 2 && i <= 4)
				_bonuscheck = "_" + string(global.flag[38]);
				
			var _curmsg = get_text("event_brock_postbattle_1_" + string(i) + string(_bonuscheck));
			if (_curmsg != undefined)
				msg[i] = _curmsg;
			else
				break;
		}
		
		msg_face[0] = spr_dialogface_m6_angry;
		if (global.flag[38] == 0)
		{
			msg_face[2] = spr_dialogface_m6_neutral;
			msg_face[3] = spr_dialogface_m6_angry;
		}
		else
		{
			msg_face[2] = spr_dialogface_m6_neutral;
			msg_face[3] = spr_dialogface_m6_default;
		}
		msg_sound[0] = snd_txt_m6;
		msg_talker[0] = obj_event_brock_postbattle.m6;
		msg_format[0] = "textbox_top";
	}
	if (text == "event_brock_postbattle_2")
	{
		msg[0] = get_text("event_brock_postbattle_2_0_0");
		msg_face[0] = spr_dialogface_m6_angry;
		if (global.flag[38] == 1)
		{
			msg[0] = get_text("event_brock_postbattle_2_0_1");
			msg_face[0] = spr_dialogface_m6_default;
		}
		msg_sound[0] = snd_txt_m6;
		msg_talker[0] = obj_event_brock_postbattle.m6;
		msg_format[0] = "textbox_top";
	}
	
	// room_corridors_13
	if (text == "room_postclocksign")
	{
		msg[0] = "* \"Hey!\"^1&* \"Did you have fun?\"";
		msg[1] = "* \"Actually,^1 don't mind answering,^1 I'm just a sign.\"";
		msg[2] = "* \"But we hope you did!\"";
	}
	if (text == "npc_armsguy_postbrock")
	{
		if (global.flag[49] == 0)
		{
			msg[0] = "* You The New Member The Guys Were Talking About.";
			msg[1] = "* I Saw Your Fight With Broken Clock.^1&* Pretty Epic Actually.";
			msg[2] = "* He One Of The Coolest Guys Here.";
			msg[3] = "* He Got Kinda Mad After The Invasion,^1 But He Still Cool.";
			global.flag[49] = 1;
		}
		else
		{
			msg[0] = "* He Was With The Humans All The Time.";
			msg[1] = "* That Was Before The Invasion Obviously.";
			msg[2] = "* Now He Just Be In That Brick Pile.";
		}
		msg_talker[0] = obj_chara.mycol;
	}
	if (text == "room_maurice")
	{
		msg[0] = "* (It's a rock in the format of a head.)";
		msg[1] = "* (The name \"Maurice\" is engraved in its forehead.)";
	}
	
	// obj_event_m6_precaptcha3
	if (text == "event_m6_precaptcha3")
	{
		msg[0] = "* Hey!^1&* This is already CAPTCHA's last stage!";
		msg[1] = "* As far as I can recall,^1 this is the hardest one.";
		msg[2] = "* However,^1 that is not going to be a problem for you.";
		msg[3] = "* And soon enough,^1 we&will be leaving&the :RCORRIDORS;D.";
		msg[4] = "* Any more dangers like that clock will not appear.";
		msg[5] = "* In any way,^1 I will leave it up to you.";
		msg_face[0] = spr_dialogface_m6_default;
		msg_face[1] = spr_dialogface_m6_neutral;
		msg_face[2] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
	}
	
	// room_corridors_14
	if (text == "room_captcha_mainsign_3")
	{
		msg[0] = "* \"[CAPTCHA - LAST STAGE]\"";
		msg[1] = "* \"This is the third and the last stage of the CAPTCHA's verification.\"";
		msg[2] = "* \"You will need to complete all the next three puzzles to complete the stage.\"";
		msg[3] = "* \"The first two puzzles are harder versions of the ones from STAGE 1 and 2.\"";
		msg[4] = "* \"The last puzzle,^1 however,^1&is different.\"";
		msg[5] = "* \"The instructions of the puzzles are informed at the side of each one of them.\"";
		msg[6] = "* \"Another important factor is that this stage is timed.\"";
		msg[7] = "* \"You will have exactly one minute to complete all the puzzles.\"";
		msg[8] = "* \"The countdown will start after you pull the two&levers at the top.\"";
		msg[9] = "* \"Good luck!\"";
	}
	if (text == "room_captcha_guidesign_3_1")
	{
		msg[0] = "* \"Write the word shown above using all the buttons.\"";
		msg[1] = "* \"The button with a 'X' resets the puzzle.\"";
	}
	if (text == "room_captcha_guidesign_3_2")
	{
		msg[0] = "* \"Take the box to the :Lgreen;D floor.\"";
		msg[1] = "* \"The box can only be moved through the white path inside the mechanism.\"";
	}
	if (text == "room_captcha_guidesign_3_3")
	{
		msg[0] = "* \"Turn all the squares green.\"";
		msg[1] = "* \"You can change their color by stepping on them.\"";
		msg[2] = "* \"Doing that will also change the color of the other squares near them.\"";
		msg[3] = "* \"If it's grey,^1 it becomes green.^1 If it's green, it becomes grey.\"";
		msg[4] = "* \"The button with a 'X' resets the puzzle.\"";
	}
	if (text == "room_captcha_endsign_3")
	{
		msg[0] = "* \"Congrats on finishing CAPTCHA's last verification stage!\"";
		msg[1] = "* \"Now you're free to leave the Corridors and get to the Central City.\"";
		msg[2] = "* \"In the next room,^1 you'll be granted with a reward.\"";
		msg[3] = "* \"Congratulations and goodbye!\"";
	}
	
	// obj_event_m6_postcaptcha3
	if (text == "event_m6_postcaptcha3")
	{
		msg[0] = "* Wow,^1 you really did it!";
		msg[1] = "* The CAPTCHA's verification is&finally over.";
		msg[2] = "* Now all we have to do is get to the end.";
		msg[3] = "* Thank you,^1 new member.";
		msg[4] = "* In any way,^1 let us keep going!";
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
		msg_talker[0] = global.side[0];
	}
	
	// room_corridors_15
	if (text == "room_nobowl")
	{
		msg[0] = "* Where is the reward?";
		msg[1] = "* I think the reward was supposed to be on this pillar.";
		msg[2] = "* Maybe another member or monster took it first.";
		msg[3] = "* Well,^1 it does not matter.";
		msg[4] = "* After all,^1 all we have to do now is just keep going!";
		msg_face[0] = spr_dialogface_m6_neutral;
		msg_face[3] = spr_dialogface_m6_default;
		msg_sound[0] = snd_txt_m6;
		msg_talker[0] = global.side[0];
	}
	
	// room_corridors_16_A
	if (text == "room_cavernssign")
		msg[0] = "* \"Cave system entrance.\"^1&* \"Proceed with caution.\"";
	if (text == "room_cavernsdoor")
		msg[0] = "* (Something behind the door is stopping you from opening it.)";
	
	// room_corridors_16_B
	if (text == "room_subwaysign")
	{
		msg[0] = "* \"Welcome to the Corridor's subway entrance.\"";
		msg[1] = "* \"If you are an administrador,^1 press the button and wait for a cart to come.\"";
	}
	if (text == "room_subwaybutton")
	{
		msg[0] = "* (You pressed the button.)";
		msg[1] = "* (...)";
		msg[2] = "* (Doesn't seem to be working.)";
	}
	
	// room_corridors_17
	if (text == "npc_armsguy_exitfirst")
	{
		if (global.flag[57] == 0)
		{
			msg[0] = "* You The New Member?^1&* That Cool.";
			msg[1] = "* The First Since The Invasion!";
			msg[2] = "* It A Shame You Leaving.^1&* The Exit Right Up There.";
			msg[3] = "* How You Getting Through The Corridor??";
			global.flag[57] = 1;
		}
		else
		{
			msg[0] = "* ... You Know Nothing About It?";
			msg[1] = "* The Corridor Up There Destroyed Because Of The Battle.";
			msg[2] = "* The Battle Between The New Members And The Administrators.";
			msg[3] = "* Mee6 Didn't Tell You That?^3&* Actually Why He Here??";
			msg[4] = "* Shouldn't He Be Locked Up??";
		}
		msg_talker[0] = obj_chara.mycol;
	}
	if (text == "npc_trashguy_exitfishing")
	{
		if (global.flag[58] == 0)
		{
			msg[0] = "* ...hi...";
			msg[1] = "* ...what...?^1&* ...i'm not fishing...";
			msg[2] = "* ...i was throwing trash down there but i accidentally threw something important...";
			msg[3] = "* ...now i'm trying to take it back with a fishing rod...";
			msg[4] = "* ...it's not working...";
			global.flag[58] = 1;
		}
		else
			msg[0] = "* ...i think i'll&just give up...";	
		msg_talker[0] = obj_chara.mycol;
	}
	if (text == "npc_armsguy_exitlifting")
		msg[0] = "* Can't Talk Right Now.^1&* I Gyming.";	
	if (text == "npc_flitcher_exit")
	{
		if (irandom_range(1, 5) == 1)
		{
			msg[0] = "* I Slightly Dislike You";
			msg_skip[0] = false;
			msg_font[0] = global.fnt_dsans;
			msg_talker[0] = obj_chara.mycol;
			global.flag[66] = 0.5;
		}
		else
		{
			msg[0] = "* (You wave to Flitcher.)";
			msg[1] = "* (He waves back at you.)";
			msg[2] = "* (How did he wave back if he has no hands at all?)";
			msg[3] = "* (This is the weirdest mystery of All Time.)";	
		}
	}
	
	// room_corridors_18
	if (text == "room_finalcorridor_sign")
	{
		msg[0] = "* \"New member,^1 you are at the Corridors' edge.\"";
		msg[1] = "* \"Soon you will be at the Central City,^1 enjoying life&as much as you can!\"";
		msg[2] = "* \"But,^1 before that,^1&there's one last thing&you have to do.\"";
		msg[3] = "* \"Face your last challenge before leaving this place.\"";
		msg[4] = "* \"Prove yourself worthy by walking through this unnecessarily long corridor.\"";
		msg[5] = "* \"Jokes aside,^1 we're sorry.\"";
	}
	if (text == "event_gabee_chase_0") || (text == "event_gabee_chase_1") || (text == "event_gabee_chase_2")
	{
		if (text == "event_gabee_chase_0")
		{
			msg[0] = "* This is it.";
			msg[1] = "* The exit is at the end of this corridor.";
			msg[2] = "* Before we continue,^1 I have a question for you.";
			msg[3] = "* You do remember how :YBATTLES;D work,^2 correct?";
			msg[4] = "* ...";
			msg[5] = "* No!^1 Nothing!^2&* I just wanted to know.";
			msg_face[0] = spr_dialogface_m6_neutral;
			msg_face[5] = spr_dialogface_m6_pleased;
		}
		if (text == "event_gabee_chase_1")
		{
			msg[0] = "* I confess.";
			msg[1] = "* I lied.";
			msg[2] = "* There is a reason I questioned your memory.";
			msg[3] = "* You see,^1 I may have not been as hone()";
			msg_face[0] = spr_dialogface_m6_neutralTense;
			msg_face[1] = spr_dialogface_m6_default;
			msg_face[2] = spr_dialogface_m6_defaultTense;
			msg_face[3] = spr_dialogface_m6_default;
		}
		msg_sound[0] = snd_txt_m6;
		msg_talker[0] = global.party[0];
		msg_format[0] = "textbox_bottom";
	}
	if (text == "event_gabee_chase_3")
	{
		msg[0] = "* (Você consegue ouvir uma conversa distante.)";
		msg_type[0] = "notawake";
		
		var i = 1;
		msg[i] = "* Ele tá bem alí^1&* Tá vendo?"; // g
		msg_sound[i] = snd_txt_gabee;
		i += 1;
		
		/*
		msg[00] = "* hes right there^1&* can you see it?"; // g
		
		msg[01] = "* I can see it"; // d
		
		msg[02] = "* do you think hes dead?"; // g
		
		msg[03] = "* probably"; // d
		
		msg[04] = "* i didnt think he would try to jump over the hole"; // g
		msg[05] = "* i thought he would stop or something";
		msg[06] = "* i didnt want this to happen";
		
		msg[07] = "* look,^1 you didn't do anything wrong";  // d
		msg[08] = "* both of us knew that this would happen at some point";
		msg[09] = "* I'll take his body out of there eventually";
		msg[10] = "* I just have to do some other stuff before I do that";
		msg[11] = "* but don't tell about this to the others,^1 alright?";
		msg[12] = "* this could literally fucking end the server";
		
		msg[13] = "* alright"; // g
		
		msg[14] = "* and you don't need to stay in this corridor anymore"; // d
		msg[15] = "* you can go back to your station there in the front";
		msg[16] = "* it's not like he's going to get up and try to jump over the hole again";
		
		msg[17] = "* ..."; // g
		msg[18] = "* how arent you unhappy with this?";
		
		msg[19] = "* I am unhappy"; // d
		msg[20] = "* you can be sure of that";
		*/
		
		/*
		msg[00] = "* ele ta bem ali^1&* ta vendo?"; // g
		
		msg[01] = "* eu tô vendo"; // d
		
		msg[02] = "* tu acha que ele morreu?"; // g
		
		msg[03] = "* provavelmente"; // d
		
		msg[04] = "* eu n achei que ele ia tentar pular por cima do buraco"; // g
		msg[05] = "* eu achava que ele ia parar ou algo assim";
		msg[06] = "* eu n queria que isso tivesse acontecido";
		
		msg[07] = "* olha,^1 tu não fez nada de errado";  // d
		msg[08] = "* nós dois sabíamos que isso iria acontecer em algum momento";
		msg[09] = "* eu vou tirar o corpo dele dali daqui a pouco";
		msg[10] = "* eu só preciso fazer umas coisas antes disso";
		msg[11] = "* mas não conta sobre isso pros outros,^1 tá?";
		msg[12] = "* isso pode literalmente acabar a porra do servidor";
		
		msg[13] = "* ta"; // g
		
		msg[14] = "* e tu não precisa mais ficar aqui nesse corredor"; // d
		msg[15] = "* já pode voltar lá pra tua estação lá na frente";
		msg[16] = "* não é como se ele fosse levantar e tentar pular por cima do buraco de novo";
		
		msg[17] = "* ..."; // g
		msg[18] = "* como que tu ta tão de boa?";
		
		msg[19] = "* de boa eu não estou"; // d
		msg[20] = "* você pode ter certeza disso";
		*/
		
		//msg[00] = "* ";
		//msg[00] = "* (You hear a distant conversation.)";
		
		
		/*
		// som de ligação
		
		msg[i++] = "* Oi,^1 eu tô nos Corredores.^1&* Tu pode vim aqui?"; // g
		msg[i++] = "* ...^1 Aconteceu.^1&* Um novo membro.";
		
		// som de teleportar
		
		msg[03] = "* como assim"; // d
		msg[04] = "* onde que ele tá";
		*/
		
		
		/*
		msg[i] = "* eu tô vendo"; // d
		msg_font[i] = global.fnt_dsans;
		msg_sound[i] = snd_txt_dsans;
		i += 1;
	
		msg[i] = "* Tu acha que ele morreu?"; // g
		msg_sound[i] = snd_txt_gabee;
		i += 1;
		
		msg[i] = "* provavelmente"; // d
		
		msg[i] = "* Eu n achei que ele ia tentar pular por cima do buraco"; // g
		msg_sound[i] = snd_txt_gabee;
		i += 1;
		msg[i] = "* Eu achava que ele ia parar antes ou algo assim";
		
		
		msg[i] = "* olha,^1 gabee,^1 nós dois sabíamos que isso iria acontecer em algum momento"; // d
		msg[i] = "* eu vou tirar o corpo dele dali daqui a pouco";
		msg[i] = "* eu só preciso fazer umas coisas antes disso";
		msg[i] = "* mas não conta sobre isso pros outros,^1 tá?";
		msg[i] = "* isso pode literalmente acabar a porra do servidor";
		
		msg[i] = "* Tá"; // g
		msg_sound[i] = snd_txt_gabee;
		i += 1;
		
		msg[i] = "* e tu não precisa mais ficar aqui"; // d
		msg[i] = "* é melhor tu passar um tempo lá na cidade depois disso";
		msg[i] = "* não é como se ele fosse levantar e tentar pular por cima do buraco de novo";
		
		msg[i] = "* ..."; // g
		msg_sound[i] = snd_txt_gabee;
		i += 1;
		msg[i] = "* Tu não tá triste com isso?";
		
		msg[i] = "* eu estou triste"; // d
		msg[i] = "* você pode ter certeza disso";
		
		
		msg_font[5] = fnt_main;
		msg_sound[5] = snd_txt_gabee;
		
		msg_font[6] = global.fnt_dsans;
		msg_sound[6] = snd_txt_dsans;
		
		msg_font[7] = fnt_main;
		msg_sound[7] = snd_txt_gabee;
		
		msg_font[8] = global.fnt_dsans;
		msg_sound[8] = snd_txt_dsans;
		
		msg_font[9] = fnt_main;
		msg_sound[9] = snd_txt_gabee;
		
		msg_font[11] = global.fnt_dsans;
		msg_sound[11] = snd_txt_dsans;
		
		msg_font[16] = fnt_main;
		msg_sound[16] = snd_txt_gabee;
		
		msg_font[17] = global.fnt_dsans;
		msg_sound[17] = snd_txt_dsans;
		
		msg_font[20] = fnt_main;
		msg_sound[20] = snd_txt_gabee;
		
		msg_font[22] = global.fnt_dsans;
		msg_sound[22] = snd_txt_dsans;
		*/
	}
		
	// dropped item
	if (text == "droppeditem_pickup")
		msg[0] = string(get_text("item_pickup")) + string(global.droppeditem_pickupname) + ".)";
	if (text == "droppeditem_cantpickup")
		msg[0] = get_text("item_cantpickup");
	
	if (string_starts_with(text, "battle_bubble") == 1) // bubble
	{
		msg_format[0] = "bubble";
		msg_font[0] = global.fnt_dotum;
		
		if (text == "battle_bubble_sans1")
		{
			msg[0] = "what?^1 you think i wanna hurt you?";
			msg_font[0] = global.fnt_comicsans;
		}
		if (text == "battle_bubble_sans2")
		{
			msg[0] = "so...";
			msg[1] = "i guess this is it,^1 huh?";
			msg[2] = "just...";
			msg[3] = "don't say i didn't&warn you.";
			msg_font[0] = global.fnt_comicsans;
		}
		if (text == "battle_bubble_sans3")
		{
			msg[0] = "rápido! pule de um penhasco!";
			msg_font[0] = global.fnt_comicsans;
		}
		if (text == "battle_bubble_test")
		{
			msg[0] = "You know what I love the most?";
			msg[1] = "You.^1&Humans.^1&All of you.";
			msg[2] = "Just kidding,^1 I fucking hate you.";
			
			if (controller.battle_group == -3)
				msg_type[0] = 1;
			if (controller.battle_group == -4)
				msg_type[0] = 2;
		}
		
		if (text == "battle_bubble_dummy") // Dummy
		{
			msg[0] = "+F1......";
			if (controller.battle_usedact == 1 && controller.level_heard == 1 && controller.enemy_obj[0].stage == 6)
				msg[0] = "+F1.....!";
		}
		if (string_starts_with(text, "battle_bubble_armsguy") == 1) // Armsguy
		{
			if (controller.battle_group >= 7 && controller.battle_group <= 10)
				msg_type[0] = 4;
			
			if (text == "battle_bubble_armsguy0") // Armsguy
			{
				var _num = irandom(7);
				msg[0] = get_text("battle_bubble_armsguy_" + string(_num));
			}
			if (text == "battle_bubble_armsguy1")
			{
				var _num = irandom_range(8, 10);
				msg[0] = get_text("battle_bubble_armsguy_" + string(_num));	
			}
			if (text == "battle_bubble_armsguy2") || (text == "battle_bubble_armsguy3")
			{
				var _act = "clean";
				if (text == "battle_bubble_armsguy3")
					_act = "punch";
			
				var _num = irandom(2);
				msg[0] = get_text("battle_bubble_armsguy_" + string(_act) + "_" + string(_num));
			}
		}
		if (string_starts_with(text, "battle_bubble_trashguy") == 1) // Trashguy
		{
			if (controller.battle_group == 8)
				msg_type[0] = 4;
			
			if (text == "battle_bubble_trashguy0") // Armsguy
			{
				var _num = irandom(4);
				msg[0] = get_text("battle_bubble_trashguy_" + string(_num));
			}
			if (text == "battle_bubble_trashguy1") || (text == "battle_bubble_trashguy2")
			{
				var _amt0 = 5;
				var _amt1 = 7;
				if (text == "battle_bubble_trashguy2")
				{
					_amt0 = 8;
					_amt1 = 10;
				}
				var _num = irandom_range(_amt0, _amt1);
				msg[0] = get_text("battle_bubble_trashguy_" + string(_num));	
			}
			if (text == "battle_bubble_trashguy3") || (text == "battle_bubble_trashguy4")
			{
				var _act = "empty";
				if (text == "battle_bubble_trashguy4")
					_act = "kick";
			
				var _num = irandom(2);
				msg[0] = get_text("battle_bubble_trashguy_" + string(_act) + "_" + string(_num));
			}
		}
		if (text == "battle_bubble_flitcher") // Flitcher
		{
			msg[0] = "+F1...";
			msg_type[0] = 3;
		}
		
		if (string_starts_with(text, "battle_bubble_brock") == 1) // Broken Clock
		{
			msg_sound[0] = snd_txt_brock;
			
			if (text == "battle_bubble_brock0") // normal
			{
				var _geno = enemy.geno;
				var _round = clamp(controller.battle_round, 0, 7);
				if (controller.enemy_spare[enemy.myself] >= 100)
					_round = 7;
				
				for (var i = 0; i < 99; i++)
				{
					var _curmsg = get_text("battle_bubble_brock_" + string(_round) + "_" + string(i) + "_" +  string(_geno));
					if (_curmsg != undefined)
						msg[i] = _curmsg;
				}
			}	
			if (text == "battle_bubble_brock1") // fight attempt
			{
				for (var i = 0; i < 3; i++)
					msg[i] = get_text("battle_bubble_brock_fight_" + string(i) + "_0");
			}
		}
	}
	else if (string_starts_with(text, "battle_") == 1) // battlebox
	{
		msg_next[0] = 0;
		msg_font[0] = fnt_main_big;
		msg_format[0] = "battlebox";
		
		// default
		if (text == "battle_main")
		{
			msg[0] = "* battle_main";
			
			var _groupname = "";
			var _group = controller.battle_group;
			if (_group == 2)
				_groupname = "armsguy";
			if (_group == 3)
				_groupname = "trashguy";
			if (_group == 4)
				_groupname = "flitcher";
			if (_group == 5)
				_groupname = "eyecrush";
			if (_group == 6)
				_groupname = "brock";
			if (_group == 7)
				_groupname = "armsguy_armsguy";
			if (_group == 8)
				_groupname = "trashguy_armsguy";
			if (_group == 9)
				_groupname = "armsguy_flitcher";
			if (_group == 10)
				_groupname = "eyecrush_armsguy";
			if (_group == 11)
				_groupname = "eyecrush_flitcher";
			if (_group == 13)
				_groupname = "rhonhey";
			if (_group == 1000)
				_groupname = "troll";
			if (_group == 2000)
				_groupname = "toilet";
			
			var _enemylist = [];
			for (var e = 0; e < controller.enemy_length; e++)
			{
				if (controller.enemy_type[e] != 0)
					array_push(_enemylist, controller.enemy_type[e]);
			}
			_type = _enemylist[irandom(array_length(_enemylist) - 1)];
			
			var _max = 0;
			var _name = "";
			if (_type == 2)
			{
				_name = "armsguy";
				_max = 7;
			}
			if (_type == 3)
			{
				_name = "trashguy";
				_max = 4;
			}
			if (_type == 4)
			{
				_name = "flitcher";
				_max = 4;
			}
			if (_type == 5)
			{
				_name = "eyecrush";
				_max = 4;
			}
			if (_type == 6)
			{
				_name = "brock";
				_max = 8;
			}
			if (_type == 7)
			{
				_name = "rhonhey";
				_max = 4;
			}
			if (_type == 1000)
			{
				_name = "troll";
				_max = 3;
			}
			if (_type == 2000)
			{
				_name = "toilet";
				_max = 0;
			}
			
			if (controller.battle_round == 0) // first
				msg[0] = get_text("battle_main_" + string(_groupname));
			else // normal
			{
				var _num = irandom(_max);
				msg[0] = get_text("battle_main_" + string(_name) + "_" + string(_num));
			}
			if (msg[0] == undefined)
				msg[0] = "* Salenis";
			
			// old main msg
			if (controller.battle_oldmainmsg != "%%%")
				msg[0] = controller.battle_oldmainmsg;
			controller.battle_oldmainmsg = msg[0];
			
			// can spare
			var _amt = 0;
			var _enemy1 = -1;
			var _enemy2 = -1;
			var _enemy3 = -1;
			for (var i = 0; i < controller.enemy_length; i++)
			{
				name[i] = "";
				if (controller.enemy_type[i] != 0 && controller.enemy_spare[i] >= 100)
				{
					name[i] = controller.enemy_name[i];
					_amt += 1;
					
					if (_enemy1 == -1)
						_enemy1 = i;
					else if (_enemy2 == -1)
						_enemy2 = i;
					else if (_enemy3 == -1)
						_enemy3 = i;
				}
			}
			if (_amt > 0)
			{
				var _custom = 0;
				if (controller.enemy_type[_enemy1] == 3 && controller.enemy_obj[_enemy1].kicked == 1)
					_custom = 1;
				if (controller.enemy_type[_enemy1] == 5 && controller.enemy_obj[_enemy1].hypnotized >= 1)
					_custom = 2;
				if (controller.enemy_type[_enemy1] == 7 && controller.enemy_obj[_enemy1].punched == 1 && controller.enemy_obj[_enemy1].terrorized == 1)
					_custom = 3;
				if (controller.enemy_type[_enemy1] == 6 && controller.enemy_obj[_enemy1].convince >= 5)
					_custom = 4;
				msg[0] = "* " + string(name[_enemy1]) + get_text("battle_main_sparing_0_" + string(_custom));
				if (_amt == 2)
					msg[0] = "* " + string(name[_enemy1]) + get_text("battle_main_sparing_1_0") + string(name[_enemy2]) + get_text("battle_main_sparing_1_1");
				else if (_amt == 3)
					msg[0] = "* " + string(name[_enemy1]) + ", " + string(name[_enemy2]) + get_text("battle_main_sparing_1_0") + string(name[_enemy3]) + get_text("battle_main_sparing_1_1");
			}
			
			// special
			if (controller.battle_group == 1) // Dummy
			{
				var _enemy = controller.enemy_obj[0];
				var _finalpage = 6;
				if (_enemy.stage == 2) || (_enemy.stage == 3)
					_finalpage = 4;
				else if (_enemy.stage == 4) || (_enemy.stage == 5)
					_finalpage = 2;
				else if (_enemy.stage == 6) || (_enemy.stage == 7)
					_finalpage = 4;
				if ((_enemy.stage / 2) == round(_enemy.stage / 2))
				{
					// get dialog
					for (var i = 0; i < 99; i++)
					{
						var _curmsg = get_text("battle_main_dummy_" + string(_enemy.stage) + "_" + string(i));
						if (_curmsg != undefined)
							msg[i] = _curmsg;
						else
							break;
					}
					
					// get faces and sounds
					msg_next[0] = 1;
					msg_face[0] = spr_dialogface_m6_default;
					msg_sound[0] = snd_txt_m6;
					
					msg_next[_finalpage] = 0;
					msg_face[_finalpage] = -1;
					msg_sound[_finalpage] = snd_txt1;

					_enemy.stage += 1;
				}
				else
					msg[0] = get_text("battle_main_dummy_" + string(_enemy.stage - 1) + "_" + string(_finalpage));
			}
		}
		
		if (text == "battle_enemylist")
		{
			for (var i = 0; i < controller.enemy_length; i++)
			{
				name[i] = "";
				if (controller.enemy_type[i] != 0)
				{
					var _spare = "";
					if (controller.enemy_spare[i] >= 100)
						_spare = ";Y";
					name[i] = "   " + string(_spare) + "* " + string(controller.enemy_name[i]) + ";D";
				}
			}
			
			msg[0] = string(name[0]) + "&!" + string(name[1]) + "&!" + string(name[2]);
			msg_autoskip[0] = 1;
		}
		
		if (text == "battle_actlist")
		{
			target = controller.enemy_target;
			
			for (var i = 0; i < 6; i++)
			{
				act_name[i] = "";
				act_space[i] = "";
				
				if (controller.enemy_act[target, i] != "")
				{	
					act_name[i] = "   * " + string(controller.enemy_act[target, i]);
						
					for (var z = 0; z < (11 - string_length(controller.enemy_act[target, i])); z++)
						act_space[i] += " ";
				}
			}

			msg[0] = string(act_name[0]) + string(act_space[0]) + string(act_name[1]) + "&!" + string(act_name[2]) + string(act_space[2]) + string(act_name[3]) + "&!" + string(act_name[4]) + string(act_space[4]) + string(act_name[5])
			msg_autoskip[0] = 1;
		}
		
		if (text == "battle_itemlist")
		{
			item_organize();
			
			for (var i = 0; i < global.item_length; i++)
			{
				name[i] = "";
				space[i] = "";
				
				var _type = "small";
				if (controller.battle_serious == 1)
					_type = "serious";
				
				if (global.item[i] != 0)
				{
					name[i] = ("   * " + string(item_name(global.item[i], _type)));
				
					// set space between options
					for (var z = 0; z < (11 - string_length(item_name(global.item[i], _type))); z++)
						space[i] += " ";
				}
			}
				
			msg[0] = (string(name[0]) + space[0] + string(name[1]) + "&!" + string(name[2]) + space[2] + string(name[3]) + "&!" + string(name[4]) + space[4] + string(name[5]));
			msg_autoskip[0] = 1;
		}
		
		if (text == "battle_useitem")
		{
			inventory_itemuse_dialog();
			msg_next[0] = 1;
		}
		
		if (text == "battle_mercy")
		{
			var _spare = "";
			for (var i = 0; i < controller.enemy_length; i++)
			{
				if (controller.enemy_type[i] != 0 && controller.enemy_spare[i] >= 100)
					_spare = ";Y";
			}
			
			var _flee = "";
			if (controller.battle_flee == 0)
				_flee = ";G";
			
			msg[0] = "   " + string(_spare) + "* Spare;D&!   " + string(_flee) + "* Flee";	
			msg_autoskip[0] = 1;
		}
		
		if (text == "battle_won")
		{
			if (controller.battle_group != 0)
			{
				lvlup = "";
				if (page == 0)
				{
					global.chara_exp += controller.battle_expreward;
					global.chara_money += controller.battle_mnyreward;
					chara_stats();
					if (lvlup == 1)
					{
						lvlup = get_text("battle_won_2");
						audio_play(snd_lvlup, 0, VOLUME_SOUND);
						debug("--- level up !!!! Yay!! Yay!!! Yiippee!! Woaahoo!!! Hehehaha!!!! Hahahehehihoho  Yay ha!!!!!");
					}
				}
			
				msg[0] = get_text("battle_won_0") + string(controller.battle_expreward) + get_text("battle_won_1") + string(controller.battle_mnyreward) + ";D.)" + string(lvlup);
			}
			else
			{
				msg[0] = get_text("battle_nobody");
				msg_type[0] = "nobody";
				msg_font[0] = fnt_main;
				msg_skip[0] = 0;
			}
			msg_next[0] = 1;
		}
		
		if (text == "battle_fleeing")
		{
			var _msgAmount = 0;
			for (var m = 0; m < 99; m++)
			{
				if (get_text($"battle_flee_{m}") == undefined)
				{
					_msgAmount = m;
					break;
				}
			}
			var _msg = irandom(_msgAmount - 1);
			msg[0] = $"   {get_text("battle_flee_" + string(_msg))}";
			msg_autoskip[0] = 1;
		}
		
		// act
		if (string_starts_with(text, "battle_act_") == 1)
		{
			// "* [---] - [- ATK | - DEF]^1 &* [---]"
			msg_next[0] = 1;
			
			if (text == "battle_act_toilet0") // Toilet
			{
				msg[0] = "* Toilet - [?? ATK | ?? DEF]^1 &* A giant toilet.";
				msg[1] = "* A disgusting smell comes from the inside of it.";
				msg[2] = "* The toilet is too big for you to see what is causing the smell.";
			}
			if (text == "battle_act_toilet1") // Toilet
			{
				msg[0] = "* (You flushed the toilet.)";
				msg[1] = "* (Suddenly,^1 the smell stops.)";
				msg[2] = "* (Then,^1 you understand.)";
				msg[3] = "* (The toilet^4 is finally^4 free.)";
				msg[4] = "* (It smiles and thanks you for freeing it.)";
				msg[5] = "* (You feel like a weight has been lifted from your shoulders.)";
			}
			if (text == "battle_act_sans0") // Sans
				msg[0] = "* Sans - [1 ATK - 1 DEF]^1&* Sans Undertale!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!";
			
			if (text == "battle_act_test0") // Test
				msg[0] = "* TESTE - [0 ATK - 0 DEF]^1&* Likes to be tested on.^1&* Or not,^1 I don't really care.";
			if (text == "battle_act_test1")
			{
				msg[0] = "* i fucking hate TESTE";
				msg[1] = "why";
				msg[2] = "* shut up";
				
				msg_format[1] = "bubble";
				msg_font[1] = global.fnt_dotum;
				
				msg_format[2] = "battlebox";
				msg_font[2] = fnt_main_big;
			}
			
			if (text == "battle_act_dummy0") // Dummy
			{
				for (var i = 0; i < 3; i++)
					msg[i] = get_text("battle_act_result_dummy_0_" + string(i));
			}
			if (text == "battle_act_dummy1")
			{
				if (controller.enemy_obj[0].stage != 5)
					msg[0] = get_text("battle_act_result_dummy_1_0");
				else
				{
					msg[0] = $"{get_text("battle_act_result_dummy_1_1_0_0")}{get_text("battle_act_result_dummy_1_1_0_1_" + string(irandom(3)))}{get_text("battle_act_result_dummy_1_1_0_2")}";
					msg[1] = get_text("battle_act_result_dummy_1_1_1");
				}
			}
			if (text == "battle_act_dummy2")
			{
				for (var i = 0; i < 2; i++)
					msg[i] = get_text("battle_act_result_dummy_2_" + string(i));
				if (controller.enemy_obj[0].stage >= 3)
				{
					var _screamed = controller.enemy_obj[0].screamed;
					_screamed = clamp(_screamed, 0, 3);
					msg[2] = get_text("battle_act_result_dummy_2_2_" + string(_screamed));
					msg_face[2] = spr_dialogface_m6_sassy;
					if (_screamed == 3)
						msg_face[2] = spr_dialogface_m6_angry;
					msg_sound[2] = snd_txt_m6;
				}
			}
			
			if (text == "battle_act_armsguy0") // Armsguy
			{
				msg[0] = get_text("battle_act_result_armsguy_0_0");
				msg[1] = get_text("battle_act_result_armsguy_0_1");
			}
			if (text == "battle_act_armsguy1")
				msg[0] = get_text("battle_act_result_armsguy_1");
			if (text == "battle_act_armsguy2")
				msg[0] = get_text("battle_act_result_armsguy_2");
			
			if (text == "battle_act_trashguy0") // Trashguy
			{
				msg[0] = get_text("battle_act_result_trashguy_0_0");
				msg[1] = get_text("battle_act_result_trashguy_0_1");
			}
			if (text == "battle_act_trashguy1_0")
				msg[0] = get_text("battle_act_result_trashguy_1_0");
			if (text == "battle_act_trashguy1_1")
				msg[0] = get_text("battle_act_result_trashguy_1_1");
			if (text == "battle_act_trashguy2")
				msg[0] = get_text("battle_act_result_trashguy_2");
			
			if (text == "battle_act_flitcher0") // Flitcher
			{
				msg[0] = get_text("battle_act_result_flitcher_0_0");
				msg[1] = get_text("battle_act_result_flitcher_0_1");
				msg[2] = get_text("battle_act_result_flitcher_0_2");
			}
			if (text == "battle_act_flitcher1")
				msg[0] = get_text("battle_act_result_flitcher_1");
			if (text == "battle_act_flitcher2")
				msg[0] = get_text("battle_act_result_flitcher_2");
			
			if (text == "battle_act_eyecrush0") // Eyecrush
			{
				msg[0] = get_text("battle_act_result_eyecrush_0_0");
				msg[1] = get_text("battle_act_result_eyecrush_0_1");
			}
			if (text == "battle_act_eyecrush1")
			{
				msg[0] = get_text("battle_act_result_eyecrush_1_0");
				msg[1] = get_text("battle_act_result_eyecrush_1_1");
			}
			if (text == "battle_act_eyecrush2_0") || (text == "battle_act_eyecrush2_1")
			{
				msg[0] = get_text("battle_act_result_eyecrush_2_0");
				msg[1] = get_text("battle_act_result_eyecrush_2_1_0");
				if (text == "battle_act_eyecrush2_1")
					msg[1] = get_text("battle_act_result_eyecrush_2_1_1");
			}
			
			if (text == "battle_act_rhonhey0") // Rhonhey
				msg[0] = get_text("battle_act_result_rhonhey_0");
			if (text == "battle_act_rhonhey1")
			{
				if (enemy.punched == 0)
				{
					msg[0] = get_text("battle_act_result_rhonhey_1_0_0");
					msg[1] = get_text("battle_act_result_rhonhey_1_0_1_0");
					if (enemy.terrorized == 1)
						msg[1] = get_text("battle_act_result_rhonhey_1_0_1_1");
					controller.enemy_spare[enemy.myself] += 50;
					enemy.punched = 1;
				}
				else
					msg[0] = get_text("battle_act_result_rhonhey_1_1");
			}
			if (text == "battle_act_rhonhey2")
			{
				msg[0] = get_text("battle_act_result_rhonhey_2_0");
				msg[1] = get_text("battle_act_result_rhonhey_2_1");
			}
			if (text == "battle_act_rhonhey3")
			{
				if (enemy.terrorized == 0)
				{
					msg[0] = get_text("battle_act_result_rhonhey_3_0_0");
					msg[1] = get_text("battle_act_result_rhonhey_3_0_1_0");
					if (enemy.punched == 1)
						msg[1] = get_text("battle_act_result_rhonhey_3_0_1_1");
					controller.enemy_spare[enemy.myself] += 50;
					enemy.terrorized = 1;
				}
				else
					msg[0] = get_text("battle_act_result_rhonhey_3_1");
			}

			if (string_starts_with(text, "battle_act_brock") == 1) // Broken Clock
			{
				var _geno = enemy.geno;
				var _convince = enemy.convince;
				
				if (controller.enemy_spare[enemy.myself] < 100) // normal
				{
					if (text == "battle_act_brock0")
					{
						msg[0] = get_text("battle_act_result_brock_0_0_" + string(_geno));
						msg[1] = get_text("battle_act_result_brock_0_1_" + string(_geno));
					}
					if (text == "battle_act_brock1")
					{
						msg[0] = get_text("battle_act_result_brock_1_0_" + string(_geno));
						msg[1] = get_text("battle_act_result_brock_1_1_" + string(_geno));
					}
					if (text == "battle_act_brock2")
						msg[0] = get_text("battle_act_result_brock_2_" + string(_geno));
					if (text == "battle_act_brock3")
					{
						var _page = 0;
						msg[_page] = get_text($"battle_act_result_brock_3_{_page}_" + string(_geno));
						_page += 1;
						question[_page] = "";
						question_option[1] = get_text($"battle_act_result_brock_3_{_page}_" + string(_convince) + "_1");
						question_option[2] = get_text($"battle_act_result_brock_3_{_page}_" + string(_convince) + "_2");
						if (question_result[_page] != 0)
						{
							var _result = question_result[_page];
							var _right = 0;
							if (_convince == 0 && _result == 1)
							|| (_convince == 1 && _result == 1)
							|| (_convince == 2 && _result == 2)
							|| (_convince == 3 && _result == 1)
							|| (_convince == 4 && _result == 1)
							{
								_right = 1;
								audio_play(snd_battle_mercy_sucess, 0, VOLUME_SOUND)
								controller.enemy_spare[enemy.myself] += 20;
								enemy.convince += 1;
							}
							else
								audio_play(snd_battle_mercy_fail, 0, VOLUME_SOUND)
							_page += 1;
							for (var i = 0; i < 99; i++)
							{
								var _curmsg = get_text("battle_bubble_brock_convince_" + string(_convince) + "_" + string(_right) +  "_" + string(i));
								if (is_undefined(_curmsg) == false)
									msg[(i + _page)] = _curmsg;
								else
								{
									var _id = get_text($"battle_act_result_brock_3_2_{_right}");
									if (is_undefined(_id) == false && (_right == 1 && _convince > 0) == false)
									{
										var _lastpage = (i + _page);
										msg[_lastpage] = _id;
										msg_font[_lastpage] = fnt_main_big;
										msg_sound[_lastpage] = snd_txt1;
										msg_format[_lastpage] = "battlebox";
									}
									break;
								}
							}
							msg_font[_page] = global.fnt_dotum;
							msg_sound[_page] = snd_txt_brock;
							msg_format[_page] = "bubble";
							enemy.body.movement = 1;
						}
					}
				}
				else // convinced
					msg[0] = get_text("battle_act_result_brock_convinced");
			}
		}
	}
	
	// subtle shake
	if (msg_format[page] == "battlebox" && (controller.battle_group == 6 || controller.battle_group == 1000) && controller.enemy_spare[0] < 100)
	{
		var i = page;
		while (msg[i] != "%%%" && (msg_format[i] == "battlebox" || msg_format[i] == -2))
		{
			msg[i] = "+S3" + string(msg[i]);
			i += 1;
		}
	}
}












