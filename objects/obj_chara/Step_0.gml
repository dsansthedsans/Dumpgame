
hold_l = key("left_hold");
hold_r = key("right_hold");
hold_u = key("up_hold");
hold_d = key("down_hold");
hold_shift = key("shift_hold");
press_enter = key("enter_press");
press_ctrl = key("ctrl_press");
press_shift = key("shift_press");
press_esc = key("pausegame");


// abrir menu
if (global.chara_cutscene == 0 && global.chara_open_menu == 1 && exists(obj_room_transition) == false)
{
	if (exists(obj_chara_menu) == 0 && press_ctrl == 1)
	{
		audio_play(snd_option_move, 0, VOLUME_SOUND);
		chara_change(-1, 0, 0, -1, 1, 0, -1);
		create(0, 0, obj_chara_menu);
	}
	else if (exists(obj_chara_menu) == 1 && ((press_ctrl == 1) || (press_shift == 1 && obj_chara_menu.lvl == 0)) && obj_chara_menu.thiswriter == -1 && obj_chara_menu.changed == 0)
	{
		audio_play(snd_option_return, 0, VOLUME_SOUND);
		chara_change(-1, 1, 1, -1, 1, 1, -1);
		destroy(obj_chara_menu);
	}
}


// pausar jogo
if (global.chara_cutscene == 0 && global.chara_pause_game == 1 && exists(obj_room_transition) == false)
{
	pauseobj = obj_chara_pause;
	if (exists(pauseobj) == 0 && press_esc == 1)
	{
		audio_play(snd_option_move, 0, VOLUME_SOUND);
		chara_change(-1, 0, 0, -1, 0, 1, -1);
		create(0, 0, pauseobj);
	}
	else if (exists(pauseobj) == 1 && ((press_esc == 1) || (press_shift == 1) || (pauseobj.press_enter == 1 && pauseobj.option_pos == 0)))
	{
		audio_play(snd_option_return, 0, VOLUME_SOUND);
		chara_change(-1, 1, 1, -1, 1, 1, -1);
		destroy(pauseobj);
	}
}


