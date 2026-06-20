
// skip text and next page
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_shift = key("shift_press");
press_enter = key("enter_press");
hold_ctrl = key("ctrl_hold");

// fast skip
if (hold_ctrl == 1 && press_shift == 0 && press_enter == 0 && msg_skip[page] == 1 && msg_autoskip[page] == 0)
{
	if (fastskip_delay <= 0)
	{
		if (fastskip_stage == 0)
		{
			text_length = (string_length(msg[page]) + 1);
			fastskip_delay = 1;
			fastskip_stage = 1;
		}
		else
		{
			if (msg_next[page] == 1 && question_active == 0)
				event_user(1);
			fastskip_delay = 1;
			fastskip_stage = 0;
		}
	}
	else
		fastskip_delay -= 1;
}
else
{
	fastskip_stage = 0;
	fastskip_delay = 0;	
}

if (text_length < (string_length(msg[page]) - 1)) // skip page
{
	writing = 1;
	
	// normal skip
	if (press_shift == 1 && msg_skip[page] == 1 && question_active == 0) || (msg_autoskip[page] == 1)
		text_length = (string_length(msg[page]) + 1);
}
if (text_length >= (string_length(msg[page]) - 1)) // next page
{
	writing = 0;
	face_index = 0;
	if (press_enter == 1 && msg_next[page] == 1 && question_active == 0)
		event_user(1);
}
