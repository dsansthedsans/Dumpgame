/// @descr type letter

if (text_length <= (string_length(msg[page]) - 1))
{
	text_length += 1;
	var _playsnd = 1;
	var _length = 1;
	for (var l = 0; l < _length; l++)
	{
		var _char = string_char_at(msg[page], text_length);
		var _charNext = string_char_at(msg[page], (text_length + 1));
		var _charLast = string_char_at(msg[page], (text_length - 1));
		var _charLaster = string_char_at(msg[page], (text_length - 2));
		// Whitespace
		if (_char == " ")
			_playsnd = false;
		// Line break
		else if (_char == "&" && _charNext != "\\")
		{
			if (_charNext == "!")
				text_length += 1;
			text_length += 1;
			_playsnd = false;
			_length += 1;
		}
		// Pauses
		else if (_char == "^" && _charNext != "\\")
		{
			switch (string_char_at(msg[page], (text_length + 1)))
			{
				case "1":
				text_speed += ceil(60 / 4);
				break;
				case "2":
				text_speed += ceil(60 / 2);
				break;
				case "3":
				text_speed += ceil(60 / 8);
				break;
				case "4":
				text_speed += 60;
				break;
				case "5":
				text_speed += ceil(60 / 16);
				break;
			}
			text_length += 2;
			_playsnd = false;
			_length += 1;
		}
		// Colors
		else if ((_char == ":" || _char == ";") && _charNext != "\\")
		{
			text_length += 2;
			_playsnd = false;
			_length += 1;
		}
		// Effects
		else if (_char == "+" && _charNext != "\\")
		{
			text_length += 2;
			_playsnd = false;
			_length += 1;
		}
		// Special character
		else if (_char == "\\")
		{
			text_length += 1;
			_playsnd = false;
			_length += 1;
		}
	}
	if (_playsnd == 1 && msg_sound[page] != -1)
	{
		var _snd = msg_sound[page];
		if (is_array(msg_sound[page]) == true)
			_snd = msg_sound[page][irandom(array_length(msg_sound[page]) - 1)];
		if (((_snd == snd_writerTroll_0 || _snd == snd_writerTroll_1 || _snd == snd_writerDsans || _snd == snd_writerGabee) && playsnd == false) == false)
		{
			var _snd_pitch = 1;
			if (_snd != snd_writer_0 && _snd != snd_writer_1)
				_snd_pitch += random_range(-0.05, 0.05);
			audio_play(_snd, 0, VOLUME_SOUND, , , , _snd_pitch);
		}
		playsnd = !playsnd;
	}
	alarm[0] = text_speed;
}