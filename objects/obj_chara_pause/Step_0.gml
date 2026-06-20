
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_enter = key("enter_press");
press_shift = key("shift_press");


// controle
if (move == 1)
{
	if (warning == 0)
	{
		// movimento
		var _oldpos = option_pos;
		option_pos += (press_d - press_u);
		if (option_pos <= -1)
			option_pos = (option_length - 1);
		if (option_pos >= option_length)
			option_pos = 0;
		if (option_pos != _oldpos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);


		// selecionar
		if (press_enter == 1 && option_pos != 0)
		{
			warning = 1;
			audio_play(snd_option_select, 0, VOLUME_SOUND);
		}
	}
	else
	{
		// movimento
		if (press_l == 1) || (press_r == 1)
		{
			warning_option_pos = !warning_option_pos;
			audio_play(snd_option_move, 0, VOLUME_SOUND);
		}
			
		// selecionar
		if (press_enter == 1)
		{
			// não
			if (warning_option_pos == 0)
			{
				warning = 0;
				audio_play(snd_option_return, 0, VOLUME_SOUND);
			}
			else
			{
				move = 0;
				if (option_pos == 1)
				{
					if (global.fastmenu == 0)
						global.fastmenu = 0.5;
					room_go(room_menu, -1, -1);
					audio_play(snd_option_select, 0, VOLUME_SOUND);
				}
				else if (option_pos == 2)
					game_end();
			}
		}
	}
}