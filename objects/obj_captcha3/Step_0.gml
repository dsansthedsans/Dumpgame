// Levers
if (stage == 0)
{
	for (var l = 0; l < 2; l++)
	{
		if (levers[l].active == false && key("enter_press") == true && exists(chara) == true && point_distance(chara.x, (chara.y - (chara.sprite_height / 2)), (levers[l].object.x + (levers[l].object.sprite_width / 2)), (levers[l].object.y + (levers[l].object.sprite_height / 2))) <= levers[l].distance && global.chara_facing == UP && global.chara_move == true)
		{
			levers[l].active = true;
			global.flag[50] = 0.25;
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
	stage = 2;
	global.flag[50] = 0.5;
	chara_change(-1, false, false, true, false, false, true);
	chara_stop();
	alarm[2] = (60 + 15);
}
for (var l = 0; l < 2; l++)
{
	var _index = levers[l].object.image_index;
	levers[l].object.image_index = levers[l].active;
	if (_index != levers[l].object.image_index && stage < 16)
	{
		if (audio_playing(snd_heartpulse1) == true)
			audio_stop(snd_heartpulse1);
		audio_play(snd_heartpulse1, false, VOLUME_SOUND);
		shakeobj(levers[l].object, 1, 1, 0.1);
	}
}
// Doors
if (stage == 3)
{
	doors[0].active = true;
	gate.active = true;
	timer.active = true;
	timer.seconds = timer.secondsTotal;
	timer.fog.alpha = 0;
	timer.fog.alpha_siner = 0;
	if (buttons_word != buttons_wordCurr && global.flag[51] == false)
	{
		buttons_wordCurr = "";
		for (var v = 0; v < sqrt(buttons_length); v++)
		{
			for (var h = 0; h < sqrt(buttons_length); h++)
				buttons[h, v].active = false;
		}
	}
	if (round(moveable.object.x) != moveable.endX && round(moveable.object.y) != moveable.endY && global.flag[54] == false)
	{
		moveable.object.x = moveable.startX;
		moveable.object.y = moveable.startY;
		moveable.object.depth = -moveable.object.bbox_bottom;
		moveable.object.canmove = 1;	
	}
	for (var v = 0; v < sqrt(plates_length); v++)
	{
		for (var h = 0; h < sqrt(plates_length); h++)
			plates[h, v].active = false;
	}
	chara_change(-1, true, true, true, false, false, true);
	stage = 4;
}
if (stage == 4 && buttons_word == buttons_wordCurr)
{
	if (global.flag[51] == false)
		audio_play(snd_victory, false, VOLUME_SOUND);
	global.flag[51] = true;
	stage = 5;
	alarm[2] = 30;
}
if (stage == 6)
{
	doors[1].active = true;
	stage = 7;
}
if (stage == 7 && round(moveable.object.x) == moveable.endX && round(moveable.object.y) == moveable.endY)
{
	if (global.flag[54] == false)
		audio_play(snd_victory, false, VOLUME_SOUND);
	global.flag[54] = true;
	stage = 8;
	alarm[2] = 30;
	moveable.object.canmove = 0;
}
if (stage == 9)
{
	doors[2].active = true;
	stage = 10;
}
if (stage == 10 && plates_activeAll == true)
{
	global.flag[50] = 0.75;
	chara_change(-1, false, false, true, false, false, true);
	chara_stop();
	party_change(0, -1, -1);
	party_stop(0);
	party_facing(0, UP);
	stage = 11;
	alarm[2] = 90;
	timer.active = false;
	audio_play(snd_victory, false, VOLUME_SOUND);
}
if (stage == 12)
{
	global.flag[50] = 1;
	stage = 13;
	alarm[2] = 90;
	doors[3].active = true;
	gate.active = false;
	audio_play(snd_cheer, false, VOLUME_SOUND);
	audio_play(snd_applause, false, VOLUME_SOUND);
}
if (stage == 14)
{
	writer("event_m6_postcaptcha3");
	stage = 15;
}
if (stage == 15 && exists(thiswriter) == false)
{
	chara_change(-1, true, true, false, true, true, true);
	chara_facing(DOWN);
	party_change(0, 0, -1);
	stage = 16;
}
for (var d = 0; d < doors_length; d++)
{
	if (is_undefined(doors[d].object) == false && exists(doors[d].object) == true)
	{
		var _sprite = doors[d].object.sprite_index;
		doors[d].object.sprite_index = ((doors[d].active == false) ? spr_overworld_bigdoor_closed : spr_overworld_bigdoor_open);
		if (_sprite != doors[d].object.sprite_index && stage < 16)
		{
			if (_sprite == spr_overworld_bigdoor_closed)
			{
				if (audio_playing(snd_bluh) == true)
					audio_stop(snd_bluh);
				audio_play(snd_bluh, 0, VOLUME_SOUND);
			}
			else
				audio_play(snd_impact, 0, VOLUME_SOUND);
			shakescreen(5, 5);
		}
	}
}
// Gate
if (gate.object == undefined) || (exists(gate.object) == false)
{
	gate.object = create(gate.x, gate.y, obj_solid_block);
	with (gate.object)
		image_xscale = 2;
}
else
	gate.object.x = (gate.x - gate.width);
// Timer
if (timer.active == true && timer.seconds > 0)
{
	timer.milliseconds -= 1;
	if (timer.milliseconds < 0)
	{
		timer.seconds = clamp((timer.seconds - 1), 0, timer.seconds);
		timer.milliseconds = ((timer.seconds > 0) ? timer.millisecondsTotal : 0);
		timer.color_green = 255;
		timer.scale = 1.25;
		audio_play(snd_bump, false, VOLUME_SOUND, , , , (1 + (0.25 * !(timer.seconds % 2))));
		audio_play(snd_txt1, false, VOLUME_SOUND, 1.5, , , (1 + (0.25 * !(timer.seconds % 2))));
		if (timer.seconds <= 0)
		{
			stage = 0;
			for (var l = 0; l < 2; l++)
				levers[l].active = false;
			gate.active = false;
			timer.active = false;
			moveable.object.canmove = 0;
			global.flag[50] = 0;
			global.chara_cutscene = false;
			if (exists(obj_writer_controller) == false)
				
			audio_play(snd_trombone, 0, VOLUME_SOUND);
		}
	}
}
// Buttons & Reset button
if (stage >= 3 && buttons_word != buttons_wordCurr)
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
					if (string_length(buttons_wordCurr) < buttons_length)
						buttons_wordCurr += buttons[h, v].letter;
					if (audio_playing(snd_heartpulse1) == true)
						audio_stop(snd_heartpulse1);
					audio_play(snd_heartpulse1, false, VOLUME_SOUND);
				}
			}
		}
	}
}
else
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
// Plates & Reset button
if (stage >= 3 && plates_activeAll == false)
{
	// Reset button
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
						plates_activeAll = true;
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
			plates[h, v].active = (global.flag[50] >= 0.75);
	}
}
