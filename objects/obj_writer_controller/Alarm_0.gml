/// @descr type letter

if (text_length <= (string_length(msg[page]) - 1))
{
	text_length += 1;
	var _playsnd = 1;
	switch (string_char_at(msg[page], text_length))
	{
		// Whitespace
		case " ":
		_playsnd = false;
		break;
		// Line break
		case "&":
		if (string_char_at(msg[page], (text_length + 1)) != "\\")
		{
			_playsnd = false;
			text_length += 1;
		}
		break;
		// Pauses
		case "^":
		if (string_char_at(msg[page], (text_length + 1)) != "\\")
		{
			switch (string_char_at(msg[page], (text_length + 1)))
			{
				case "1":
				text_speed += 15;
				break;
				case "2":
				text_speed += 30;
				break;
				case "3":
				text_speed += 7;
				break;
				case "4":
				text_speed += 60;
				break;
			}
			_playsnd = false;
			text_length += 1;
		}
		break;
		// Colors
		case ":":
		case ";":
		if (string_char_at(msg[page], (text_length + 1)) != "\\")
		{
			_playsnd = false;
			text_length += 1;
		}
		break;
		// Effects
		case "+":
		if (string_char_at(msg[page], (text_length + 1)) != "\\")
		{
			_playsnd = false;
			text_length += 1;
		}
		break;
		// Special character
		case "\\":
		_playsnd = false;
		text_length += 1;
		break;
	}
	switch (string_char_at(msg[page], (text_length - 1)))
	{
		case "&":
		case "^":
		case ":":
		case ";":
		case "+":
		if (string_char_at(msg[page], text_length) == "!" && string_char_at(msg[page], (text_length - 1)) == "&")
		|| (string_char_at(msg[page], text_length) != "//")
		{
			_playsnd = false;
			text_length += 1;
		}
		break;
	}
	switch (string_char_at(msg[page], (text_length - 2)))
	{
		case "+":
		if (string_char_at(msg[page], (text_length - 1)) != "//")
		{
			_playsnd = false;
			text_length += 1;
		}
		break;
	}
	
	/*
	if (string_char_at(msg[page], text_length) == " ")
		_playsnd = 0;
	if (string_char_at(msg[page], (text_length + 1)) != "\\" && (string_char_at(msg[page], text_length) == ":" || string_char_at(msg[page], text_length) == ";")) 
	{
		_playsnd = 0;
		text_length += 2;
	}
	if (string_char_at(msg[page], text_length) != "\\" && (string_char_at(msg[page], (text_length - 1)) == ":" || string_char_at(msg[page], (text_length - 1)) == ";"))
		_playsnd = 0;
	if (string_char_at(msg[page], (text_length + 1)) != "\\" && (string_char_at(msg[page], text_length) == "&" || string_char_at(msg[page], text_length) == "+"))
	{
		_playsnd = 0;
		text_length += 2;
	}
	if (string_char_at(msg[page], text_length) != "\\" && (string_char_at(msg[page], (text_length - 1)) == "&" || string_char_at(msg[page], (text_length - 1)) == "+"))
	{
		_playsnd = 0;
		if (string_char_at(msg[page], (text_length - 1)) == "&" && string_char_at(msg[page], text_length) == "!")
			text_length += 1;
	}
	// pauses
	if (string_char_at(msg[page], (text_length + 1)) == "^" && string_char_at(msg[page], (text_length + 2)) != "\\")
	{
		if (string_char_at(msg[page], (text_length + 2)) == "1")
			text_speed += 15;
		if (string_char_at(msg[page], (text_length + 2)) == "2")
			text_speed += 30;
		if (string_char_at(msg[page], (text_length + 2)) == "3")
			text_speed += 7;
		if (string_char_at(msg[page], (text_length + 2)) == "4")
			text_speed += 60;
	}
	if (string_char_at(msg[page], (text_length + 1)) != "\\" && string_char_at(msg[page], text_length) == "^")
	{
		_playsnd = 0;
		text_length += 2;
	}
	if (string_char_at(msg[page], text_length) != "\\" && string_char_at(msg[page], (text_length - 1)) == "^")
		_playsnd = 0;
	*/
	
	if (_playsnd == 1 && msg_sound[page] > -1)
	{
		var _snd = msg_sound[page];
		if ((_snd == snd_writer_gabee && playsnd == false) == false && (_snd == snd_writer_dsans && playsnd == false) == false)
		{
			var _snd_pitch = 1;
			if (_snd != snd_writer_0 && _snd != snd_writer_1)
				_snd_pitch += random_range(-0.05, 0.05);
			audio_play(msg_sound[page], 0, VOLUME_SOUND, , , , _snd_pitch);
		}
		playsnd = !playsnd;
		if (global.indebug == 1 && global.debug_hud == true)
			debug("writer_sound (" + string(text_length) + ")");
	}
	
	alarm[0] = text_speed;
}