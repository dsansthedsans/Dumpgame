// Levers
if (stage == 0)
{
	for (var l = 0; l < 2; l++)
	{
		if (levers[l].active == false && key("enter_press") == true && exists(chara) == true && point_distance(chara.x, (chara.y - (chara.sprite_height / 2)), (levers[l].object.x + (levers[l].object.sprite_width / 2)), (levers[l].object.y + (levers[l].object.sprite_height / 2))) <= 20 && global.chara_facing == UP && global.chara_move == true)
		{
			levers[l].active = true;
			audio_play(snd_heartpulse1, false, VOLUME_SOUND);
			if (levers[!l].active == true)
			{
				stage = 1;
				break;
			}
		}
	}
}
if (stage == 1)
{
	global.flag[50] = 0.5;
	chara_change(-1, false, false, true, false, false, true);
	stage = 2;
	alarm[2] = (60 + 15);
}
// Doors
if (stage == 3)
{
	chara_change(-1, true, true, true, false, false, true);
	if (is_undefined(doors[0].object) == false)
		doors[0].object.sprite_index = spr_overworld_bigdoor_open;
	doors[0].active = true;
	audio_play(snd_bluh, 0, VOLUME_SOUND);
	shakescreen(3, 3);
	timer.active = true;
	stage = 4;
}
// Buttons & Reset button
if (buttons_word != "" && buttons_word != buttons_wordCurr && buttons_length > 0)
{
	// Reset button
	if (collision_rectangle(chara.bbox_left, chara.bbox_top, chara.bbox_right, chara.bbox_bottom, buttonsReset.object, true, true) == noone && ((exists(m6) == false) || (exists(m6) == true && collision_rectangle(m6.bbox_left, m6.bbox_top, m6.bbox_right, m6.bbox_bottom, buttonsReset.object, true, true) == noone)))
	{
		buttonsReset.active = false;
		buttonsReset.object.image_index = 2;
	}
	else
	{
		if (buttonsReset.active == false)
		{
			buttons_wordCurr = "";
			for (var v = 0; v < sqrt(buttons_length); v++)
			{
				for (var h = 0; h < sqrt(buttons_length); h++)
					buttons[h, v].active = false;
			}
			audio_play(snd_heartpulse1, false, VOLUME_SOUND);
		}
		buttonsReset.active = true;
		buttonsReset.object.image_index = 3;
	}
	// Buttons
	for (var v = 0; v < sqrt(buttons_length); v++)
	{
		for (var h = 0; h < sqrt(buttons_length); h++)
		{
			if (buttons[h, v].active == false)
			{
				buttons[h, v].object.image_index = 0;
				if (collision_rectangle(chara.bbox_left, chara.bbox_top, chara.bbox_right, chara.bbox_bottom, buttons[h, v].object, true, true) != noone)
				{
					buttons[h, v].active = true;
					buttons[h, v].object.image_index = 1;
					buttons_wordCurr += buttons[h, v].letter;
					if (buttons_word == buttons_wordCurr)
						audio_play(snd_victory, false, VOLUME_SOUND);
					if (audio_playing(snd_heartpulse1) == true)
						audio_stop(snd_heartpulse1);
					audio_play(snd_heartpulse1, false, VOLUME_SOUND);
				}
			}
		}
	}
}
else if (buttons_word != "" && buttons_word == buttons_wordCurr && buttons_length > 0)
{
	buttonsReset.active = true;
	buttonsReset.object.image_index = 3;
	for (var v = 0; v < sqrt(buttons_length); v++)
	{
		for (var h = 0; h < sqrt(buttons_length); h++)
		{
			buttons[h, v].active = true;
			buttons[h, v].object.image_index = 1;
		}
	}
}
// Plates & Reset plate
if (plates_activeAll == false)
{
	// Reset plate
	if (collision_rectangle(chara.bbox_left, chara.bbox_top, chara.bbox_right, chara.bbox_bottom, platesReset.object, true, true) == noone && ((exists(m6) == false) || (exists(m6) == true && collision_rectangle(m6.bbox_left, m6.bbox_top, m6.bbox_right, m6.bbox_bottom, platesReset.object, true, true) == noone)))
	{
		platesReset.active = false;
		platesReset.object.image_index = 2;
	}
	else
	{
		if (platesReset.active == false)
		{
			for (var v = 0; v < sqrt(plates_length); v++)
			{
				for (var h = 0; h < sqrt(plates_length); h++)
					plates[h, v].active = false;
			}
			audio_play(snd_heartpulse1, false, VOLUME_SOUND);
		}
		platesReset.active = true;
		platesReset.object.image_index = 3;
	}
	// Plates
	for (var v = 0; v < sqrt(plates_length); v++)
	{
		for (var h = 0; h < sqrt(plates_length); h++)
		{
			if (collision_rectangle(chara.bbox_left, chara.bbox_top, chara.bbox_right, chara.bbox_bottom, plates[h, v].object, true, true) != noone)
			{
				if (plates[h, v].activated == false)
				{
					plates[h, v].active = !plates[h, v].active;
					if (h > 0)
						plates[(h - 1), v].active = !plates[(h - 1), v].active;
					if (h < (sqrt(plates_length) - 1))
						plates[(h + 1), v].active = !plates[(h + 1), v].active;
					if (v > 0)
						plates[h, (v - 1)].active = !plates[h, (v - 1)].active;
					if (v < (sqrt(plates_length) - 1))
						plates[h, (v + 1)].active = !plates[h, (v + 1)].active;
					var _active = 0;
					for (var vv = 0; vv < sqrt(plates_length); vv++)
					{
						for (var hh = 0; hh < sqrt(plates_length); hh++)
						{
							if (plates[hh, vv].active == true)
								_active += 1;
							else
								break;
						}
					}
					if (_active == plates_length)
					{
						plates_activeAll = true;
						audio_play(snd_victory, false, VOLUME_SOUND);
					}
					if (audio_playing(snd_option_select) == true)
						audio_stop(snd_option_select);
					audio_play(((plates[h, v].active == true) ? snd_option_select : snd_option_move), false, VOLUME_SOUND, , , , (0.5 + plates[h, v].active));
				}
				plates[h, v].activated = true;
			}
			else
				plates[h, v].activated = false;
		}
	}
}
else
{
	platesReset.active = true;
	platesReset.object.image_index = 3;
	for (var v = 0; v < sqrt(plates_length); v++)
	{
		for (var h = 0; h < sqrt(plates_length); h++)
			plates[h, v].active = true;
	}
}
// Timer
if (timer.active == true && timer.seconds > 0)
{
	timer.milliseconds -= 1;
	if (timer.milliseconds < 0)
	{
		timer.seconds = clamp((timer.seconds - 1), 0, timer.seconds);
		timer.milliseconds = ((timer.seconds > 0) ? 60 : 0);
		timer.color_green = 255;
		timer.scale = 1.25;
		audio_play(snd_bump, false, VOLUME_SOUND, , , , (1 + (0.25 * !(timer.seconds % 2))));
		audio_play(snd_txt1, false, VOLUME_SOUND, 1.5, , , (1 + (0.25 * !(timer.seconds % 2))));
	}
}