// movimento, colisão, animação e geração de passos
if (global.chara_move == 1)
{
	// correr
	running = 0;
	curspeed = wspeed;
	curimgspeed = wimgspeed;
	if (global.chara_run == 1 && ((hold_shift == 1 && global.autorun == 0) || (global.autorun == 1 && hold_shift == 0)) && place_meeting(x, y, obj_walk_block) == 0)
	{
		running = 1;
		global.chara_runtime += 1;
		rspeed_pos = 0;
		if (global.chara_runtime >= 180) || (global.flag[60] == true && global.flag[61] == false)
			rspeed_pos = 1;
		curspeed = rspeed[rspeed_pos];
		curimgspeed = rimgspeed[rspeed_pos];
	}
	else
		global.chara_runtime = 0;
	
	// movimento
	xmove = 0;
	ymove = 0;
	
	if (hold_l == 1) // esquerda
	{
		xmove = -curspeed;
		turn = 1;
		if (hold_u == 1 && global.chara_facing == UP) 
			turn = 0;
		if (hold_d == 1 && global.chara_facing == DOWN) 
			turn = 0;
		if (turn == 1)
			global.chara_facing = LEFT;
	}
	if (hold_r == 1 && hold_l == 0) // direita
	{
		xmove = curspeed;
		turn = 1;
		if (hold_u == 1 && global.chara_facing == UP) 
			turn = 0;
		if (hold_d == 1 && global.chara_facing == DOWN) 
			turn = 0;
		if (turn == 1)
			global.chara_facing = RIGHT;	
	}
	if (hold_u == 1) // cima
	{
		ymove = -curspeed;
		turn = 1;
		if (hold_l == 1 && global.chara_facing == LEFT) 
			turn = 0;
		if (hold_r == 1 && global.chara_facing == RIGHT) 
			turn = 0;
		if (turn == 1)
			global.chara_facing = UP;
		
		// friskdance
		if (friskdance > 0)
		{
			if (hold_d == 1 && hold_l == 0 && hold_r == 0 && place_meeting(x, (y + ymove), obj_solid_parent) > 0)
			{
				friskdance = 2;
				ymove = 0;
				hold_u = 0;
			}
			else if (hold_d == 0) || (hold_l == 1) || (hold_r == 1)
				friskdance = 1;
		}
	}
	else
		friskdance = 1;
	if (hold_d == 1 && hold_u == 0) // baixo
	{
		ymove = curspeed;
		turn = 1;
		if (hold_l == 1 && global.chara_facing == LEFT) 
			turn = 0;
		if (hold_r == 1 && global.chara_facing == RIGHT) 
			turn = 0;
		if (turn == 1)
			global.chara_facing = DOWN;
	}
	
	// colisão da escada
	if (place_meeting((x + xmove), y, obj_solid_stairs_lu) == 1 && hold_l == 1)
	{
		xmove = -curspeed
		ymove = -curspeed
	}
	if (place_meeting(x, (y + ymove), obj_solid_stairs_lu) == 1 && hold_d == 1 && hold_l == 0)
	{
		xmove = curspeed
		ymove = curspeed
	}
	
	if (place_meeting((x + xmove), y, obj_solid_stairs_ru) == 1 && hold_r == 1)
	{
		xmove = curspeed
		ymove = -curspeed
	}
	if (place_meeting(x, (y + ymove), obj_solid_stairs_ru) == 1 && hold_d == 1 && hold_r == 0)
	{
		xmove = -curspeed
		ymove = curspeed
	}
	
	if (place_meeting((x + xmove), y, obj_solid_stairs_ld) == 1 && hold_l == 1)
	{
		xmove = -curspeed
		ymove = curspeed
	}
	if (place_meeting(x, (y + ymove), obj_solid_stairs_ld) == 1 && hold_u == 1 && hold_l == 0)
	{
		xmove = curspeed
		ymove = -curspeed
	}
	
	if (place_meeting((x + xmove), y, obj_solid_stairs_rd) == 1 && hold_r == 1 && hold_l == 0)
	{
		xmove = curspeed
		ymove = curspeed
	}
	if (place_meeting(x, (y + ymove), obj_solid_stairs_rd) == 1 && hold_u == 1 && hold_l == 0 && hold_r == 0)
	{
		xmove = -curspeed
		ymove = -curspeed
	}
		
	// colisão normal
	if (place_meeting((x + xmove), y, obj_solid_parent) > 0) || (place_meeting((x + xmove), y, obj_solidinteract_parent) > 0) // horizontal
	{
		colcheck = 0;
		if (xmove < 0) 
		{
            var i = xmove;
            while (i <= 0) 
			{
                if (place_meeting((x + i), y, obj_solid_parent) == 0 && place_meeting((x + i), y, obj_solidinteract_parent) == 0)
				{
                    xmove = i;
                    colcheck = 1;
					break;
                }
                else 
				{
                    i += 1;
                    continue
                }
            }
        }
		if (xmove > 0) 
		{
            var i = xmove;
            while (i >= 0) 
			{
                if (place_meeting((x + i), y, obj_solid_parent) == 0 && place_meeting((x + i), y, obj_solidinteract_parent) == 0) 
				{
                    xmove = i;
					colcheck = 1;
                    break;
                }
                else 
				{
                    i -= 1;
                    continue;
                }
            }
        }
		if (colcheck == 0)
			xmove = 0;
	}
	if (place_meeting(x, (y + ymove), obj_solid_parent) > 0) || (place_meeting(x, (y + ymove), obj_solidinteract_parent) > 0) // vertical
	{
		colcheck = 0;
		if (ymove <= 0) 
		{
            var i = ymove;
            while (i <= 0) 
			{
                if (place_meeting(x, (y + i), obj_solid_parent) == 0 && place_meeting(x, (y + i), obj_solidinteract_parent) == 0) 
				{
                    ymove = i;
                    colcheck = 1;
					break;
                }
                else 
				{
                    i += 1;
                    continue
                }
            }
        }
		if (ymove >= 0) 
		{
            var i = ymove;
            while (i >= 0) 
			{
                if (place_meeting(x, (y + i), obj_solid_parent) == 0 && place_meeting(x, (y + i), obj_solidinteract_parent) == 0) 
				{
                    ymove = i;
					colcheck = 1;
                    break;
                }
                else 
				{
                    i -= 1;
                    continue;
                }
            }
        }
		if (colcheck == 0)
			ymove = 0;
	}
	
	// mudar posição
	x += xmove;
	y += ymove;
	
	// animação, profundidade e geração de passos
	if (xmove != 0) || (ymove != 0) // se movendo
	{
		depth = -bbox_bottom;
		image_speed = curimgspeed;
		if (moving == 0)
			image_index = 1;
		if (afktime >= afkmaxtime && chara_murder() < 1)
		{
			xscale = 0.75;
			yscale = 0.5;
			audio_play(snd_splat_reversed, 0, VOLUME_SOUND);
		}
		afktime = 0;
		moving = 1;
		
		// geração de passos
		if (global.chara_encounter == 1)
		{
			var _amt = 1;
			if (running == 1)
			{
				_amt += 1;
				if (rspeed_pos == 1)
					_amt += 1;
			}
			if (friskdance > 1)
				_amt *= 2;
			global.chara_steps += _amt;
			global.chara_steps = clamp(global.chara_steps, 0, 9999);
		}
	}
	else // parado
	{
		image_speed = 0;
		image_index = 0;
		global.chara_runtime = 0;
		afktime += 1;
		moving = 0;
	}
}
else
{
	if (global.chara_cutscene == 0)
	{
		image_speed = 0;
		image_index = 0;
	}
	afktime = 0;
	moving = 0;
}
if (position_meeting(x, y, obj_water_block) == false)
	inwater = false;
