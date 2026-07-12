
debugalarm = 0;

global.chara_move = 0;
page = 0;
text = global.writer_text;
enemy = global.writer_enemy;
alpha = 1;
writing = 1;
bubble_x = 0;
bubble_y = 0;
bubble_spr = 0;
controller = obj_battle_controller;
face_index = 0;
talkerpage = -1;
text_length = 0;
textbox_color = c_white;
fastskip_stage = 0;
fastskip_delay = 0;
infoArray = global.writer_infoArray;

// get default values
for (var i = 0; i < 99; i++)
{
	msg[i] = "%%%";
	
	msg_type[i] = -2;
	msg_skip[i] = -2;
	msg_next[i] = -2;
	msg_face[i] = -2;
	msg_font[i] = -2;
	msg_sound[i] = -2;
	msg_talker[i] = -2;
	msg_format[i] = -2; // textbox, textbox_bottom, textbox_top, battlebox, bubble
	msg_autoskip[i] = -2;
	// -2 = undefined; -1 = nothing
	
	question[i] = "%%%";
	question_pos = 0;
	question_active = 0;
	question_result[i] = 0;
	question_option[0] = "";
	question_option[1] = "%%%";
	question_option[2] = "%%%";
	question_option[3] = "%%%";
	question_option[4] = "%%%";
}
msg_type[0] = "default";
msg_skip[0] = 1;
msg_next[0] = 1;
msg_face[0] = -2;
msg_font[0] = fnt_main;
msg_sound[0] = snd_txt1;
msg_talker[0] = -2;
msg_format[0] = "textbox";
msg_autoskip[0] = 0;

playsnd = 1;
filesaved = 0;

// get text and new values
TEXT();
event_user(0);
event_user(2);
event_user(3);

depth = -10000;
alarm[0] = text_speed;

/*
// get raw text
for (var i = 0; i < array_length(msg); i++)
{
	msg_rawtext[i] = msg[i];
	for (var c = 1; c < string_length(msg_rawtext[i]); c++)
	{
		if (((string_char_at(msg_rawtext[i], c) == ":") || (string_char_at(msg_rawtext[i], c) == ";")) && string_char_at(msg_rawtext[i], (c + 1)) != "\\")
		{
			msg_rawtext[i] = string_delete(msg_rawtext[i], c, 2);
			c -= 1;
		}
	}
}
*/


