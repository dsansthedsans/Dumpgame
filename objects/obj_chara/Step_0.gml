
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
pausechange = false;
if (global.chara_cutscene == 0 && global.chara_pause_game == 1 && exists(obj_room_transition) == false)
{
	pauseobj = obj_chara_pause;
	if (exists(pauseobj) == 0 && press_esc == 1)
	{
		pausechange = true;
		audio_play(snd_option_move, 0, VOLUME_SOUND);
		chara_change(-1, 0, 0, -1, 0, 1, -1);
		create(0, 0, pauseobj);
	}
	else if (exists(pauseobj) == 1 && ((press_esc == 1) || (press_shift == 1) || (pauseobj.press_enter == 1 && pauseobj.option_pos == 0)))
	{
		pausechange = true;
		audio_play(snd_option_return, 0, VOLUME_SOUND);
		chara_change(-1, 1, 1, -1, 1, 1, -1);
		destroy(pauseobj);
	}
}


// movimento, colisão, animação e geração de passos
if (position_meeting(x, y, obj_water_block) == false)
	inwater = false;
else
{
	if (inwater == false)
		audio_play(snd_impactPulse1, , VOLUME_SOUND, 0.5);
	inwater = true;
}
if (global.chara_move == 1)
{
	// correr
	running = 0;
	curspeed = wspeed;
	curimgspeed = wimgspeed;
	if (global.chara_run == 1 && ((hold_shift == 1 && global.autorun == 0) || (global.autorun == 1 && hold_shift == 0)) && place_meeting(x, y, obj_walk_block) == 0 && inwater == false)
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
		if (global.CHARAFRISK_ENABLED == false) || (string_upper(global.chara_name) != "FRISK")
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


// interagir (blocos, mudar de quarto)
if (global.chara_move == 1 && global.chara_interact == 1)
{
	// blocos
	if (press_enter == 1 && exists(obj_room_transition) == false && pausechange == false)
	{
		var _interacted = false;
		for (var o = 0; o < 2; o++)
		{
			var _obj = obj_interact_parent;
			if (o == 1)
				_obj = obj_solidinteract_parent;
			intlist[0] = ds_list_create();
			intcol[0] = collision_rectangle_list(x, (y - (sprite_height / 2) - 0), (x - (sprite_width / 2) - 8), y - 2, _obj, 0, 1, intlist[0], true);
			intlist[1] = ds_list_create();
			intcol[1] = collision_rectangle_list(x, (y - (sprite_height / 2) - 0), (x + (sprite_width / 2) + 8), y - 2, _obj, 0, 1, intlist[1], true);
			intlist[2] = ds_list_create();
			intcol[2] = collision_rectangle_list((x - (sprite_width / 3) - 0), y, (x + (sprite_width / 3) + 0), (y - (sprite_height / 2) - 4), _obj, 0, 1, intlist[2], true);
			intlist[3] = ds_list_create();
			intcol[3] = collision_rectangle_list((x - (sprite_width / 3) - 0), y, (x + (sprite_width / 3) + 0), (y + (sprite_height / 3) + 4), _obj, 0, 1, intlist[3], true);
			var f = global.chara_facing;
			if (intcol[f] > 0)
			{
				var _intpos = 0;
				for (var l = 0; l < intcol[f]; l++)
				{
					if (intlist[f][| l].text == "itemDropped_pickup") || (intlist[f][| l].text == "itemDropped_cantpickup")
						_intpos = l;
				}
				if (intlist[f][| _intpos].con == 0)
				{
					chara_change(-1, 0, 0, -1, 0, 0, -1);
					chara_stop();
					mycol = intlist[f][| _intpos].id;
					mycol.con = 1;
					lastcol = mycol;
					_interacted = true;
					break;
				}
			}
			if (_interacted == true)
				break;
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
			var _snd = snd_step_0;
			if (stepsound == 1)
				_snd = snd_step_1;
			stepsound = !stepsound;
			if (inwater == true)
				_snd = snd_stepWater;
			audio_play(_snd, false, VOLUME_SOUND,,,, (1 + (0.05 * (rspeed_pos + 1) * (curspeed == rspeed[rspeed_pos]))));
			stepstage = 0;
		}
	}
	else
		stepstage = 1;
}