
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_enter = key("enter_press");
press_shift = key("shift_press");


// movimento
if (thiswriter == -1 && lvl != 3)
{
	var _key0 = press_d;
	var _key1 = press_u;
	if (lvl == 2)
	{
		_key0 = press_r;
		_key1 = press_l;
	}

	var _oldpos = option_pos;
	option_pos += (_key0 - _key1);	
	if (option_pos < 0)
		option_pos = (option_length[lvl] - 1);
	if (option_pos >= option_length[lvl])
		option_pos = 0;
	if (_oldpos != option_pos)
		audio_play(snd_option_move, 0, VOLUME_SOUND);
}


// seleção
if (press_enter == 1 && thiswriter == -1)
{
	// principal
	if (lvl == 0)
	{
		option_pos_orig = option_pos;
		if (option_pos == 0)
			lvl = 1;
		else if (option_pos == 1)
			lvl = 3;
		option_pos = 0;
		audio_play(snd_option_select, 0, VOLUME_SOUND);
	}

	// inventário (principal)
	else if (lvl == 1)
	{
		if (option[1, option_pos] != undefined)
		{
			lvl = 2;
			option_pos_old = option_pos;
			option_pos = 0;
			audio_play(snd_option_select, 0, VOLUME_SOUND);
		}
		else
			audio_play(snd_option_cantselect, 0, VOLUME_SOUND);
	}
	
	// inventário (outros)
	else if (lvl == 2)
	{	
		var _id = "use";
		if (option_pos == 1)
		{
			_id = "info";
			audio_play(snd_option_select, 0, VOLUME_SOUND);
		}
		else if (option_pos == 2)
			_id = "drop";
		writer("charamenu_item_" + string(_id), -1, -1);
		//option_pos = 0;
		//lvl = 0;
		option_pos = option_pos_old;
		option_pos_old = 0;
		item_organize();
		event_user(0);
		lvl = 1;
	}
	
	press_shift = 0;
}


// voltar
if (press_shift == 1 && thiswriter == -1)
{
	// não principal
	if (lvl > 0)
	{
		audio_play(snd_option_return, 0, VOLUME_SOUND);
		if (lvl == 1) || (lvl == 3)
		{
			option_pos = 0;
			if (lvl == 3)
				option_pos = 1;
			option_pos_orig = 0;
			lvl = 0;
		}
		else
		{
			option_pos = option_pos_old;
			option_pos_old = 0;
			lvl = 1;	
		}
	}
}


// sair da textbox
if (thiswriter != -1 && exists(thiswriter) == 0)
	thiswriter = -1;