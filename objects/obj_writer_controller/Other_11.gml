/// @descr next page

page += 1;
writing = 1;
text_length = 0;

if (question_active == 1)
{
	for (var i = 0; i < 99; i++)
	{
		msg_type[i] = -2;
		msg_skip[i] = -2;
		msg_next[i] = -2;
		msg_face[i] = -2;
		msg_font[i] = -2;
		msg_sound[i] = -2;
		msg_talker[i] = -2;
		msg_format[i] = -2;
		msg_autoskip[i] = -2;	
	}
	msg_type[page] = "default";
	msg_skip[page] = 1;
	msg_next[page] = 1;
	msg_face[page] = -2;
	msg_font[page] = fnt_main;
	msg_sound[page] = snd_txt1;
	msg_talker[page] = -2;
	msg_format[page] = "textbox";
	msg_autoskip[page] = 0;
	TEXT();
}
question_active = 0;

if (msg[page] != "%%%") || (question[page] != "%%%")
{		
	if (question[page] != "%%%")
	{
		msg[page] = question[page];
		question_active = 1;
	}
	
	event_user(2);
	event_user(0);
	event_user(3);
	alarm[0] = text_speed;
	
	// custom
	if (text == "npc_armsguy_lost" && global.flag[47] == 1 && page == 5)
	{
		audio_play(snd_item, 0, VOLUME_SOUND);
		if (global.achievement[ACHIEVEMENT_MONSTNINJA] == 0)
		{
			global.achievement[ACHIEVEMENT_MONSTNINJA] = 1;
			create_notification("monstninja");
		}
	}
	if (text == "battle_act_brock3" && enemy.convince >= 5 && page >= 10)
		enemy.body.tense = true;
}
else
{
	if (global.chara_cutscene == 0 && exists(obj_chara_menu) == 0)
	{
		//chara_change(-1, 1, -1, -1, -1, -1, -1);
		//global.chara_move = 1;
	}
	if (msg_talker[(page - 1)] > -1)
	{
		msg_talker[(page - 1)].image_speed = 0;
		msg_talker[(page - 1)].image_index = 0;
		debug("stopped talker animation");
	}
	debug("--- Destroyed obj_writer_controller");
	destroy(id);
}