
// puzzle 1
if (stage == 1)
{
	// buttons collision
	for (hh = 0; hh < 4; hh++)
	{
		for (vv = 0; vv < 4; vv++)
		{
			with (button[hh, vv])
			{
				hh = other.hh;
				vv = other.vv;
				if (place_meeting(x, y, obj_chara) == 1 && other.button_pressed[hh, vv] == 0)
				{
					image_index = 1;
					audio_stop(snd_heartpulse1);
					audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
					other.puzzle_curword += other.button_letter[hh, vv];
					other.button_pressed[hh, vv] = 1;
				}
			}
		}
	}
	
	// reset button collision
	with (button_reset)
	{
		if (place_meeting(x, y, obj_chara) == 1 && canpress == 1)
		{
			if (pressed == 0)
			{
				image_index = 3;
				audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
				for (var h = 0; h < 4; h++)
				{
					for (var v = 0; v < 4; v++)
					{
						other.puzzle_curword = "";
						other.button_pressed[h, v] = 0;
						other.button[h, v].image_index = 0;
					}
				}
				pressed = 1;
			}
		}
		else if (canpress == 1)
		{
			image_index = 2;
			pressed = 0;
		}
	}
	
	// check victory
	if (puzzle_curword == puzzle_trtword)
	{
		audio_play(snd_victory, 0, 0);
		button_reset.canpress = 0;
		button_reset.image_index = 3;
		delay = 60;
		stage = 2;
	}
}

// puzzle 2
if (stage == 3)
{
	// check victory
	if (moveable.x == 220 && moveable.y == 740)
	{
		audio_play(snd_victory, 0, VOLUME_SOUND);
		moveable.canmove = 0;
		delay = 60;
		stage = 4;
	}
}

// puzzle 3
if (stage == 5)
{
	// plates collision and check victory
	var _green = 0;
	for (hh = 0; hh < 3; hh++)
	{
		for (vv = 0; vv < 3; vv++)
		{
			// plates collision
			if (plate_finished == 0)
			{
				with (plate[hh, vv])
				{
					if (place_meeting(x, y, obj_chara) == 1)
					{
						if (pressed == 0)
						{
							with (other)
							{
								if (hh == 0 && vv = 0)
								{
									c3_p(0, 0);
									c3_p(1, 0);
									c3_p(0, 1);
								}
								if (hh == 1 && vv == 0)
								{
									c3_p(0, 0);
									c3_p(1, 0);
									c3_p(2, 0);	
								}
								if (hh == 2 && vv == 0)
								{
									c3_p(1, 0);
									c3_p(2, 0);
									c3_p(2, 1);		
								}
							
								if (hh == 0 && vv = 1)
								{
									c3_p(0, 0);
									c3_p(0, 1);
									c3_p(0, 2);
								}
								if (hh == 1 && vv == 1)
								{
									c3_p(1, 0);
									c3_p(0, 1);
									c3_p(1, 1);
									c3_p(2, 1);
									c3_p(1, 2);
								}
								if (hh == 2 && vv == 1)
								{
									c3_p(2, 0);
									c3_p(2, 1);
									c3_p(2, 2);
								}
							
								if (hh == 0 && vv = 2)
								{
									c3_p(0, 2);
									c3_p(1, 2);
									c3_p(0, 1);
								}
								if (hh == 1 && vv == 2)
								{
									c3_p(0, 2);
									c3_p(1, 2);
									c3_p(2, 2);	
								}
								if (hh == 2 && vv == 2)
								{
									c3_p(1, 2);
									c3_p(2, 2);
									c3_p(2, 1);		
								}
							}
							audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
						}
						pressed = 1;
					}
					else
						pressed = 0;
				}
			}
			
			// check victory
			if (plate_color[hh, vv] == 1)
				_green += 1;
			if (_green == 9)
			{
				audio_play(snd_victory, 0, VOLUME_SOUND);
				plate_reset.canpress = 0;
				plate_reset.image_index = 3;
				plate_finished = 1;
				delay = 60;
				stage = 6;
			}
		}	
	}
	
	// reset button collision
	if (plate_finished == 0)
	{
		with (plate_reset)
		{
			if (place_meeting(x, y, obj_chara) == 1 && canpress == 1)
			{
				if (pressed == 0)
				{
					image_index = 3;
					audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
					for (var h = 0; h < 3; h++)
					{
						for (v = 0; v < 3; v++)
							other.plate_color[h, v] = 0;
					}
					pressed = 1;
				}
			}
			else if (canpress == 1)
			{
				image_index = 2;
				pressed = 0;
			}
		}
	}
}

// captcha sequence
if (stage == 0 && global.flag[50] == 1 && global.flag[51] == 1)
{
	global.chara_openmenu = 0;
	global.chara_canpause = 0;
	
	door[0].sprite_index = spr_overworld_bigdoor_open;
	shakescreen(3, 3);
	
	create(140, 1500, obj_overworld_solid);
	thisobj.sprite_index = spr_overworld_bottomgate;
	gate = thisobj;
	
	alarm[0] = 60;
	stage = 1;
}
if (stage == 2)
{
	if (delay <= 0)
	{
		door[1].sprite_index = spr_overworld_bigdoor_open;
		audio_play(snd_bluh, 0, VOLUME_SOUND);
		shakescreen(3, 3);
		stage = 3;
	}
	else
		delay -= 1;
}
if (stage == 4)
{
	if (delay <= 0)
	{
		door[2].sprite_index = spr_overworld_bigdoor_open;
		audio_play(snd_bluh, 0, VOLUME_SOUND);
		shakescreen(3, 3);
		stage = 5;
	}
	else
		delay -= 1;	
}
if (stage == 6)
{
	if (delay <= 0)
	{
		door[3].sprite_index = spr_overworld_bigdoor_open;
		audio_play(snd_bluh, 0, VOLUME_SOUND);
		shakescreen(3, 3);
		stage = 7;
	}
	else
		delay -= 1;	
}
if (stage == 8)
{
	timer_alpha -= 0.01;
	if (timer_alpha <= 0)
	{
		destroy(gate);
		stage = 9;
	}
}

// death
if (stage < 8 && timer[0] <= 0 && timer[1] <= 0)
{
	if (death_stage == 0)
	{
		global.chara_move = 0;
		explosion(obj_chara.x, (obj_chara.y - 10));
		thismarker.depth = -5000;
		destroy(obj_writer_controller);
		death_delay = 30;
		death_stage = 1;
	}
	else if (death_stage == 1)
	{
		if (death_delay <= 0)
			game_end();
		else
			death_delay -= 1;
	}
}








