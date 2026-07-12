
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_enter = key("enter_press");
if (keyboard_check_pressed(vk_f10) == 1)
{
	keyboard_string = "";
	typing = !typing;
	audio_play(snd_f10, 0, VOLUME_SOUND);
}

// normal
if (typing == 0)
{
	// movimento
	var _oldpos0 = option_pos[0];
	option_pos[0] += (press_d - press_u); // vertical
	if (option_pos[0] < 0)
		option_pos[0] = 3;
	if (option_pos[0] > 3)
		option_pos[0] = 0;
	
	if (option_pos[0] != _oldpos0 && option_pos[0] != 3 && option_oldpos[1] != -1) // ir para a opção antiga depois de ir para a última camada
	{
		option_pos[1] = option_oldpos[1];
		option_oldpos[1] = -1;
	}

	var _oldpos1 = option_pos[1];
	var _max = (array_length(option[option_pos[0]]) - 1); // horizontal
	option_pos[1] += (press_r - press_l);

	if (option_pos[0] != _oldpos0 && option_pos[0] == 3) // ajeitar opção se descer para a última camada
	{
		option_oldpos[1] = option_pos[1];
		var p = option_pos[1]
		if (p >= 0 && p <= 3)
			p = 0;
		if (p >= 4 && p <= 8)
			p = 1;
		if (p >= 9 && p <= 12)
			p = 2;
		option_pos[1] = p;
	}

	if (option_pos[1] < 0)
		option_pos[1] = _max;
	if (option_pos[1] > _max)
		option_pos[1] = 0;

	if (option_pos[0] != _oldpos0) || (option_pos[1] != _oldpos1) // tocar som
		audio_play(snd_option_move, 0, VOLUME_SOUND);

	// seleção
	if (press_enter == 1)
	{
		// letras e números
		if (option_pos[0] >= 0 && option_pos[0] <= 2)
		{
			if (string_length(global.chara_name) < 11)
			{
				global.chara_name += option[option_pos[0], option_pos[1]];
				audio_play(snd_option_select, 0, VOLUME_SOUND);
			}
			else
			{
				audio_play(snd_option_cantselect, 0, VOLUME_SOUND);
				shakescreen(2, 2);
			}
		}
	
		// uppercase, backspace e confirm
		if (option_pos[0] == 3)
		{
			// uppercase
			if (option_pos[1] == 0)
			{
				upper = !upper;
				event_user(0);
			}
		
			// backspace
			if (option_pos[1] == 1)
				global.chara_name = string_copy(global.chara_name, 0, (string_length(global.chara_name) - 1));
		
			// confirm
			if (option_pos[1] == 2)
			{
				controller.move = 1;
				controller.namer_state = 1;
				controller.option_alpha = 1;
				destroy(id);
			}
	
			audio_play(snd_option_select, 0, VOLUME_SOUND);
		}
	}
}

// digitar
if (typing == 1)
{
	// adicionar caractere
	if (keyboard_string != "")
	{
		var _add = 0;
		
		// checar se o caractere está disponível
		for (var z = 0; z < 3; z++) // cada linha
		{		
			for (var i = 0; i < 13; i++) // cada opção
			{
				if (string_upper(keyboard_string) == string_upper(option[z, i]))
				{
					_add = 1;
					break;
				}
			}
			
			if (_add == 1)
				break;
		}
		
		// adicionar caractere
		if (_add == 1 && string_length(global.chara_name) < 11)
			global.chara_name += keyboard_string;
	}
	keyboard_string = "";
	
	// backspace
	if (keyboard_check_pressed(vk_backspace) == 1)
	{
		global.chara_name = string_copy(global.chara_name, 0, (string_length(global.chara_name) - 1));
		if (keyboard_check(vk_control) == 1)
			global.chara_name = "";
	}
}























