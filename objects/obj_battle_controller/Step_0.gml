
press_l = key("left_press");
press_r = key("right_press");
press_u = key("up_press");
press_d = key("down_press");
press_shift = key("shift_press");
press_enter = key("enter_press");

// win
if (enemy_type[0] == 0 && enemy_type[1] == 0 && enemy_type[2] == 0)
{
	if (battle_lvl >= 0)
		battle_lvl = -1;
	startattack = 0;
	createbubble = 0;
	button_select = 0;
	box_nextx = box_defaultx;
	box_nexty = box_defaulty;
	box_nextw = box_defaultw;
	box_nexth = box_defaulth;
	if (box_x == box_defaultx && box_y == box_defaulty && box_w == box_defaultw && box_h == box_defaulth)
	{
		if (battle_won == 0)
		{
			heart.x = -20;
			heart.y = -20;
			battle_won = 1;
			writer("battle_won", -1, -1);
			if (exists(global.writer_old) == 1)
				destroy(global.writer_old);
		}
		else if (exists(global.writer) == 0)
			alarm[0] = 1;
	}
}

// normal
if (battle_lvl >= 1.0 && battle_lvl <= 4.0 && battle_lvl != 1.5 && battle_lvl != 3.1) // fight, act, item and mercy (movement, return, writer setup)
{
	if (exists(global.writer_old) == 1)
		destroy(global.writer_old);
	
	// movement
	if (battle_lvl == 1.0) || (battle_lvl == 2.0)
	{
		level_length = (enemy_length - 1);
		
		var _dir = (press_d - press_u);
		var _oldpos = level_pos;
		level_pos += _dir;
		if (level_pos < 0)
			level_pos = level_length;
		if (level_pos > level_length)
			level_pos = 0;	
		while (enemy_type[level_pos] == 0)
		{
			level_pos += _dir;
			if (level_pos < 0)
				level_pos = level_length;
			if (level_pos > level_length)
				level_pos = 0;
		}
		heart.x = round(box_x - (box_w / 2) + 35);
		heart.y = round(box_y - (box_h / 2) + 30 + (32 * level_pos));
		if (_oldpos != level_pos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);
	}
	if (battle_lvl == 2.1) || (battle_lvl == 3.0)
	{
		heart.x = round(box_x - (box_w / 2) + 35);
		heart.y = round(box_y - (box_h / 2) + 30);
		var _origpos = level_pos;
		for (var i = 0; i < 6; i++)
		{
			if (battle_lvl == 2.1)
				thisopt[i] = enemy_act[enemy_target, i];
			else
				thisopt[i] = global.inventory_slot[i];
		}
		
		if (press_l == 1)
		{
			level_pos -= 1;
			level_pos_xfactor = 258;
			
			var _oldpos = level_pos;
			if (level_pos == -1)
				level_pos = 1;
			else if (level_pos == 1)
				level_pos = 3;
			else if (level_pos == 3)
				level_pos = 5;
			else
				level_pos_xfactor = 0;
		
			if (thisopt[level_pos] == "") || (thisopt[level_pos] == 0)
			{
				level_pos -= 1;
				level_pos_xfactor = 0;
			}
		}
		
		if (press_r == 1)
		{
			level_pos += 1;
			level_pos_xfactor = 0;
			
			if (level_pos == 2)
				level_pos = 0;
			else if (level_pos == 4)
				level_pos = 2;
			else if (level_pos == 6)
				level_pos = 4;
			else
				level_pos_xfactor = 258;
				
			if (thisopt[level_pos] == "") || (thisopt[level_pos] == 0)
			{
				level_pos -= 1;
				level_pos_xfactor = 0;
			}
		}
		
		if (press_u == 1)
		{
			level_pos -= 2;
			level_pos_yfactor = 0;
			
			if (level_pos == -2) || (level_pos == -1)
			{
				level_pos = (6 + level_pos);
				level_pos_yfactor = 64;
				
				while (thisopt[level_pos] == "") || (thisopt[level_pos] == 0)
				{
					level_pos -= 2;
					level_pos_yfactor -= 32;
				}
			}
			if (level_pos == 2) || (level_pos == 3)
				level_pos_yfactor = 32;
		}
		
		if (press_d == 1)
		{
			level_pos += 2;
			level_pos_yfactor = 0;
			
			if (level_pos == 2) || (level_pos == 3)
				level_pos_yfactor = 32;
			if (level_pos == 4) || (level_pos == 5)
				level_pos_yfactor = 64;
			if (level_pos == 6) || (level_pos == 7)
				level_pos = (level_pos - 6);
								
			if (thisopt[level_pos] == "") || (thisopt[level_pos] == 0)
			{
				var _oldpos = level_pos;
				level_pos = 0;
				if (_oldpos == 3) || (_oldpos == 5)
					level_pos = 1;
			
				level_pos_yfactor = 0;
			}
		}
		
		heart.x += level_pos_xfactor;
		heart.y += level_pos_yfactor;
		if (_origpos != level_pos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);
	}
	if (battle_lvl == 4.0)
	{
		var _oldpos = level_pos;
		if (press_u == 1) || (press_d == 1)
			level_pos = !level_pos;		
		heart.x = round(box_x - (box_w / 2) + 35);
		heart.y = round(box_y - (box_h / 2) + 30 + (32 * level_pos));
		if (_oldpos != level_pos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);
	}
	
	// return
	if (press_shift == 1)
	{	
		audio_play(snd_option_return, 0, VOLUME_SOUND);
		
		if (battle_lvl == 2.1)
		{
			writer("battle_enemylist", -1, -1);
			level_pos = enemy_target;
			enemy_target = -1;
			battle_lvl = 2;
		}
		else
		{
			writer("battle_main", -1, -1);
			battle_lvl = 0;
		}
		
		press_shift = 0;
		press_enter = 0;
	}
}