else
{
	if (inwater == false)
		audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
	inwater = true;
}


// interagir (blocos, mudar de quarto)
if (global.chara_move == 1 && global.chara_interact == 1)
{
	// blocos
	if (press_enter == 1 && exists(obj_room_transition) == false)
	{
		for (var i = 0; i < 2; i++)
		{
			var _obj = obj_interact_parent;
			if (i == 1)
				_obj = obj_solidinteract_parent;
			lcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x - (sprite_width / 2) - 2), y, _obj, 0, 1);
			rcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x + (sprite_width / 2) + 2), y, _obj, 0, 1);
			ucol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y - (sprite_height / 2) - 2), _obj, 0, 1);
			dcol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y + (sprite_height / 3) + 2), _obj, 0, 1);
			mycol = 0;
			if (global.chara_facing == LEFT	&& lcol > 0)
				mycol = lcol;
			if (global.chara_facing == RIGHT && rcol > 0)
				mycol = rcol;
			if (global.chara_facing == UP && ucol > 0)
				mycol = ucol;
			if (global.chara_facing == DOWN	&& dcol > 0)
				mycol = dcol;
			if (mycol != 0 && mycol.con == 0 )
			{
				chara_change(-1, 0, 0, -1, 0, 0, -1);
				chara_stop();
				mycol.con = 1;
				lastcol = mycol;
				break;
			}
		}
	}
	
	// mudar de quarto
	if (place_meeting(x, y, obj_room_parent) == 1)
	{
		chara_stop();
		chara_change(-1, 0, 0, -1, 0, 0, -1);
		chara_room();
	}
}


