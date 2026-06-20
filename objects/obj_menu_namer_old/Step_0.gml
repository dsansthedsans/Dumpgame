
// get keys
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_enter = key("enter_press");
if (press_l = 1) || (press_r == 1) || (press_u == 1) || (press_d == 1)
	audio_play(snd_option_move, 0, VOLUME_SOUND);
if (press_enter == 1)
{
	var _snd = snd_option_select;
	if (string_length(global.chara_name) >= 11 && myfloor != 3)
		_snd = snd_option_cantselect;
	audio_play(_snd, 0, VOLUME_SOUND);
}

// movement
if (namer_move == 1)
{
	// horizontal movement
	if (press_l == 1)
		mypos -= 1;
	if (press_r == 1)
		mypos += 1;
		
	// vertical movement
	if (press_u == 1)
		myfloor -= 1;
	if (press_d == 1)
		myfloor += 1;
	
	// vertical limits
	if (myfloor > 3)
		myfloor = 0
	if (myfloor < 0)
		myfloor = 3;
			
	// get current length
	if (myfloor == 0) || (myfloor == 1)
		myfloor_length = letter_length
	if (myfloor == 2)
		myfloor_length = number_length;
	if (myfloor == 3)
		myfloor_length = bonus_length;
	
	// custom position placement
	if ((myfloor == 0 || myfloor == 2) && (press_u == 1 || press_d == 1) && old_mypos != -1)
	{
		mypos = old_mypos;
		old_mypos = -1;
	}
	if (myfloor == 3 && (press_u == 1 || press_d == 1))
	{
		old_mypos = mypos;
		if (mypos >= 0 && mypos <= 4)
			mypos = 0;
		if (mypos >= 5 && mypos <= 9)
			mypos = 1;
		if (mypos >= 10 && mypos <= 12)
			mypos = 2;
	}
	
	// horizontal limits
	if (mypos >= myfloor_length)
		mypos = 0;
	if (mypos < 0)
		mypos = (myfloor_length - 1);
}

// selection
if (namer_enter == 1 && press_enter == 1)
{
	// numbers and letters
	if (string_length(global.chara_name) < 11)
	{
		if (myfloor == 0) || (myfloor == 1) // letters
		{
			var _myletterfloor = letter1[mypos];
			if (myfloor == 1)
				_myletterfloor = letter2[mypos];
			global.chara_name += _myletterfloor;
		}
		if (myfloor == 2) // number
			global.chara_name += number[mypos];
	}
	if (myfloor == 3) // bonus
	{
		if (mypos == 0)
			capslock = !capslock;
		if (mypos == 1)
			global.chara_name = string_copy(global.chara_name, 1, (string_length(global.chara_name) - 1));
		if (mypos == 2)
		{
			controller.menu_move = 1;
			//controller.menu_option_alpha = 1;
			controller.leftnamer = 0;
			//destroy(id);
			shoulddestroy = 1;
		}
	}
}

// set name limit in case the first one doesn't work
if (string_length(global.chara_name) > 11)
	global.chara_name = string_copy(global.chara_name, 1, 11);