if (battle_lvl == 4.0 && press_enter == 1) // mercy (select)
{
	if (level_pos == 0)
	{
		for (var i = 0; i < enemy_length; i++)
		{
			if (enemy_type[i] != 0 && enemy_spare[i] >= 100)
				enemy_obj[i].spared = 1;
		}
		
		destroy(global.writer);
		audio_play(snd_option_select, 0, VOLUME_SOUND);
		button_select = 0;
		heart.x = -20;
		heart.y = -20;
		battle_lvl = 10;
	}
	else
	{
		if (battle_flee == 1)
		{
			writer("battle_fleeing", -1, -1);
			audio_play(snd_battle_fleeing, 0, VOLUME_SOUND);
			fleeing = 1;
			button_select = 0;
			battle_lvl = 4.1;
			alarm[0] = 60;
		}
		else
			audio_play(snd_option_cantselect, 0, VOLUME_SOUND);
	}
	
	press_enter = 0;
}
else if (battle_lvl == 4.1)
	destroy(global.writer_old);

if (battle_lvl == 3.1) // used item
{
	if (exists(global.writer_old) == 1)
		destroy(global.writer_old);
	if (exists(global.writer) == 0)
	{
		battle_useditem = 1;
		battle_lvl = 10;
	}
}
if (battle_lvl == 3.0 && press_enter == 1) // item (select)
{
	writer("battle_useitem", -1, -1);
	button_select = 0;
	heart.x = -20;
	heart.y = -20;
	battle_lvl = 3.1;
	press_enter = 0;
}

if (battle_lvl == 2.1 && press_enter == 1) // act 2 (select)
{
	destroy(global.writer);
	audio_play(snd_option_select, 0, VOLUME_SOUND);
	level_heard = level_pos;
	button_select = 0;
	heart.x = -20;
	heart.y = -20;
	battle_lvl = 10;
	battle_usedact = 1;
	press_enter = 0;
}
if (battle_lvl == 2.0 && press_enter == 1) // act 1 (select)
{
	enemy_target = level_pos;
	writer("battle_actlist", -1, -1);
	audio_play(snd_option_select, 0, VOLUME_SOUND);
	level_pos_xfactor = 0;
	level_pos_yfactor = 0;
	level_pos = 0;
	battle_lvl = 2.1;
	press_enter = 0;
}

if (battle_lvl == 1.0 && press_enter == 1) // fight (select)
{
	destroy(global.writer);
	enemy_target = level_pos;
	create(-20, -20, obj_battle_fighttarget);
	create(box_x, box_y, obj_battle_fightbar);
	audio_play(snd_option_select, 0, VOLUME_SOUND);
	button_select = 0;
	heart.x = -20;
	heart.y = -20;
	battle_lvl = 10;
	press_enter = 0;
}