// som de passo
chara_stepping();
if (stepplay == 1)
{
	if (global.chara_facing != FALLEN && global.chara_facing != SIT && (floor(image_index) == 1 || floor(image_index) == 3))
	{
		if (stepstage == 1)
		{
			var _snd = snd_step1;
			if (stepsound == 1)
				_snd = snd_step2;
			if (inwater == true)
				_snd = snd_step_water;
			audio_play(_snd, 0, VOLUME_SOUND, stepvolume, , , (1 + (0.05 * (rspeed_pos + 1) * (curspeed == rspeed[rspeed_pos]))));
			stepstage = 0;
		}
	}
	else
	{
		stepsound = 0;
		stepstage = 1;
	}
}













/*
if (position_meeting(x, y, obj_water_block) == 1) // in water
{
	if (inwater == 0)
		audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
	inwater = 1;
}
else
	inwater = 0;

if (global.chara_move == 1) // movement
{
	xmove = 0;
	ymove = 0;
	
	chara_getrun();
	if (global.chara_canrun == 1 && (hold_shift == 1 || global.autorun == 1)) // run
	{
		curspeed = rspeed;
		curimgspeed = rimgspeed;
		if (hold_shift == 1 && global.autorun == 1)
		{
			curspeed = wspeed;
			curimgspeed = wimgspeed;
		}
	}
	else // walk
	{
		curspeed = wspeed;
		curimgspeed = wimgspeed;
	}
		
	if (hold_l == 1) // get xmove and ymove
	{
		xmove = -curspeed;
		
		var _turn = 1;
		if (hold_u == 1 && global.chara_facing == UP) 
			_turn = 0;
		if (hold_d == 1 && global.chara_facing == DOWN) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = LEFT;
	}
	if (hold_r == 1 && hold_l == 0)
	{
		xmove = curspeed;
		
		var _turn = 1;
		if (hold_u == 1 && global.chara_facing == UP) 
			_turn = 0;
		if (hold_d == 1 && global.chara_facing == DOWN) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = RIGHT;	
	}
	if (hold_u == 1)
	{
		ymove = -curspeed;
		
		var _turn = 1;
		if (hold_l == 1 && global.chara_facing == LEFT) 
			_turn = 0;
		if (hold_r == 1 && global.chara_facing == RIGHT) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = UP;
		
		if (friskdance > 0)
		{
			if (hold_d == 1 && hold_l == 0 && hold_r == 0 && place_meeting(x, (y + ymove), obj_solid_parent) > 0)
			{
				friskdance = 2;
				ymove = 0;
				hold_u = 0;
			}
			else if (hold_d == 0) || (hold_l == 1) || (hold_r == 1)
				friskdance = 1;
		}
	}
	else
		friskdance = 1;
	if (hold_d == 1 && hold_u == 0)
	{
		ymove = curspeed;
		
		var _turn = 1;
		if (hold_l == 1 && global.chara_facing == LEFT) 
			_turn = 0;
		if (hold_r == 1 && global.chara_facing == RIGHT) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = DOWN;
	}
		
	if ((hold_u == 1 || hold_d == 1) && ymove == 0) // extra facing
	{
		global.chara_facing = LEFT;
		if (hold_l == 0 && hold_r == 1)
			global.chara_facing = RIGHT;
	}
	if ((hold_l == 1 || hold_r == 1) && xmove == 0)
	{
		global.chara_facing = UP;
		if (hold_u == 0 && hold_d == 1)
			global.chara_facing = DOWN;
	}
	
	if (place_meeting(x + xmove, y, obj_solid_stairs_lu) == 1 && hold_l == 1) // stairs
	{
		xmove = -curspeed
		ymove = -curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_lu) == 1 && hold_d == 1 && hold_l == 0)
	{
		xmove = curspeed
		ymove = curspeed
	}
	
	if (place_meeting(x + xmove, y, obj_solid_stairs_ru) == 1 && hold_r == 1)
	{
		xmove = curspeed
		ymove = -curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_ru) == 1 && hold_d == 1 && hold_r == 0)
	{
		xmove = -curspeed
		ymove = curspeed
	}
	
	if (place_meeting(x + xmove, y, obj_solid_stairs_ld) == 1 && hold_l == 1)
	{
		xmove = -curspeed
		ymove = curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_ld) == 1 && hold_u == 1 && hold_l == 0)
	{
		xmove = curspeed
		ymove = -curspeed
	}
	
	if (place_meeting(x + xmove, y, obj_solid_stairs_rd) == 1 && hold_r == 1 && hold_l == 0)
	{
		xmove = curspeed
		ymove = curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_rd) == 1 && hold_u == 1 && hold_l == 0 && hold_r == 0)
	{
		xmove = -curspeed
		ymove = -curspeed
	}
		
	if (place_meeting((x + xmove), y, obj_solid_parent) > 0) || (place_meeting((x + xmove), y, obj_solidinteract_parent) > 0) // horizontal
	{
		colcheck = 0;
		if (xmove < 0) 
		{
            var i = xmove;
            while (i <= 0) 
			{
                if (place_meeting((x + i), y, obj_solid_parent) == 0 && place_meeting((x + i), y, obj_solidinteract_parent) == 0)
				{
                    xmove = i;
                    colcheck = 1;
					break;
                }
                else 
				{
                    i += 1;
                    continue
                }
            }
        }
		if (xmove > 0) 
		{
            var i = xmove;
            while (i >= 0) 
			{
                if (place_meeting((x + i), y, obj_solid_parent) == 0 && place_meeting((x + i), y, obj_solidinteract_parent) == 0) 
				{
                    xmove = i;
					colcheck = 1;
                    break;
                }
                else 
				{
                    i -= 1;
                    continue;
                }
            }
        }
		if (colcheck == 0)
			xmove = 0;
	}
	if (place_meeting(x, (y + ymove), obj_solid_parent) > 0) || (place_meeting(x, (y + ymove), obj_solidinteract_parent) > 0) // vertical
	{
		colcheck = 0;
		if (ymove <= 0) 
		{
            var i = ymove;
            while (i <= 0) 
			{
                if (place_meeting(x, (y + i), obj_solid_parent) == 0 && place_meeting(x, (y + i), obj_solidinteract_parent) == 0) 
				{
                    ymove = i;
                    colcheck = 1;
					break;
                }
                else 
				{
                    i += 1;
                    continue
                }
            }
        }
		if (ymove >= 0) 
		{
            var i = ymove;
            while (i >= 0) 
			{
                if (place_meeting(x, (y + i), obj_solid_parent) == 0 && place_meeting(x, (y + i), obj_solidinteract_parent) == 0) 
				{
                    ymove = i;
					colcheck = 1;
                    break;
                }
                else 
				{
                    i -= 1;
                    continue;
                }
            }
        }
		if (colcheck == 0)
			ymove = 0;
	}
	
	x += xmove;
	y += ymove;
	
	if (xmove != 0) || (ymove != 0) // moving animation
	{
		depth = -bbox_bottom;
		image_speed = curimgspeed;
		if (moving == 0)
			image_index = 1;
		moving = 1;
		moved = 1;
		afktime = 0;
		isafk = 0;
	}
	else // idle animation and afk timer
	{
		chara_stop();
		if (press_l == 0 && press_r == 0 && press_u == 0 && press_d == 0)
			afktime += 1;
	}
	
	if (moving == 1 && obj_overworld_controller.encounter == 1) // encounter
	{
		var _amt = 1;
		if (hold_shift == 1)
			_amt *= 2;
		if (friskdance == 2)
			_amt *= 2;
		global.chara_encounter += _amt;
	}
}
else if (global.chara_cutscene == 0)
{
	chara_stop();
	afktime = 0;
	isafk = 0;
}

if (global.chara_interact == 1) // room warp
{
	if (place_meeting(x, y, obj_room_parent) == 1)
	{
		global.chara_interact = 0;
		global.chara_move = 0;
		chara_getroom();
		chara_stop();
	}
}

if (global.chara_move == 1 && global.chara_interact == 1) // block interaction
{
	for (var i = 0; i < 3; i++)
	{
		// collision
		
		var _obj = obj_interact_parent;
		if (i == 1)
			_obj = obj_solidinteract_parent;
		if (i == 2)
			_obj = obj_solidinteract_parent;
		lcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x - (sprite_width / 2) - 2), y, _obj, 0, 1);
		rcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x + (sprite_width / 2) + 2), y, _obj, 0, 1);
		ucol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y - (sprite_height / 2) - 2), _obj, 0, 1);
		dcol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y + (sprite_height / 3) + 2), _obj, 0, 1);
		
		// get interacted block
		mycol = 0;
		if (global.chara_facing == LEFT	&& lcol > 0)
			mycol = lcol;
		if (global.chara_facing == RIGHT && rcol > 0)
			mycol = rcol;
		if (global.chara_facing == UP && ucol > 0)
			mycol = ucol;
		if (global.chara_facing == DOWN	&& dcol > 0)
			mycol = dcol;
		
		// set result
		if (press_enter == 1 && mycol != 0 && mycol.myinteract == 0)
		{
			mycol.myinteract = 1;
			chara_stop();
			global.chara_move = 0;
		}
	}	
}

if (global.flag[2] == 1 && exists(obj_sidechara) == 0) // create MEE6
{
	if (exists(obj_room_transition) == 0) || (exists(obj_room_transition) && obj_room_transition.setchara == 1)
	{
		sidechara_start();
		side_create(x, y, "m6");
	}
}

if (chara_getsteps() == 1 && global.chara_facing != -1) // step sounds
{
	if (floor(image_index) == 1) || (floor(image_index) == 3)
	{
		if (playstep == 1)
		{
			mystep = !mystep;
			mysound = snd_step1;
			if (mystep == 1)
				mysound = snd_step2;
			if (inwater == 1)
				mysound = snd_step_water;
			if (mysound != -1)
				audio_play(mysound, 0, VOLUME_SOUND);
			playstep = 0;
		}
	}
	else
		playstep = 1;
}

event_user(0); // set sprite
*/

















