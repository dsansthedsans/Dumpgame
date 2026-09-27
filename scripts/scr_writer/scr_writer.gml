
function writer(_text, _optionalx = -1, _optionaly = -1, _infoArray = [])
{	
	global.writer_text = _text;
	global.writer_old = global.writer;
	global.writer_infoArray = _infoArray;
	global.writer = instance_create_layer(-20, -20, "Instances", obj_writer_controller);
	global.writer.bubble_x = round(_optionalx);
	global.writer.bubble_y = round(_optionaly);
	global.writer_enemy = -1;
	thiswriter = global.writer;
}
function TEXT()
{
	// room_story
	if (text == "event_story")
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"event_story_{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		msg_skip[0] = true//false;
		msg_next[0] = true//false;
		msg_type[0] = "event_story";
		msg_sound[0] = snd_writer_1;
	}
	// room_corridors_1
	if (text == "room_lamp")
		msg[0] = textdata_get($"room_lamp_0{(chara_murder() < 1) ? "" : "_geno"}");
	if (text == "room_brokenlamp")
		msg[0] = textdata_get($"{text}{(chara_murder() < 1) ? "" : "_geno"}");
	// room_corridors_1_5
	if (string_starts_with(text, "room_rockpile_") == true)
	{
		msg[0] = textdata_get($"room_rockpile_{string_char_at(text, string_length(text))}_0");
	}
	if (string_starts_with(text, "event_rhonhey_battle_") == true)
	{
		var _text_index = string_char_at(text, string_length(text));
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"event_rhonhey_battle_{_text_index}_{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		msg_face[0] = spr_dialogface_m6_neutral;
		msg_sound[0] = snd_writer_m6;
		if (instance_exists(obj_event_rhonhey_battle) == true && exists(obj_event_rhonhey_battle.m6) == true)
			msg_talker[0] = obj_event_rhonhey_battle.m6;
		switch (_text_index)
		{
			case 0:
			msg_face[1] = spr_dialogface_m6_default;
			msg_face[2] = spr_dialogface_m6_thinking;
			msg_face[3] = spr_dialogface_m6_default;
			break;
		}
		
		
	}
	// room_corridors_2
	if (string_starts_with(text, "event_m6_meet_") == true)
	{
		var _text_index = string_char_at(text, string_length(text));
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"event_m6_meet_{_text_index}_{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			//switch (_text_index)
			//{
			//	case 2:
			//	if (m == 4)
			//	{
			//		question[m] = _msg;
			//		for (var a = 1; a <= 2; a++)
			//			question_option[a] = textdata_get($"event_m6_meet_{_text_index}_{m}_{a}");
			//		continue;
			//	}
			//	break;
			//}
			msg[m] = _msg;
		}
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_writer_m6;
		msg_format[0] = "textbox_bottom";
		if (exists(obj_event_m6_meet) == true)
			msg_talker[0] = obj_event_m6_meet.m6;
		switch (_text_index)
		{
			case 0:
			msg[0] = string_replace_all(msg[0], "[name]", $"{global.chara_name}");	
			msg_skip[0] = false;
			msg_next[2] = false;
			msg_sound[2] = -1;
			break;
			case 1:
			break;
			case 2:
			msg_face[0] = spr_dialogface_m6_sadTense;
			msg_face[3] = spr_dialogface_m6_sad;
			msg_sound[0] = snd_writer_m6_tense;
			break;
		}
	}
	if (text == "room_m6_banner")
	{
		msg[0] = textdata_get("room_m6_banner_0");
		msg[1] = textdata_get("room_m6_banner_1");
	}
	if (text == "room_m6_poster")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = textdata_get("room_m6_poster_" + string(i));
	}
	if (text == "room_m6_papers")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = textdata_get("room_m6_papers_" + string(i));
	}
	if (text == "room_m6_brokenwall")
	{
		msg[0] = textdata_get("room_m6_brokenwall_0");
		if (chara_murder() < 1)
			msg[1] = textdata_get("room_m6_brokenwall_1");
		msg_format[0] = "textbox_bottom";
		if (global.ACHIEVEMENT_ENABLED == true && global.achievement[ACHIEVEMENT_M6TOY]  == false)
		{
			achievement_add(ACHIEVEMENT_M6TOY);
			create_notification("m6toy");
		}
	}
	// room_corridors_3
	if (text == "room_stairssign")
	{
		for (var m = 0; m < 3; m++)
			msg[m] = textdata_get($"room_stairssign_{m}");
	}
	if (text == "room_rulesbook")
	{
		msg[0] = textdata_get($"room_rulesbook_0");
		if (chara_murder() < 1)
		{
			for (var m = 1; m < 3; m++)
				msg[m] = textdata_get($"room_rulesbook_{m}");
			question[m] = textdata_get($"room_rulesbook_{m}.0");
			if (global.flag[67] > 0)
				question[m] = $"{textdata_get("room_rulesbook_" + string(m) + ".1_0")}{(global.flag[67] + 1)}{textdata_get("room_rulesbook_" + string(m) + ".1_" + string(clamp(global.flag[67], 1, 3)))}"
			question_option[1] = textdata_get($"room_rulesbook_{m}_1");
			question_option[2] = textdata_get($"room_rulesbook_{m}_2");
			if (question_result[m] == 1)
			{
				var _text = textdata_get($"room_rulesbook_{m+2}-{global.flag[67]}");
				if (_text != undefined && _text != "Salenis")
				{
					msg[m+1] = textdata_get($"room_rulesbook_{m+1}.{(global.flag[67] > 0)}");
					msg[m+2] = textdata_get($"room_rulesbook_{m+2}-{global.flag[67]}");
					if (global.flag[67] > 0)
						msg_skip[m+2] = false;
					global.flag[67] += 1;
					audio_play(snd_interact_rulesbook, 0, VOLUME_SOUND);
				}
				else
				{
					msg[m+1] = textdata_get($"room_rulesbook_{m+3}");
					msg_skip[m+1] = false;
				}
			}
		}
	}
	if (text == "room_deadlamp")
		msg[0] = textdata_get($"{text}{(chara_murder() < 1) ? "" : "_geno"}");
	// room_corridors_3_5
	if (string_starts_with(text, "event_dummy_battle_") == true)
	{
		var _text_index = string_char_at(text, string_length(text));
		for (var i = 0; i < 99; i++)
		{
			var _msg_id = $"event_dummy_battle_{_text_index}_{i}";
			var _msg = textdata_get(_msg_id);
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[i] = _msg;
		}
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_writer_m6;
		msg_format[0] = "textbox_top";
		switch (_text_index)
		{
			case 0:
			msg_face[4] = spr_dialogface_m6_thinking;
			msg_face[7] = spr_dialogface_m6_neutral;
			msg_face[8] = spr_dialogface_m6_default;
			break;
			case 1:
			msg_face[1] = spr_dialogface_m6_sassy;
			msg_face[2] = spr_dialogface_m6_default;
			break;
			case 2:
			msg_face[0] = spr_dialogface_m6_sassy;
			msg_face[1] = spr_dialogface_m6_default;
			break;
			case 3:
			msg_face[0] = spr_dialogface_m6_angry;
			break;
		}
	}
	if (text == "npc_dummy")
	{
		msg[0] = textdata_get("npc_dummy_0");
		if (global.flag[4] == true && global.flag[6] == false && global.flag[7] == false)
		{
			question[1] = textdata_get("npc_dummy_1");
			question_option[1] = textdata_get("npc_dummy_1_1");
			question_option[2] = textdata_get("npc_dummy_1_2");
			if (question_result[1] == 1)
			{
				global.flag[6] = true;
				chara_change(-1, false, false, true, false, false, true);
				global.battle_nextgroup = 1;
				//audio_stop(snd_option_select);
				battle();
			}
		}
		else if (global.flag[4] == true && global.flag[6] == true && global.flag[7] == true && chara_murder() <= 0)
			msg[0] = "* .....!";
	}
	// room_corridors_4
	if (text == "savepoint")
	{
		var _text_index = undefined;
		switch (room)
		{
			case room_corridors_4:
			_text_index = 0;
			break;
			case room_corridors_8:
			_text_index = 1;
			break;
			case room_corridors_11:
			_text_index = 2;
			break;
			case room_corridors_13:
			_text_index = 3;
			break;
			case room_corridors_17:
			_text_index = 4;
			break;
		}
		var p = 0;
		if (_text_index != undefined && chara_murder() < 1)
		{
			for (var p = 0; p < 99; p++)
			{
				var _msg = textdata_get($"savepoint_{_text_index}_{p}");
				if (_msg == undefined) || (_msg == "Salenis")
					break;
				msg[p] = _msg;
			}
			msg[p++] = textdata_get("savepoint_all_0");
		}
		question[p] = textdata_get("savepoint_all_1");
		question_option[1] = textdata_get("savepoint_all_1_1");
		question_option[2] = textdata_get("savepoint_all_1_2");
		msg_type[p] = "savepoint";
		if (question_result[p] == 1)
		{
			msg[p+1] = "";
			msg_type[p+1] = "savepoint";
			filesaved = 1;
		}
	}
	if (text == "npc_armsguy1")
	{
		for (var i = 0; i < 99; i++)
		{
			var _msg = textdata_get("npc_armsguy1_" + string(global.flag[24]) + "_" + string(i));
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[i] = _msg;
		}
		if (global.flag[24] == 0)
		{
			msg[0] = string_replace_all(msg[0], "[name]", $":@@{global.chara_name};D")
			global.flag[24] = 1;
		}
		msg_sound[0] = snd_writer_armsguy;
		msg_talker[0] = obj_chara.mycol;
	}
	// room_corridors_5
	if (text == "event_m6_captcha1_0")
	{
		for (var i = 0; i < 4; i++)
			msg[i] = textdata_get("event_m6_captcha1_0_" + string(i));
		msg_face[0] = spr_dialogface_m6_neutral;
		msg_face[1] = spr_dialogface_m6_neutralTense;
		msg_face[2] = spr_dialogface_m6_default;
		msg_sound[0] = snd_writer_m6;
		msg_format[0] = "textbox_bottom";
	}
	if (text == "room_captcha_mainsign_1")
	{
		for (var i = 0; i < 4; i++)
			msg[i] = textdata_get("room_captcha_mainsign_1_" + string(i));
	}
	if (text == "event_m6_captcha1_1")
	{
		for (var i = 0; i < 4; i++)
			msg[i] = textdata_get("event_m6_captcha1_1_" + string(i));
		msg_face[0] = spr_dialogface_m6_default;
		msg_face[1] = spr_dialogface_m6_pleased;
		msg_face[2] = spr_dialogface_m6_neutral;
		msg_face[3] = spr_dialogface_m6_default;
		msg_sound[0] = snd_writer_m6;
		msg_talker[0] = global.party[0];
		msg_format[0] = "textbox_bottom";
	}
	// room_corridors_5_A, room_corridors_5_B
	if (text == "room_captcha_guidesign_1")
	{
		for (var i = 0; i < 2; i++)
			msg[i] = textdata_get("room_captcha_guidesign_1_" + string(i));
	}
	// room_corridors_6
	if (text == "room_candybowl")
	{
		var _candyamt = global.flag[19];
		var _lastslot = global.item[global.item_last];
			
		// take candy
		if (_candyamt > 0)
		{
			var _start = textdata_get("room_candybowl_0_0_0") + textdata_get("room_candybowl_0_0_1");
			var _middle = "";
			var _end = "";	
			if (_candyamt > 1)
			{
				_middle = textdata_get("room_candybowl_0_0_3");
				_end = textdata_get("room_candybowl_0_0_5");
			}
			else
			{
				_middle = textdata_get("room_candybowl_0_0_2");
				_end = textdata_get("room_candybowl_0_0_4");
			}
			msg[0] = string(_start) + string(_middle) + string(_candyamt) + string(_end);
			question[1] = textdata_get("room_candybowl_0_1");
			question_option[1] = textdata_get("room_candybowl_0_1_1");
			question_option[2] = textdata_get("room_candybowl_0_1_2");
			if (question_result[1] == 1)
			{			
				if (_lastslot == -1)
				{
					msg[2] = textdata_get("room_candybowl_0_2");
					if (_candyamt == 3)
					{
						var _start = textdata_get("room_candybowl_0_3_0");
						var _firstkey = key_name(global.keybind[10]);
						var _middle = textdata_get("room_candybowl_0_3_1");
						var _secondkey = key_name(global.keybind[11]);
						var _end = textdata_get("room_candybowl_0_3_2");
						msg[3] = string(_start) + string_upper(_firstkey) + string(_middle) + string_upper(_secondkey) + string(_end);
					}
					global.flag[19] -= 1;
					global.item[global.item_last] = ITEM_CANDY;
					audio_play(snd_interact_item, 0, VOLUME_SOUND);
				}
				else
					msg[2] = textdata_get("room_candybowl_2");
			}
		}
			
		// take bowl
		else if (global.flag[20] == false)
		{
			for (var i = 0; i < 3; i++)
				msg[i] = textdata_get("room_candybowl_1_" + string(i));
			question[3] = textdata_get("room_candybowl_1_3");
			question_option[1] = textdata_get("room_candybowl_1_3_1");
			question_option[2] = textdata_get("room_candybowl_1_3_2");
			
			if (global.flag[21] == 0)
				msg_skip[0] = 0;
			global.flag[21] = 1;
				
			if (question_result[3] == 1)
			{
				if (_lastslot == -1)
				{
					msg[4] = textdata_get("room_candybowl_1_4");
					msg_skip[4] = 1;
					global.flag[20] = 1;
					global.item[global.item_last] = ITEM_BOWL;
					audio_play(snd_interact_item, 0, VOLUME_SOUND);
						
					if (global.ACHIEVEMENT_ENABLED == true && global.achievement[ACHIEVEMENT_SBHELMET] == 0)
					{
						global.achievement[ACHIEVEMENT_SBHELMET] = 1;
						create_notification("sbhelmet");
					}
				}
				else
					msg[4] = textdata_get("room_candybowl_2");
			}
		}
		else
		{
			for (var i = 0; i < (4 - (3 * (chara_murder() >= 1))); i++)
				msg[i] = textdata_get($"room_candybowl_3_{i}");
		}
	}
	if (text == "room_candysign")
	{
		for (var i = 0; i < 1; i++)
			msg[i] = textdata_get("room_candysign_" + string(i));
	}	
	if (text == "charamenu_item_use")
	{
		item_use();
		msg_format[0] = "textbox_bottom";
	}
	if (text == "charamenu_item_info")
	{
		item_info();
		msg_format[0] = "textbox_bottom";
	}
	if (text == "charamenu_item_drop")
	{
		msg[0] = $"* (:Y{item_name(global.item[obj_chara_menu.option_pos_old], "")};D {textdata_get("item_drop_" + string(irandom(4)))}";
		msg_format[0] = "textbox_bottom";
		itemDropped_create(itemDropped_add(global.item[obj_chara_menu.option_pos_old]));
		global.item[obj_chara_menu.option_pos_old] = -1;
		audio_play(snd_impactGrab, 0, VOLUME_SOUND);
	}
	if (text == "itemDropped_pickup")
		msg[0] = $"{textdata_get("item_pickup")} :Y{infoArray[0]};D.)";
	if (text == "itemDropped_cantpickup")
	{
		msg[0] = textdata_get("item_cantpickup");
		audio_play(snd_option_cantselect, false, VOLUME_SOUND);
		shakescreen(2, 2);
	}
	// room_corridors_7
	if (text == "room_relaxsign")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = textdata_get("room_relaxsign_" + string(i));
	}
	if (text == "room_bench_geno")
		msg[0] = textdata_get("room_bench_geno_0");
	if (text == "room_benchCardboard")
		msg[0] = textdata_get("room_benchCardboard_0");
	if (text == "room_benchlamp")
	{
		msg[0] = textdata_get("room_benchlamp_0");
		if (chara_murder() >= 1)
			msg[0] = textdata_get("room_benchlamp_0_geno");
	}
	if (text == "npc_trashguy")
	{
		for (var i = 0; i < 99; i++)
		{
			var _curmsg = textdata_get("npc_trashguy_" + string(i));
			if (_curmsg != undefined && _curmsg != "Salenis")
				msg[i] = _curmsg;
			else
				break;
		}
	}
	// room_corridors_8
	if (text == "room_rat_geno")
		msg[0] = textdata_get("room_rat_geno");
	if (text == "npc_armsguy_lost")
	{
		msg_sound[0] = snd_writer_armsguy;
		msg_talker[0] = obj_chara.mycol;
		if (global.flag[45] == 0 && global.flag[48] == 0)
		{
			msg[0] = $"{textdata_get("npc_armsguy_lost_0_0_0_0")}{global.chara_name}{textdata_get("npc_armsguy_lost_0_0_0_1")}";
			for (var i = 1; i < 99; i++)
			{
				var _curmsg = textdata_get("npc_armsguy_lost_0_0_" + string(i));
				if (_curmsg != undefined && _curmsg != "Salenis")
				{
					if (i != 3)
						msg[i] = _curmsg;
					else
					{
						question[i] = _curmsg;
						question_option[1] = textdata_get($"npc_armsguy_lost_0_0_{i}_1");
						question_option[2] = textdata_get($"npc_armsguy_lost_0_0_{i}_2");
						break;
					}
				}
			}
			msg_sound[i] = snd_writer_0;
			msg_talker[i] = -1;
			msg_sound[i+1] = snd_writer_armsguy;
			msg_talker[i+1] = obj_chara.mycol;
			var _result = question_result[i];
			if (_result == 1)
			{
				for (var b = 0; b < 1; b++)
					msg[i+1+b] = textdata_get("npc_armsguy_lost_0_1_" + string(b));
				global.flag[45] = 1;
			}
			else if (_result == 2)
				msg[i+1] = textdata_get("npc_armsguy_lost_0_2_0");
		}
		else
		{
			if (global.flag[48] == 0)
			{
				msg[0] = textdata_get("npc_armsguy_lost_1_0_0");
				msg[1] = textdata_get("npc_armsguy_lost_1_0_1");
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
						if (i >= 3)
							_bonus = "_" + string(_full);
						var _curmsg = textdata_get("npc_armsguy_lost_1_1_" + string(i) + string(_bonus));
						if (_curmsg != undefined && _curmsg != "Salenis")
							msg[i] = _curmsg;
						else
							break;
					}
					if (_full == 0)
					{
						msg_sound[4] = snd_writer_0;
						msg_talker[4] = -1;
						//msg_sound[6] = snd_writer_armsguy;
						//msg_talker[6] = obj_chara.mycol;
						global.flag[47] = 1;
						global.item[global.item_last] = ITEM_TRIDENT;
					}
				}
				else
					msg[0] = textdata_get("npc_armsguy_lost_1_2_0");
			}
		}
	}
	if (text == "npc_trashguy_lost2")
	{
		msg[0] = textdata_get("npc_trashguy_lost2");
		msg_talker[0] = obj_chara.mycol;
	}
	// room_corridors_9
	if (text == "event_m6_captcha2")
	{
		msg[0] = textdata_get("event_m6_captcha2_0");
		msg[1] = textdata_get("event_m6_captcha2_1");
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_writer_m6;
		msg_format[0] = "textbox_bottom";
	}
	if (text == "room_captcha_mainsign_2")
	{
		for (var i = 0; i < 2; i++)
			msg[i] = textdata_get("room_captcha_mainsign_2_" + string(i));
	}
	if (text == "room_captcha_guidesign_2")
	{
		for (var i = 0; i < 1; i++)
			msg[i] = textdata_get("room_captcha_guidesign_2_" + string(i));
	}
	if (text == "npc_trashguy_lost1")
	{
		for (var i = 0; i < 3; i++)
			msg[i] = textdata_get("npc_trashguy_lost1_" + string(i));
		msg_talker[0] = obj_chara.mycol;
		global.flag[48] = 1;
	}
				
	// obj_event_m6_postcaptcha2
	if (text == "event_m6_postcaptcha2")
	{
		msg[0] = textdata_get("event_m6_postcaptcha2_0");
		msg[1] = textdata_get("event_m6_postcaptcha2_1");
		msg_face[0] = spr_dialogface_m6_default;
		msg_sound[0] = snd_writer_m6;
		msg_format[0] = "textbox_bottom";
	}
				
	// room_corridors_10
	if (text == "room_chocobowl")
	{
		msg[0] = textdata_get("room_chocobowl_0");
		if (global.flag[36] == 0)
		{
			msg[1] = textdata_get("room_chocobowl_1");
			question[2] = textdata_get("room_chocobowl_2");
			question_option[1] = textdata_get("room_chocobowl_2_1");
			question_option[2] = textdata_get("room_chocobowl_2_2");
			if (question_result[2] == 1)
			{
				if (global.item[global.item_last] == -1)
				{
					msg[3] = textdata_get("room_chocobowl_3_0");
					global.flag[36] = 1;
					global.item[global.item_last] = ITEM_CHOCO;
					audio_play(snd_interact_item, 0, VOLUME_SOUND);
				}
				else
					msg[3] = textdata_get("room_chocobowl_3_1");
			}
		}
		else if (global.chara_armor == ITEM_BOWL && chara_murder() < 1)
			msg[0] = textdata_get("room_chocobowl_4");
	}
	if (text == "room_chocosign")
	{
		msg[0] = textdata_get("room_chocosign");
		if (chara_murder() >= 1)
			msg[0] = textdata_get("room_chocosign_geno");
	}
		
	// room_corridors_11
	if (text == "room_preclocksign")
	{
		for (var i = 0; i < 5; i++)
			msg[i] = textdata_get("room_preclocksign_" + string(i));
	}
	if (text == "room_trollwall")
	{
		for (var i = 0; i < 99; i++)
		{
			var _msg_id = $"room_trollwall_{i}";
			var _msg = textdata_get(_msg_id);
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[i] = _msg;
		}
	}
	
	// obj_event_brock_battle
	if (string_starts_with(text, "event_brock_battle_") == true)
	{
		var _text_index = string_char_at(text, string_length(text));
		for (var i = 0; i < 99; i++)
		{
			var _msg_id = $"event_brock_battle_{_text_index}_{i}";
			if (_text_index == 3 && i == 9)
				_msg_id += $"_{(global.item[global.item_last] == -1)}";
			if (_text_index == 4)
			{
				_msg_id += $"_{global.flag[38]}";
				//if (global.flag[38] == false && i >= 3)
				//	_msg_id += $"_{question_result[2]}";
			}
			var _msg = textdata_get(_msg_id);
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			if (_text_index == 4 && global.flag[38] == false && i == 2)
			{
				question[i] = _msg;
				for (var z = 1; z <= 2; z++)
					question_option[z] = textdata_get($"{_msg_id}_{z}");
				continue;
			}
			msg[i] = _msg;
		}
		msg_sound[0] = snd_writer_brock;
		msg_format[0] = "textbox_top";
		switch (_text_index)
		{
			case 0:
			msg_face[2] = spr_dialogface_m6_angry;
			msg_sound[2] = snd_writer_m6;
			msg_talker[2] = global.party[0];
			break;
			case 2:
			msg[1] = string_replace_all(msg[1], "[name]", global.chara_name);
			break;
			case 3:
			msg[2] = string_replace_all(msg[2], "[name]", global.chara_name);
			if (global.item[global.item_last] == -1)
			{
				msg_sound[9] = snd_writer_0;
				msg_sound[10] = snd_writer_brock;
			}
			break;
			case 4:
			msg_sound[0] = snd_writer_m6;
			msg_talker[0] = global.party[0];
			if (global.flag[38] == false)
			{
				msg_face[0] = spr_dialogface_m6_neutral;
				msg_face[2] = -1;
				msg_sound[2] = snd_writer_0;
				msg_talker[2] = -1;
				msg_face[3] = spr_dialogface_m6_angry;
				msg_sound[3] = snd_writer_m6_angry;
				msg_talker[3] = global.party[0];
				global.flag[72] = 0.5;
			}
			else 
			{
				msg_face[0] = spr_dialogface_m6_default;
				if (chara_murder() >= 1)
				{
					msg[i] = textdata_get($"event_brock_battle_4_{i}_1_geno");
					msg[i+1] = textdata_get($"event_brock_battle_4_{i+1}_1_geno");
					msg_face[i] = spr_dialogface_m6_angry;
					global.flag[72] = 0.5;
				}
			}
			break;
		}
	}
	if (text == "unused_event_brock_prebattle_6_genotest")
	{
		// spr_chara_u_knifepull
		msg[0] = "* WELL,^1 LOOKS LIKE THAT I WAS RIGHT.";
		msg[1] = "* YOU'RE NO DIFFERENT FROM THEM.";
		msg[2] = "* IF YOU REALLY WANT TO END IT LIKE THIS,^1 I WON'T STOP YOU.";
		msg[3] = "* BUT YOU'VE GOTTA UNDERSTAND.";
		msg[4] = "* IN A FIGHT AGAINST ME...";
		msg[5] = "* YOU'LL NEVER WIN!";
	}
	// room_corridors_13
	if (text == "unused_room_postclocksign")
	{
		msg[0] = "* \"Hey!\"^1&* \"Did you have fun?\"";
		msg[1] = "* \"Actually,^1 don't mind answering,^1 I'm just a sign.\"";
		msg[2] = "* \"But we hope you did!\"";
	}
	if (text == "npc_armsguy_postbrock")
	{
		if (global.flag[49] == 0)
		{
			for (var i = 0; i < 3; i++)
				msg[i] = textdata_get($"npc_armsguy_postbrock_0_{i}");
			if (global.flag[2] == true && exists(global.party[0]) == true)
			{
				msg[3] = "* ...";
				msg_face[3] = spr_dialogface_m6_angry;
				msg_sound[3] = snd_writer_m6_angry;
				msg_talker[3] = obj_party;
			}
			global.flag[49] = 1;
		}
		else
		{
			for (var i = 0; i < 3; i++)
				msg[i] = textdata_get($"npc_armsguy_postbrock_1_{i}");
		}
		msg_sound[0] = snd_writer_armsguy;
		msg_talker[0] = obj_chara.mycol;
	}
	if (text == "npc_flitcher_postbrock")
	{
		var _geno = "";
		if (chara_murder() >= 1)
			_geno = "_geno";
		for (var i = 0; i < (4 - (3 * (chara_murder() >= 1))); i++)
			msg[i] = textdata_get($"npc_flitcher_postbrock_{i}{_geno}");
	}
	if (text == "unused_room_maurice")
	{
		msg[0] = "* (It's a rock in the format of a head.)";
		msg[1] = "* (The name \"Maurice\" is engraved in its forehead.)";
	}
	
	// room_corridors_14
	if (text == "event_m6_captcha3")
	{
		for (var i = 0; i < 99; i++)
		{
			var _msg_id = $"{text}_{i}";
			if (i == 0 && global.flag[72] != undefined && global.flag[72] < 1)
				_msg_id += "_geno";
			else if ((i == 2 || i == 3) && chara_murder() >= 1)
				_msg_id += "_geno";
			var _msg = textdata_get(_msg_id);
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[i] = _msg;
		}
		if (global.flag[72] == true && chara_murder() < 1)
			msg_face[0] = spr_dialogface_m6_serious;
		else if (global.flag[72] == true && chara_murder() >= 1)
		{
			msg_face[0] = spr_dialogface_m6_neutral;
			msg_face[3] = spr_dialogface_m6_angry;
			if (global.flag[38] == false)
				msg_face[0] = spr_dialogface_m6_serious;
		}
		else if (global.flag[72] != undefined && global.flag[72] < 1)
		{
			msg_face[0] = spr_dialogface_m6_default;
			msg_face[1] = spr_dialogface_m6_neutral;
			msg_face[2] = spr_dialogface_m6_default;
			if (chara_murder() >= 1)
				msg_face[3] = spr_dialogface_m6_neutral;
		}
		msg_sound[0] = snd_writer_m6;
	}
	if (text == "room_captcha_mainsign_3")
	{
		for (var i = 0; i < 4; i++)
			msg[i] = textdata_get($"room_captcha_mainsign_3_{i}");
	}
	if (text == "room_captcha_guidesign_3_3")
	{
		for (var i = 0; i < 2; i++)
			msg[i] = textdata_get($"room_captcha_guidesign_3_3_{i}");
	}
	if (text == "room_captcha_endsign_3")
	{
		for (var i = 0; i < 2; i++)
			msg[i] = textdata_get($"room_captcha_endsign_3_{i}");
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
		msg_sound[0] = snd_writer_m6;
		msg_talker[0] = global.party[0];
	}
	
	// unused_room_corridors_15
	if (text == "unused_room_nobowl")
	{
		msg[0] = "* Where is the reward?";
		msg[1] = "* I think the reward was supposed to be on this pillar.";
		msg[2] = "* Maybe another member or monster took it first.";
		msg[3] = "* Well,^1 it does not matter.";
		msg[4] = "* After all,^1 all we have to do now is just keep going!";
		msg_face[0] = spr_dialogface_m6_neutral;
		msg_face[3] = spr_dialogface_m6_default;
		msg_sound[0] = snd_writer_m6;
		msg_talker[0] = global.side[0];
	}
	
	// unused_room_corridors_16_A
	if (text == "unused_room_cavesign")
		msg[0] = "* \"Cave system entrance.\"^1&* \"Proceed with caution.\"";
	if (text == "unused_room_cavedoor")
		msg[0] = "* (Something behind the door is stopping you from opening it.)";
	
	// unused_room_corridors_16_B
	if (text == "unused_room_subwaysign")
	{
		msg[0] = "* \"Welcome to the Corridor's subway entrance.\"";
		msg[1] = "* \"If you are an administrador,^1 press the button and wait for a cart to come.\"";
	}
	if (text == "unused_room_subwaybutton")
	{
		msg[0] = "* (You pressed the button.)";
		msg[1] = "* (...)";
		msg[2] = "* (Doesn't seem to be working.)";
	}
	
	// room_corridors_17
	if (text == "npc_armsguy_exit")
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"npc_armsguy_exit_{global.flag[57]}_{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		msg_sound[0] = snd_writer_armsguy;
		msg_talker[0] = obj_chara.mycol;
		global.flag[57] = 1;
	}
	if (text == "npc_trashguy_exit_fishing")
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"npc_trashguy_exit_fishing_{global.flag[58]}_{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		global.flag[58] = true;
		msg_talker[0] = obj_chara.mycol;
	}
	if (text == "npc_armsguy_exit_fishing")
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"npc_armsguy_exit_fishing_{global.flag[23]}_{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		msg_sound[0] = snd_writer_armsguy;
		msg_talker[0] = obj_chara.mycol;
		if (global.flag[23] == false)
		{
			for (var o = 0; o < instance_number(obj_npc_room); o++)
			{
				var _obj = instance_find(obj_npc_room, o);
				if (_obj.x == 120 && _obj.y == 370 && _obj.sprite_index == spr_npc_trashguy_fishing)
				{
					msg_talker[2] = _obj;
					break;
				}
			}
			global.flag[23] = true;
		}
	}
	if (text == "npc_flitcher_exit")
	{
		if (chara_murder() <= 0)
		{
			var _weird = (irandom_range(1, 10) == 1 && global.flag[44] == 0);
			for (var m = 0; m < 99; m++)
			{
				var _msg = textdata_get($"npc_flitcher_exit_{_weird}_{m}");
				if (_msg == undefined) || (_msg == "Salenis")
					break;
				msg[m] = _msg;
			}
			if (_weird == true)
			{
				msg_skip[0] = false;
				msg_sound[0] = -1;
				//msg_font[0] = global.fnt_comic;
				msg_talker[0] = obj_chara.mycol;
				msg_type[0] = "tense";
				global.flag[44] = 0.5;
			}
		}
		else
			msg[0] = textdata_get("npc_flitcher_exit_geno_0");
	}
	if (text == "npc_armsguy_exit_lifting")
	{
		msg[0] = textdata_get($"npc_armsguy_exit_lifting_{clamp(global.flag[43], 0, 4)}_0");
		msg_sound[0] = snd_writer_armsguy;
		global.flag[43] = (real(global.flag[43]) + 1);
	}
	if (text == "room_corridors_17_egg")
	{
		for (var m = 0; m < (1 + (chara_murder() < 1)); m++)
			msg[m] = textdata_get($"room_corridors_17_egg.{m}");
	}
	
	// room_corridors_18
	if (text == "room_finalcorridor_sign")
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"room_corridors_18_sign.{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
	}
	
	// event_gabee_chase
	if (string_starts_with(text, "event_gabee_chase.") == true)
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"{text}.{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		msg_format[0] = "textbox_bottom";
		switch (string_char_at(text, string_length(text)))
		{
			case 0:
			msg_face[0] = spr_dialogface_m6_neutral;
			msg_face[4] = spr_dialogface_m6_neutralTense;
			msg_face[5] = spr_dialogface_m6_pleased;
			msg_sound[0] = snd_writer_m6;
			msg_talker[0] = global.party[0];
			if (chara_murder() >= 1)
			{
				msg[m] = textdata_get($"event_gabee_chase.0.{m}_geno");
				msg[m+1] = textdata_get($"event_gabee_chase.0.{m+1}_geno");
				msg_face[m] = spr_dialogface_m6_angry;
				global.flag[72] = 0.5;
			}
			break;
			case 1:
			msg_face[0] = spr_dialogface_m6_sadTense;
			msg_face[1] = spr_dialogface_m6_sad;
			msg_face[2] = spr_dialogface_m6_sadTense;
			msg_face[3] = spr_dialogface_m6_sad;
			msg_sound[0] = snd_writer_m6_tense;
			msg_talker[0] = global.party[0];
			break;
			case 3:
			msg_type[0] = "notawake";
			msg_sound[0] = snd_writer_gabee;
			break;
		}
	}
	// room_cave_1
	if (text == "room_leafbed")
		msg[0] = textdata_get($"room_leafbed_0");
	// room_cave_2
	if (text == "cellphone_developer")
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"cellphone_developer_{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		msg_sound[2] = snd_writer_dsans;
		msg_sound[m-1] = snd_writer_0;
	}
	// room_cave_3
	if (text == "npc_cave_armsguy")
	{
		var _questioned = undefined;
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"room_cave_3_npc_armsguy.{global.flag[68]}.{m}");
			if (_questioned != undefined)
			{
				_msg = textdata_get($"room_cave_3_npc_armsguy.{global.flag[68]}.{m}.{question_result[_questioned]}");
				if (question_result[_questioned] == 1)
					msg_skip[m] = false;
			}
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			else if (string_char_at(_msg, string_length(_msg)) != "?")
				msg[m] = _msg;
			else
			{
				question[m] = _msg;
				question_option[1] = textdata_get($"room_cave_3_npc_armsguy.{global.flag[68]}.{m}.1");
				question_option[2] = textdata_get($"room_cave_3_npc_armsguy.{global.flag[68]}.{m}.2");
				_questioned = m;
			}
		}
		msg_sound[0] = snd_writer_armsguy;
		msg_talker[0] = obj_chara.mycol;
		if (_questioned != undefined)
		{
			msg_sound[_questioned + 1] = snd_writer_armsguy;
			msg_talker[_questioned + 1] = obj_chara.mycol;
		}
		global.flag[68] = true;
	}
	if (text == "room_border")
	{
		for (var m = 0; m < 99; m++)
		{
			var _msg = textdata_get($"room_cave_3_border.{m}");
			if (_msg == undefined) || (_msg == "Salenis")
				break;
			msg[m] = _msg;
		}
		global.flag[70] = true;
	}
	
	if (string_starts_with(text, "battle_bubble") == 1) // bubble
	{
		msg_format[0] = "bubble";
		msg_font[0] = global.fnt_dotum;
		if (string_starts_with(text, "battle_bubble_test_") == true)
		{
			var _index = string_char_at(text, string_length(text));
			for (var m = 0; m < 99; m++)
			{
				var _msg = textdata_get($"battle_bubble_test_{_index}_{m}");
				if (_msg == undefined) || (_msg == "Salenis")
					break;
				msg[m] = _msg;
			}
		}
		
		if (text == "battle_bubble_dummy") // Dummy
		{
			msg[0] = "+F1......";
			if (controller.battle_usedact == 1 && controller.level_heard == 1 && controller.enemy_obj[0].stage == 6)
				msg[0] = "+F1.....!";
		}
		if (string_starts_with(text, "battle_bubble_m6_dummy_") == true) // MEE6 (Dummy)
		{
			var _index = string_char_at(text, string_length(text));
			for (var m = 0; m < 99; m++)
			{
				var _msg = textdata_get($"battle_bubble_m6_dummy_{_index}_{m}");
				if (_msg == undefined) || (_msg == "Salenis")
					break;
				msg[m] = _msg;
			}
			msg_type[0] = 5;
			msg_sound[0] = snd_writer_m6;
		}
		if (string_starts_with(text, "battle_bubble_armsguy") == 1) // Armsguy
		{
			if (controller.battle_group >= 7)
				msg_type[0] = 4;
			msg_sound[0] = snd_writer_armsguy;
			if (text == "battle_bubble_armsguy0") // Armsguy
			{
				var _num = irandom(7);
				msg[0] = textdata_get("battle_bubble_armsguy_" + string(_num));
			}
			if (text == "battle_bubble_armsguy1")
			{
				var _num = irandom_range(8, 10);
				msg[0] = textdata_get("battle_bubble_armsguy_" + string(_num));	
			}
			if (text == "battle_bubble_armsguy4")
			{
				var _num = irandom_range(11, 13);
				msg[0] = textdata_get("battle_bubble_armsguy_" + string(_num));	
			}
			if (text == "battle_bubble_armsguy2") || (text == "battle_bubble_armsguy3")
			{
				var _act = "clean";
				if (text == "battle_bubble_armsguy3")
					_act = "punch";
				var _num = irandom(2);
				msg[0] = textdata_get("battle_bubble_armsguy_" + string(_act) + "_" + string(_num));
			}
		}
		if (string_starts_with(text, "battle_bubble_trashguy") == 1) // Trashguy
		{
			if (controller.battle_group >= 7)
				msg_type[0] = 4;
			
			if (text == "battle_bubble_trashguy0") // Armsguy
			{
				var _num = irandom(4);
				msg[0] = textdata_get("battle_bubble_trashguy_" + string(_num));
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
				msg[0] = textdata_get("battle_bubble_trashguy_" + string(_num));	
			}
			if (text == "battle_bubble_trashguy3") || (text == "battle_bubble_trashguy4")
			{
				var _act = "empty";
				if (text == "battle_bubble_trashguy4")
					_act = "kick";
			
				var _num = irandom(2);
				msg[0] = textdata_get("battle_bubble_trashguy_" + string(_act) + "_" + string(_num));
			}
		}
		if (text == "battle_bubble_flitcher") // Flitcher
		{
			msg[0] = "+F1...";
			msg_type[0] = 3;
			msg_sound[0] = -1;
		}
		if (string_starts_with(text, "battle_bubble_brock") == 1) // Broken Clock
		{
			msg_sound[0] = snd_writer_brock;	
			if (text == "battle_bubble_brock0") // normal
			{
				var _round = clamp(controller.battle_round, 0, 10);
				if (controller.enemy_spare[enemy.myself] >= 100)
				{
					_round = 10;
					msg_type[0] = "tense";
				}
				for (var i = 0; i < 99; i++)
				{
					var _curmsg = textdata_get("battle_bubble_brock_" + string(_round) + "_" + string(i));
					if (_curmsg != undefined && _curmsg != "Salenis")
						msg[i] = _curmsg;
					else
						break;
				}
			}	
			if (text == "battle_bubble_brock1") // fight attempt
			{
				for (var i = 0; i < 3; i++)
					msg[i] = textdata_get("battle_bubble_brock_fight_" + string(i));
			}
		}
		if (string_starts_with(text, "battle_bubble_m6_rhonhey_") == true) // MEE6 (Rhonhey)
		{
			var _index = string_char_at(text, string_length(text));
			for (var m = 0; m < 99; m++)
			{
				var _msg = textdata_get($"battle_bubble_m6_rhonhey_{_index}_{m}");
				if (_msg == undefined) || (_msg == "Salenis")
					break;
				msg[m] = _msg;
			}
			msg_type[0] = 5;
			msg_sound[0] = snd_writer_m6;
			control = obj_battle_controller;
			if (exists(control) == true && control.attackobj[0] != -1 && exists(control.attackobj[0]) == true)
				msg_talker[0] = control.attackobj[0].mee6.object;
		}
	}
	else if (string_starts_with(text, "battle_") == 1) // battlebox
	{
		msg_sound[0] = snd_writer_1;
		msg_next[0] = 0;
		msg_font[0] = fnt_main_big;
		msg_format[0] = "battlebox";
		
		// default
		if (text == "battle_main")
		{
			msg[0] = "* battle_main";
			
			var _groupname = "";
			var _group = controller.battle_group;
			if (_group == -1)
				_groupname = "test";
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
			if (_group == 12)
				_groupname = "armsguy_trashguy_flitcher";
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
			if (_type == -1)
				_name = "test";
			if (_type == 2)
				_name = "armsguy";
			if (_type == 3)
				_name = "trashguy";
			if (_type == 4)
				_name = "flitcher";
			if (_type == 5)
				_name = "eyecrush";
			if (_type == 6)
				_name = "brock";
			if (_type == 7)
				_name = "rhonhey";
			if (_type == 1000)
				_name = "troll";
			if (_type == 2000)
				_name = "toilet";
			for (var m = 0; m < 99; m++)
			{
				var _msg = textdata_get($"battle_main_{_name}_{m}");
				if (_msg == undefined) || (_msg == "Salenis")
					break;
			}
			_max = (m - 1);
			if (controller.battle_round == 0) || (controller.battle_round > 0 && chara_murder() >= 1) // first
			{
				var _msg_id = "battle_main_" + string(_groupname);
				var _msg_geno = textdata_get($"{_msg_id}_geno");
				if (chara_murder() >= 1 && _msg_geno != undefined && _msg_geno != "Salenis")
					msg[0] = _msg_geno;
				else
					msg[0] = textdata_get(_msg_id);
			}
			else // normal
			{
				var _num = (controller.battle_round - 1);
				if (_num > _max)
					_num = irandom(_max);
				msg[0] = textdata_get("battle_main_" + string(_name) + "_" + string(_num));
				if (msg[0] == undefined) || (msg[0] == "Salenis")
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
					{
						_custom = 4;
						if (chara_murder() >= 1)
							_custom = 5;
					}
					msg[0] = $"* ({name[_enemy1]}{textdata_get("battle_main_sparing_0_" + string(_custom))})";
					if (_amt == 2)
						msg[0] = "* " + string(name[_enemy1]) + textdata_get("battle_main_sparing_1_0") + string(name[_enemy2]) + textdata_get("battle_main_sparing_1_1");
					else if (_amt == 3)
						msg[0] = "* " + string(name[_enemy1]) + ", " + string(name[_enemy2]) + textdata_get("battle_main_sparing_1_0") + string(name[_enemy3]) + textdata_get("battle_main_sparing_1_1");
				}
			}
			// special
			if (controller.battle_group == 1) // Dummy
			{
				var _enemy = controller.enemy_obj[0];
				var _stage = (floor(_enemy.stage / 2) * 2);
				for (var _length = 0; _length < 99; _length++)
				{
					var _text = textdata_get($"battle_main_dummy_{_stage}_{_length}");
					if (_text == undefined) || (_text == "Salenis")
						break;
				}
				if (_length > 0)
				{
					if (_enemy.stage % 2 == 0)
					{
						for (var i = 0; i < _length; i++)
							msg[i] = textdata_get($"battle_main_dummy_{_stage}_{i}");
						msg_next[0] = true;
						msg_face[0] = spr_dialogface_m6_default;
						msg_sound[0] = snd_writer_m6;
						switch (_enemy.stage)
						{
							case 0:
							msg_face[0] = spr_dialogface_m6_pleased;
							msg_face[1] = spr_dialogface_m6_default;
							msg_face[_length - 2] = spr_dialogface_m6_sassy;
							break;
							case 2:
							msg_face[0] = spr_dialogface_m6_pleased;
							msg_face[1] = spr_dialogface_m6_default;
							msg_face[2] = spr_dialogface_m6_thinking;
							msg_face[3] = spr_dialogface_m6_default;
							break;
							case 6:
							msg_face[1] = spr_dialogface_m6_pleased;
							msg_face[2] = spr_dialogface_m6_default;
							msg_face[4] = spr_dialogface_m6_thinking;
							msg_face[5] = spr_dialogface_m6_default;
							msg_face[6] = -1;
							msg_sound[6] = snd_writer_1;
							msg_face[7] = spr_dialogface_m6_default;
							msg_sound[7] = snd_writer_m6;
							break;
							case 8:
							msg_face[0] = spr_dialogface_m6_pleased;
							msg_face[1] = spr_dialogface_m6_default;
							break;
						}
						_enemy.stage += 1;
					}
					else
						msg[0] = textdata_get($"battle_main_dummy_{_stage}_{_length - 1}");
					msg_next[_length - 1] = 0;
					msg_face[_length - 1] = -1;
					msg_sound[_length - 1] = snd_writer_1;
				}
				
				/*
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
						var _curmsg = textdata_get("battle_main_dummy_" + string(_enemy.stage) + "_" + string(i));
						if (_curmsg != undefined)
							msg[i] = _curmsg;
						else
							break;
					}
					
					// get faces and sounds
					msg_next[0] = 1;
					msg_face[0] = spr_dialogface_m6_default;
					msg_sound[0] = snd_writer_m6;
					
					msg_next[_finalpage] = 0;
					msg_face[_finalpage] = -1;
					msg_sound[_finalpage] = snd_writer_0;

					_enemy.stage += 1;
				}
				else
					msg[0] = textdata_get("battle_main_dummy_" + string(_enemy.stage - 1) + "_" + string(_finalpage));
				*/
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
					var _act_namePrefix = "";
					var _act_namePostfix = "";
					if (controller.enemy_act_enabled[target, i] == false)
					{
						_act_namePrefix = ";G";
						_act_namePostfix = ";D";
					}
					act_name[i] = $"   {_act_namePrefix}* {string(controller.enemy_act[target, i])}{_act_namePostfix}";
					for (var z = 0; z < (11 - string_length(controller.enemy_act[target, i])); z++)
						act_space[i] += " ";
				}
			}
			msg[0] = string(act_name[0]) + string(act_space[0]) + string(act_name[1]) + "&!" + string(act_name[2]) + string(act_space[2]) + string(act_name[3]) + "&!" + string(act_name[4]) + string(act_space[4]) + string(act_name[5])
			msg_autoskip[0] = 1;
		}
		
		if (text == "battle_itemlist")
		{
			for (var i = 0; i < global.item_length; i++)
			{
				name[i] = "";
				space[i] = "";
				var _type = "small";
				if (controller.battle_serious == 1)
					_type = "serious";	
				if (global.item[i] != -1)
				{
					name[i] = ("   * " + string(item_name(global.item[i], _type)));
					for (var z = 0; z < (11 - string_length(item_name(global.item[i], _type))); z++)
						space[i] += " ";
				}
			}
			msg[0] = (string(name[0]) + space[0] + string(name[1]) + "&!" + string(name[2]) + space[2] + string(name[3]) + "&!" + string(name[4]) + space[4] + string(name[5]));
			msg_autoskip[0] = 1;
		}
		
		if (text == "battle_useitem")
		{
			item_use();
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
			
			msg[0] = "   " + string(_spare) + $"* {textdata_get("battle_mercy_0")};D&!   " + string(_flee) + $"* {textdata_get("battle_mercy_1")}";	
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
						lvlup = textdata_get("battle_won_2");
						audio_play(snd_jingleLevel, 0, VOLUME_SOUND);
						debug("--- level up !!!! Yay!! Yay!!! Yiippee!! Woaahoo!!! Hehehaha!!!! Hahahehehihoho  Yay ha!!!!!");
					}
				}
			
				msg[0] = textdata_get("battle_won_0") + string(controller.battle_expreward) + textdata_get("battle_won_1") + string(controller.battle_mnyreward) + ";D.)" + string(lvlup);
			}
			else
			{
				msg[0] = "";
				if (global.flag[40] == false)
					msg[0] += "+S3";
				msg[0] += textdata_get("battle_nobody");
				msg_type[0] = "nobody";
				msg_font[0] = fnt_main;
				msg_skip[0] = 0;
			}
			msg_next[0] = 1;
		}
		
		if (text == "battle_fleeing")
		{
			if (chara_murder() < 1)
			{
				var _msgAmount = 0;
				for (var m = 0; m < 99; m++)
				{
					var _msg = textdata_get($"battle_flee_{m}");
					if (_msg == undefined) || (_msg == "Salenis")
					{
						_msgAmount = m;
						break;
					}
				}
				msg[0] = $"   {textdata_get("battle_flee_" + string(irandom(_msgAmount - 1)))}";
			}
			else
				msg[0] = $"   {textdata_get("battle_flee_geno")}";
			msg_autoskip[0] = 1;
		}
		
		// act
		if (string_starts_with(text, "battle_act_") == 1)
		{
			msg_next[0] = 1;
			
			if (string_starts_with(text, "battle_act_test") == true) // TESTGUY
			{
				for (var m = 0; m < 99; m++)
				{
					var _msg = textdata_get($"battle_act_result_test_{string_char_at(text, string_length(text))}_{m}");
					if (_msg == undefined) || (_msg == "Salenis")
						break;
					msg[m] = _msg;
				}
				if (text == "battle_act_test1")
				{
					msg_format[1] = "bubble";
					msg_font[1] = global.fnt_dotum;
					msg_format[2] = "battlebox";
					msg_font[2] = fnt_main_big;
				}
			}
			if (text == "battle_act_dummy0") // Dummy
			{
				for (var i = 0; i < 3; i++)
					msg[i] = textdata_get("battle_act_result_dummy_0_" + string(i));
			}
			if (text == "battle_act_dummy1")
			{
				if (controller.enemy_obj[0].stage != 5)
					msg[0] = textdata_get("battle_act_result_dummy_1_0");
				else
				{
					msg[0] = $"{textdata_get("battle_act_result_dummy_1_1_0_0")}{textdata_get("battle_act_result_dummy_1_1_0_1_" + string(irandom(3)))}{textdata_get("battle_act_result_dummy_1_1_0_2")}";
					msg[1] = textdata_get("battle_act_result_dummy_1_1_1");
				}
			}
			if (text == "battle_act_dummy2")
			{
				for (var i = 0; i < 2; i++)
					msg[i] = textdata_get("battle_act_result_dummy_2_" + string(i));
				if (controller.enemy_obj[0].stage == 5)
				{
					var _screamed = controller.enemy_obj[0].screamed;
					_screamed = clamp(_screamed, 0, 4);
					msg[i] = textdata_get("battle_act_result_dummy_2_2_" + string(_screamed));
					msg_face[i] = spr_dialogface_m6_sassy;
					msg_sound[i] = snd_writer_m6;
					if (_screamed == 4)
					{
						msg_face[i] = spr_dialogface_m6_angry;
						msg_sound[i] = snd_writer_m6_angry;
					}
				}
			}
			if (string_starts_with(text, "battle_act_armsguy") == true) // Armsguy
			{
				var _text_index = real(string_char_at(text, string_length(text)));
				for (var m = 0; m < 99; m++)
				{	
					var _text_postfix = "";
					var _msg = textdata_get($"battle_act_result_armsguy_{_text_index}_{m}");
					if (_msg == undefined) || (_msg == "Salenis")
						break;
					msg[m] = _msg;
				}
				//for (var i = 0; i < 2; i++)
				//	msg[i] = textdata_get($"battle_act_result_armsguy_{string_char_at(text, string_length(text))}_{i}");
			}
			if (string_starts_with(text, "battle_act_trashguy") == true) // Trashguy
			{
				for (var i = 0; i < 2; i++)
					msg[i] = textdata_get($"battle_act_result_trashguy_{string_char_at(text, string_length(text))}_{i}");
			}
			if (string_starts_with(text, "battle_act_flitcher") == true) // Flitcher
			{
				for (var i = 0; i < 2; i++)
					msg[i] = textdata_get($"battle_act_result_flitcher_{string_char_at(text, string_length(text))}_{i}");
			}
			if (text == "battle_act_eyecrush0") // Eyecrush (UNUSED)
			{
				msg[0] = textdata_get("unused_battle_act_result_eyecrush_0_0");
				msg[1] = textdata_get("unused_battle_act_result_eyecrush_0_1");
			}
			if (text == "battle_act_eyecrush1")
			{
				msg[0] = textdata_get("unused_battle_act_result_eyecrush_1_0");
				msg[1] = textdata_get("unused_battle_act_result_eyecrush_1_1");
			}
			if (text == "battle_act_eyecrush2_0") || (text == "battle_act_eyecrush2_1")
			{
				msg[0] = textdata_get("unused_battle_act_result_eyecrush_2_0");
				msg[1] = textdata_get("unused_battle_act_result_eyecrush_2_1_0");
				if (text == "battle_act_eyecrush2_1")
					msg[1] = textdata_get("unused_battle_act_result_eyecrush_2_1_1");
			}
			if (string_starts_with(text, "battle_act_brock") == 1) // Broken Clock
			{
				var _geno = enemy.geno;
				var _convince = enemy.convince;
				if (controller.enemy_spare[enemy.myself] < 100) // normal
				{
					var _text_index = real(string_char_at(text, string_length(text)));
					for (var m = 0; m < 99; m++)
					{	
						var _text_postfix = "";
						switch (_text_index)
						{
							case 1:
							_text_postfix = $"_{enemy.negotiate}";
							break;
							//case 2:
							//var _insult_page = 1;
							//if (m == _insult_page)
							//{
							//	for (var i = 0; i < 99; i++)
							//	{	
							//		var _text = textdata_get($"battle_act_result_brock_{_text_index}_{_insult_page}_{i}");
							//		if (_text == undefined) || (_text == "Salenis")
							//			break;
							//	}
							//	var _insult_index = enemy.insult;
							//	if (_insult_index > (i - 1))
							//		_insult_index = irandom(i - 1);
							//}
							//break;
						}
						var _msg = textdata_get($"battle_act_result_brock_{_text_index}_{m}{_text_postfix}");
						if (_msg == undefined) || (_msg == "Salenis")
							break;
						msg[m] = _msg;
					}
					switch (_text_index)
					{
						// "Negotiate"
						case 1:
						if (enemy.negotiate < 2)
							audio_play(snd_jingleSucess, 0, VOLUME_SOUND);
						enemy.negotiate = clamp((enemy.negotiate + 1), 0, 2);
						if (enemy.negotiate >= 2)
							controller.enemy_act_enabled[enemy.myself, 1] = false;
						break;
						// "Insult"
						case 2:
						var _insult_page = 1;
						var _insult_index = enemy.insult;
						for (var z = 0; z < 99; z++)
						{	
							var _insult_text = textdata_get($"battle_act_result_brock_{_text_index}_{_insult_page}_{z}");
							if (_insult_text == undefined) || (_insult_text == "Salenis")
								break;
						}
						if (_insult_index > (z - 1))
							_insult_index = irandom(z - 1);
						msg[_insult_page] = string_replace_all(msg[_insult_page], "{insult}", textdata_get($"battle_act_result_brock_{_text_index}_{_insult_page}_{_insult_index}"));
						var _answer_page = (_insult_page + 1);
						for (var i = 0; i < 99; i++)
						{
							var _answer_text = textdata_get($"battle_bubble_brock_insult_{_insult_index}_{i}");
							if (_answer_text == undefined) || (_answer_text == "Salenis")
								break;
							msg[_answer_page + i] = _answer_text;
						}
						msg_font[_answer_page] = global.fnt_dotum;
						msg_sound[_answer_page] = snd_writer_brock;
						msg_format[_answer_page] = "bubble";
						var _result_page = (_answer_page + i);
						var _result_type = 0;
						switch (_insult_index)
						{
							case 6:
							_result_type = 1;
							enemy.insultTurns = -2;
							audio_play(snd_jingleFail, 0, VOLUME_SOUND);
							break;
							default:
							_result_type = 0;
							enemy.insultTurns = 2;
							audio_play(snd_jingleSucess, 0, VOLUME_SOUND);
							break;
						}
						var _result_pageSkipped = false;
						for (var i = 0; i < 2; i++)
						{
							if (enemy.insult > 0 && i == 0 && _result_type == 0)
							{
								_result_pageSkipped = true;
								continue;
							}
							var _result_text = textdata_get($"battle_act_result_brock_{_text_index}_{_insult_page + 1 + i}_{_result_type}");
							if (_result_text == undefined) || (_result_text == "Salenis")
								break;
							msg[_result_page + i - (1 * _result_pageSkipped)] = _result_text;
						}
						msg_font[_result_page] = fnt_main_big;
						msg_sound[_result_page] = snd_writer_1;
						msg_format[_result_page] = "battlebox";
						enemy.insult += 1;
						if (enemy.insult >= 7)
							controller.enemy_act_enabled[enemy.myself, 2] = false;
						enemy.body.movement = 1;
						break;
						// "Convince"
						case 3:
						var _page = 0;
						msg[_page++] = textdata_get($"battle_act_result_brock_3_{_page}");
						question[_page] = "";
						question_option[1] = textdata_get($"battle_act_result_brock_3_{_page}_" + string(_convince) + "_1");
						question_option[2] = textdata_get($"battle_act_result_brock_3_{_page}_" + string(_convince) + "_2");
						var _result = question_result[_page++];
						if (_result != 0)
						{
							for (var m = 0; m < 99; m++)
							{	
								var _msg = textdata_get($"battle_bubble_brock_convince_{_convince}_{_result}_{m}");
								if (_msg == undefined) || (_msg == "Salenis")
									break;
								msg[_page + m] = _msg;
							}
							msg_font[_page] = global.fnt_dotum;
							msg_sound[_page] = snd_writer_brock;
							msg_format[_page] = "bubble";
							if (_convince >= 4)
								msg_type[_page + 9] = "tense";
							enemy.body.movement = 1;
							var _bool = false;
							var _bool_sound = snd_jingleFail;
							if (_convince == 0 && _result == 1)
							|| (_convince == 1 && _result == 1)
							|| (_convince == 2 && _result == 2)
							|| (_convince == 3 && _result == 1)
							|| (_convince == 4 && _result == 1)
							{
								_bool = true;
								_bool_sound = snd_jingleSucess;
								controller.enemy_spare[enemy.myself] += 20;
								enemy.convince += 1;
								if (enemy.convince >= 5)
									controller.enemy_act_enabled[enemy.myself, 3] = false;
							}
							audio_play(_bool_sound, 0, VOLUME_SOUND)
							var _msg = textdata_get($"battle_act_result_brock_3_2_{_bool}");
							if (_msg != undefined && _msg != "Salenis" && ((_bool == false) || (_bool == true && _convince < 4)))
							{
								var _msg_prefix = textdata_get($"battle_act_result_brock_3_2_{_bool}_prefix");
								if (_msg_prefix == undefined) || (_msg_prefix == "Salenis") || (_convince > 0)
									_msg_prefix = "";
								msg[_page+m] = $"{_msg_prefix}{_msg}";
								msg_font[_page+m] = fnt_main_big;
								msg_sound[_page+m] = snd_writer_0;
								msg_format[_page+m] = "battlebox";
							}
						}
						break;
					}
					if (text == "battle_act_brock3")
					{
						
					}
				}
				else // convinced
					msg[0] = textdata_get("battle_act_result_brock_convinced");
			}
			if (text == "battle_act_rhonhey0") // Rhonhey
				msg[0] = textdata_get("battle_act_result_rhonhey_0");
			if (text == "battle_act_rhonhey1")
			{
				if (enemy.punched == 0)
				{
					msg[0] = textdata_get("battle_act_result_rhonhey_1_0_0");
					msg[1] = textdata_get("battle_act_result_rhonhey_1_0_1_0");
					if (enemy.terrorized == 1)
						msg[1] = textdata_get("battle_act_result_rhonhey_1_0_1_1");
					controller.enemy_spare[enemy.myself] += 50;
					enemy.punched = 1;
				}
				else
					msg[0] = textdata_get("battle_act_result_rhonhey_1_1");
			}
			if (text == "battle_act_rhonhey2")
			{
				msg[0] = textdata_get("battle_act_result_rhonhey_2_0");
				msg[1] = textdata_get("battle_act_result_rhonhey_2_1");
			}
			if (text == "battle_act_rhonhey3")
			{
				if (enemy.terrorized == 0)
				{
					msg[0] = textdata_get("battle_act_result_rhonhey_3_0_0");
					msg[1] = textdata_get("battle_act_result_rhonhey_3_0_1_0");
					if (enemy.punched == 1)
						msg[1] = textdata_get("battle_act_result_rhonhey_3_0_1_1");
					controller.enemy_spare[enemy.myself] += 50;
					enemy.terrorized = 1;
				}
				else
					msg[0] = textdata_get("battle_act_result_rhonhey_3_1");
			}
			if (string_starts_with(text, "battle_act_troll") == true) // TROLLFACE
			{
				for (var m = 0; m < 99; m++)
				{
					var _msg = textdata_get($"battle_act_result_troll_{string_char_at(text, string_length(text))}_{m}");
					if (_msg == undefined) || (_msg == "Salenis")
						break;
					msg[m] = _msg;
				}
			}
			if (string_starts_with(text, "battle_act_toilet") == true) // Toilet
			{
				var _text_index = string_char_at(text, string_length(text));
				for (var m = 0; m < 99; m++)
				{
					var _msg = textdata_get($"battle_act_result_toilet_{_text_index}_{m}");
					if (_msg == undefined) || (_msg == "Salenis")
						break;
					msg[m] = _msg;
				}
			}
		}
	}
	
	// subtle shake
	if (msg_format[page] == "battlebox" && (controller.battle_group == 6 || controller.battle_group == 1000) && controller.enemy_spare[0] < 100 && chara_murder() < 1)
	{
		var i = page;
		while (msg[i] != "%%%" && (msg_format[i] == "battlebox" || msg_format[i] == -2))
		{
			msg[i] = "+S3" + string(msg[i]);
			i += 1;
		}
	}
}