if (battle_lvl == 0) // main
{
	if (exists(global.writer_old) == 1 && global.writer_old != -1)
		destroy(global.writer_old);
	
	if (global.writer.msg_next[global.writer.page] == 0)
	{
		button_select = 1;
		
		// movement
		var _oldpos = button_pos;
		button_pos += (press_r - press_l);
		if (button_pos <= -1)
			button_pos = (button_length - 1);
		if (button_pos >= button_length)
			button_pos = 0;
		heart.x = (button_x[button_pos] + 20);
		heart.y = (button_y[button_pos] + 25);
		if (_oldpos != button_pos)
			audio_play(snd_option_move, 0, VOLUME_SOUND);
	
		// select
		if (press_enter == 1)
		{
			if !(button_pos == 2 && global.inventory_slot[0] == 0)
			{
				audio_play(snd_option_select, 0, VOLUME_SOUND);
				battle_lvl = (button_pos + 1);
				level_pos_xfactor = 0;
				level_pos_yfactor = 0;
				level_pos = 0;
			
				var _text = "";
				if (battle_lvl == 1.0) || (battle_lvl == 2.0)
				{
					_text = "battle_enemylist";
					for (var i = 0; i < enemy_length; i++)
					{
						if (enemy_type[i] == 0)
							level_pos += 1;
						else
							break;
					}	
				}
				if (battle_lvl == 3.0)
					_text = "battle_itemlist";
				if (battle_lvl == 4.0)
					_text = "battle_mercy";
				writer(_text, -1, -1);
			}
			else
			{
				audio_play(snd_option_cantselect, 0, VOLUME_SOUND);
				shakescreen(2, 2);
			}
			
			press_enter = 0;
		}
	}
	else
	{
		button_select = 0;
		heart.x = -20;
		heart.y = -20;
	}
}

// attack
if (battle_lvl == 10)
{
	var _amount = 0;
	var _bubble = 0;
	for (var i = 0; i < enemy_length; i++)
	{
		if (enemy_type[i] != 0)
		{
			_amount += 1;
			if (enemy_obj[i].createbubble == 1)
				_bubble += 1;
		}
	}
	
	if (_bubble == _amount)
	{
		battle_getattack();
		heart.x = heart_nextx;
		heart.y = heart_nexty;
		createbubble = 1;
		battle_lvl = 11;
	}
}
else if (battle_lvl == 11)
{
	var _amount = 0;
	var _attack = 0;
	for (var i = 0; i < enemy_length; i++)
	{
		if (enemy_type[i] != 0)
		{
			_amount += 1;
			if (enemy_obj[i].startattack == 1)
				_attack += 1;
		}
	}
	
	if (_attack == _amount && box_x == box_nextx && box_y == box_nexty && box_w == box_nextw && box_h == box_nexth)
	{
		for (var i = 0; i < enemy_length; i++)
		{
			if (enemy_type[i] != 0)
			{
				attackobj[i] = instance_create_layer(-20, -20, "Instances", obj_battle_attack);
				attackobj[i].myself = i;
				attackobj[i].attack = enemy_attack[i];
				attackobj[i].enemy = enemy_type[i];
			}
		}
		
		createbubble = 0;
		startattack = 1;
		heart_move = 1;
		battle_lvl = 12;
	}
}
else if (battle_lvl == 12)
{
	battle_turntime -= 1;
	if (battle_turntime <= 0 && battle_turntime > -10)
	{
		destroy(obj_battle_danger);
		destroy(obj_battle_attack);
		destroy(obj_battle_blt);
		box_nextx = box_defaultx;
		box_nexty = box_defaulty;
		box_nextw = box_defaultw;
		box_nexth = box_defaulth;
		battle_oldmainmsg = "%%%";
		battle_turntime = 0;
		battle_usedact = 0;
		battle_round += 1;
		enemy_target = -1;
		level_heard = -1;
		startattack = 0;
		battle_lvl = 13;
		heart_move = 0;
		heart.x = -20;
		heart.y = -20;
	}
}
else if (battle_lvl == 13 && box_x == box_defaultx && box_y == box_defaulty && box_w == box_defaultw && box_h == box_defaulth)
{
	var _amount = 0;
	var _return = 0;
	for (var i = 0; i < enemy_length; i++)
	{
		if (enemy_type[i] != 0)
		{
			_amount += 1;
			if (enemy_obj[i].returnmain == 1)
				_return += 1;
		}
	}
	
	if (_return == _amount)
	{
		writer("battle_main", -1, -1);
		battle_lvl = 0;		
	}
}

// box movement
var _dist = 4;
var _speed = 0.2;

box_x = lerp(box_x, box_nextx, _speed);
if (abs(box_x - box_nextx) <= _dist)
	box_x = box_nextx;

box_y = lerp(box_y, box_nexty, _speed);
if (abs(box_y - box_nexty) <= _dist)
	box_y = box_nexty;
	
box_w = lerp(box_w, box_nextw, _speed);
if (abs(box_w - box_nextw) <= _dist)
	box_w = box_nextw;
	
box_h = lerp(box_h, box_nexth, _speed);
if (abs(box_h - box_nexth) <= _dist)
	box_h = box_nexth;

if (global.indebug == 1 && battle_won == 0)
{	
	debug("battle_lvl: " + string(battle_lvl) + " | button_pos: " + string(button_pos) + " | level_pos: " + /*string(level_pos) + " | usedFIGHT: " + string(battle_usedfight) +*/ " | usedACT: " + string(battle_usedact)/* + " | usedITEM: " + string(battle_useditem) + " | usedMERCY: " + string(battle_usedmercy)*/);
}