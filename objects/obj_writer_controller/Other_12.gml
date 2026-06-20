/// @descr save msg info

for (var i = page; i < 98; i++)
{	
	if (msg_type[(i + 1)] == -2 && msg_type[i] != -2)
		msg_type[(i + 1)] = msg_type[i];
		
	if (msg_skip[(i + 1)] == -2 && msg_skip[i] != -2)
		msg_skip[(i + 1)] = msg_skip[i];
		
	if (msg_next[(i + 1)] == -2 && msg_next[i] != -2)
		msg_next[(i + 1)] = msg_next[i];
		
	if (msg_face[(i + 1)] == -2 && msg_face[i] != -2)
		msg_face[(i + 1)] = msg_face[i];
		
	if (msg_font[(i + 1)] == -2 && msg_font[i] != -2)
		msg_font[(i + 1)] = msg_font[i];
	
	if (msg_sound[(i + 1)] == -2 && msg_sound[i] != -2)
		msg_sound[(i + 1)] = msg_sound[i];
		
	if (msg_talker[(i + 1)] == -2 && msg_talker[i] != -2)
		msg_talker[(i + 1)] = msg_talker[i];
		
	if (msg_format[(i + 1)] == -2 && msg_format[i] != -2)
		msg_format[(i + 1)] = msg_format[i];
		
	if (msg_autoskip[(i + 1)] == -2 && msg_autoskip[i] != -2)
		msg_autoskip[(i + 1)] = msg_autoskip[i];
	
	/*
	if (msg_type[(i + 1)] == -2)
		msg_type[(i + 1)] = msg_type[i];
	
	if (msg_skip[(i + 1)] == -2)
		msg_skip[(i + 1)] = msg_skip[i];
	
	if (msg_next[(i + 1)] == -2)
		msg_next[(i + 1)] = msg_next[i];
	
	if (msg_face[(i + 1)] == -2 && msg_face[i] != -1)
		msg_face[(i + 1)] = msg_face[i];
	
	if (msg_font[(i + 1)] == -2)
		msg_font[(i + 1)] = msg_font[i];
	else if (msg_font[(i + 1)] != msg_font[page])
		msg_font[(i + 1)] = msg_font[page];
	
	if (msg_sound[(i + 1)] == -2 && msg_sound[i] != -1 && msg_sound[i] != -2)
		msg_sound[(i + 1)] = msg_sound[i];
	else if (msg_sound[(i + 1)] != msg_sound[page])
		msg_sound[(i + 1)] = msg_sound[page];
	
	if (msg_talker[(i + 1)] == -2)
		msg_talker[(i + 1)] = msg_talker[i];
	
	if (msg_format[(i + 1)] == -2)
		msg_format[(i + 1)] = msg_format[i];
	else if (msg_format[(i + 1)] != msg_format[page])
		msg_format[(i + 1)] = msg_format[page];
		
	if (msg_autoskip[(i + 1)] == -2)
		msg_autoskip[(i + 1)] = msg_autoskip[i];
		*/
}