/*
// movement, collision and animation
if (global.chara_move == 1)
{
	// reset movement
	xmove = 0;
	ymove = 0;
	
	// run
	chara_getrun();
	if (global.chara_canrun == 1 && (press_run == 1 || global.autorun == 1)) || (global.inchase == 1)
	{
		curspeed = rspeed;
		curimgspeed = rimgspeed;
		if (press_run == 1 && global.autorun == 1)
		{
			curspeed = wspeed;
			curimgspeed = wimgspeed;
		}
	}
	else
	{
		curspeed = wspeed;
		curimgspeed = wimgspeed;
	}
	
	// movement
	if (press_l == 1)
	{
		xmove = -curspeed;
		
		var _turn = 1;
		if (press_u == 1 && global.chara_facing == UP) 
			_turn = 0;
		if (press_d == 1 && global.chara_facing == DOWN) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = LEFT;
	}
	if (press_r == 1 && press_l == 0)
	{
		xmove = curspeed;
		
		var _turn = 1;
		if (press_u == 1 && global.chara_facing == UP) 
			_turn = 0;
		if (press_d == 1 && global.chara_facing == DOWN) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = RIGHT;	
	}
	if (press_u == 1)
	{
		ymove = -curspeed;
		
		var _turn = 1;
		if (press_l == 1 && global.chara_facing == LEFT) 
			_turn = 0;
		if (press_r == 1 && global.chara_facing == RIGHT) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = UP;	
			
		if (friskdance == 1 && press_l == 0 && press_r == 0 && place_meeting(x, (y + ymove), obj_solid_parent) > 0)
		{
			ymove = 0;
			press_u = 0;
		}
	}
	if (press_d == 1 && press_u == 0)
	{
		ymove = curspeed;
		
		var _turn = 1;
		if (press_l == 1 && global.chara_facing == LEFT) 
			_turn = 0;
		if (press_r == 1 && global.chara_facing == RIGHT) 
			_turn = 0;
		if (_turn == 1)
			global.chara_facing = DOWN;
	}
		
	// stairs collision
	if (place_meeting(x + xmove, y, obj_solid_stairs_lu) == 1 && press_l == 1)
	{
		xmove = -curspeed
		ymove = -curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_lu) == 1 && press_d == 1 && press_l == 0)
	{
		xmove = curspeed
		ymove = curspeed
	}
	
	if (place_meeting(x + xmove, y, obj_solid_stairs_ru) == 1 && press_r == 1)
	{
		xmove = curspeed
		ymove = -curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_ru) == 1 && press_d == 1 && press_r == 0)
	{
		xmove = -curspeed
		ymove = curspeed
	}
	
	if (place_meeting(x + xmove, y, obj_solid_stairs_ld) == 1 && press_l == 1)
	{
		xmove = -curspeed
		ymove = curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_ld) == 1 && press_u == 1 && press_l == 0)
	{
		xmove = curspeed
		ymove = -curspeed
	}
	
	if (place_meeting(x + xmove, y, obj_solid_stairs_rd) == 1 && press_r == 1 && press_l == 0)
	{
		xmove = curspeed
		ymove = curspeed
	}
	if (place_meeting(x, y + ymove, obj_solid_stairs_rd) == 1 && press_u == 1 && press_l == 0 && press_r == 0)
	{
		xmove = -curspeed
		ymove = -curspeed
	}
		
	// normal collision
	if (place_meeting((x + xmove), y, obj_solid_parent) > 0) || (place_meeting((x + xmove), y, obj_solidinteract_parent) > 0) // horizontal
	{
		colcheck = 0;
		if (xmove < 0) 
		{
            var i = xmove;
            while (i <= 0) 
			{
                if (place_meeting((x + i), y, obj_solid_parent) == 0 && place_meeting((x + i), y, obj_solidinteract_parent) == 0)
				{
                    xmove = i;
                    colcheck = 1;
					break;
                }
                else 
				{
                    i += 1;
                    continue
                }
            }
        }
		if (xmove > 0) 
		{
            var i = xmove;
            while (i >= 0) 
			{
                if (place_meeting((x + i), y, obj_solid_parent) == 0 && place_meeting((x + i), y, obj_solidinteract_parent) == 0) 
				{
                    xmove = i;
					colcheck = 1;
                    break;
                }
                else 
				{
                    i -= 1;
                    continue;
                }
            }
        }
		if (colcheck == 0)
			xmove = 0;
	}
	if (place_meeting(x, (y + ymove), obj_solid_parent) > 0) || (place_meeting(x, (y + ymove), obj_solidinteract_parent) > 0) // vertical
	{
		colcheck = 0;
		if (ymove <= 0) 
		{
            var i = ymove;
            while (i <= 0) 
			{
                if (place_meeting(x, (y + i), obj_solid_parent) == 0 && place_meeting(x, (y + i), obj_solidinteract_parent) == 0) 
				{
                    ymove = i;
                    colcheck = 1;
					break;
                }
                else 
				{
                    i += 1;
                    continue
                }
            }
        }
		if (ymove >= 0) 
		{
            var i = ymove;
            while (i >= 0) 
			{
                if (place_meeting(x, (y + i), obj_solid_parent) == 0 && place_meeting(x, (y + i), obj_solidinteract_parent) == 0) 
				{
                    ymove = i;
					colcheck = 1;
                    break;
                }
                else 
				{
                    i -= 1;
                    continue;
                }
            }
        }
		if (colcheck == 0)
			ymove = 0;
	}
	
	// movement
	x += xmove;
	y += ymove;
	
	// animation
	if (xmove != 0) || (ymove != 0)
	{
		depth = -bbox_bottom;
		image_speed = curimgspeed;
		if (moving == 0)
			image_index = 1;
		moving = 1;
		moved = 1;
		
		if ((press_u == 1 || press_d == 1) && ymove == 0)
		{
			global.chara_facing = LEFT;
			if (press_l == 0 && press_r == 1)
				global.chara_facing = RIGHT;
		}
		if ((press_l == 1 || press_r == 1) && xmove == 0)
		{
			global.chara_facing = UP;
			if (press_u == 0 && press_d == 1)
				global.chara_facing = DOWN;
		}
	}
	else if (xmove == 0 && ymove == 0)
	{
		image_speed = 0;
		image_index = 0;
		moving = 0;
	}
	
	// afk check
	if (press_l == 0 && press_r == 0 && press_u == 0 && press_d == 0)
		afktime += 1;
	else
		afktime = 0;
		
	// encounter
	if (moving == 1 && instance_exists(obj_overworld_controller) == 1 && obj_overworld_controller.encounter == 1)
	{
		var _amt = 1;
		if (press_run == 1)
			_amt *= 2;
		if (friskdance == 1 && press_u == 1 && press_d == 1 && press_l == 0 && press_r == 0)
			_amt *= 2;
		global.chara_encounter += _amt;
	}
}

// room warp
if (global.chara_move == 1)
{
	if (place_meeting(x, y, obj_room_parent) == 1)
	{
		global.chara_move = 0;
		chara_getroom();
		chara_stop();
	}
}

// block interact
if (global.chara_move == 1)
{
	for (var i = 0; i < 2; i++)
	{
		// collision
		if (i == 0)
		{
			lcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x - (sprite_width / 2) - 2), y, obj_interact_parent, 0, 1);
			rcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x + (sprite_width / 2) + 2), y, obj_interact_parent, 0, 1);
			ucol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y - (sprite_height / 2) - 2), obj_interact_parent, 0, 1);
			dcol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y + (sprite_height / 3) + 2), obj_interact_parent, 0, 1);	
		}
		else
		{
			lcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x - (sprite_width / 2) - 2), y, obj_solidinteract_parent, 0, 1);
			rcol = collision_rectangle(x, (y - (sprite_height / 2) - 2), (x + (sprite_width / 2) + 2), y, obj_solidinteract_parent, 0, 1);
			ucol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y - (sprite_height / 2) - 2), obj_solidinteract_parent, 0, 1);
			dcol = collision_rectangle((x - (sprite_width / 3) - 2), y, (x + (sprite_width / 3) + 2), (y + (sprite_height / 3) + 2), obj_solidinteract_parent, 0, 1);		
		}
		
		// get interacted block
		mycol = 0;
		if (global.chara_facing == LEFT	&& lcol > 0)
			mycol = lcol;
		if (global.chara_facing == RIGHT && rcol > 0)
			mycol = rcol;
		if (global.chara_facing == UP && ucol > 0)
			mycol = ucol;
		if (global.chara_facing == DOWN	&& dcol > 0)
			mycol = dcol;
		
		// set result
		if (press_enter == 1 && mycol != 0 && mycol.myinteract == 0)
		{
			mycol.myinteract = 1;
			chara_stop();
			global.chara_move = 0;
		}
	}	
}

// set sprite
event_user(0);

// step sounds
if (chara_gettense() == 1 && global.chara_facing != -1)
{
	if (floor(image_index) == 1) || (floor(image_index) == 3)
	{
		if (playstep == 1)
		{
			mystep = !mystep;
			if (mystep == 0)
				var _sound = snd_step1;
			else
				var _sound = snd_step2;
			if (audio_is_playing(_sound) == 1)
				audio_stop_sound(_sound);
			audio_play(_sound, 0, 0);
			playstep = 0;
		}
	}
	else
		playstep = 1;
}

// create MEE6
if (global.flag[2] == 1 && instance_exists(obj_sidechara) == 0)
{
	if (instance_exists(obj_room_transition) == 0) || (instance_exists(obj_room_transition) && obj_room_transition.setchara == 1)
	{
		sidechara_start();
		side_create(x, y, "m6");
	}
}
*/