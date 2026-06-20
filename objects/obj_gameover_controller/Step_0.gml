
press_l = key("left_press");
press_r = key("right_press");
press_enter = key("enter_press");

if (con == 1)
{
	var _amt = 0.1;
	heart_x = lerp(heart_x, heart_targetx, _amt);
	heart_y = lerp(heart_y, heart_targety, _amt);
	
	var _dist = point_distance(heart_x, heart_y, heart_targetx, heart_targety);
	if (_dist <= 1)
	{
		heart_x = heart_targetx;
		heart_y = heart_targety;
		alarm[2] = 80;
		con = 2;
	}
}
if (con == 3)
{
	heart_spr = spr_battle_heart_break;
	audio_play(snd_heartbreak1, 0, 0);
	event_user(0);
	
	alarm[2] = 100;
	con = 4;
}
if (con == 5)
{
	heart_alpha = 0;
	audio_play(snd_heartbreak2, 0, 0);
	event_user(0);
	
	for (var i = 0; i < shard_amt; i++)
	{
		shard[i] = instance_create_layer(heart_x, heart_y, "Instances", obj_marker);
		with (shard[i]) 
		{
			controller = obj_gameover_controller;
			sprite_index = spr_battle_heart_break;
			image_speed = 0;
			image_index = irandom_range(1, 4);
			image_blend = controller.heart_color;
			direction = irandom_range(0, 360);
			gravity = 0.1;
			depth = -1500;
			speed = 3;
		}
	}
	altcon = 1;
	
	alarm[2] = 60;
	con = 6;
}
if (con == 7)
{
	audio_play(snd_gameover, 0, 0);
	alarm[2] = 120;
	con = 8;
}
if (con == 9) // options
{	
	// movement
	var _oldpos = mainopt_pos;
	if (mainopt_leftmiddle == 1)
	{
		press_l *= 2;
		press_r *= 2;
	}
	mainopt_pos += (press_r - press_l);
	if (mainopt_pos < 0)
		mainopt_pos = 2;
	if (mainopt_pos > 2)
		mainopt_pos = 0;
	if (mainopt_pos != _oldpos)
	{
		audio_play(snd_option_move, 0, 0);
		if (_oldpos == 1)
			mainopt_leftmiddle = 1;
	}
	
	// selection
	if (press_enter == 1 && mainopt_pos != 1)
	{
		TEMPFILE_RESET();
		TEMPFILE_LOAD();
		global.chara_curhp = global.chara_maxhp;
		global.chara_deaths += 1;
		TEMPFILE_SAVE();
		
		var _rm = global.chara_saveroom;
		if (global.chara_saveroom == 0)
			_rm = room_corridors_1;
		if (mainopt_pos == 2)
		{
			_rm = room_menu;
			if (global.fastmenu == 0)
				global.fastmenu = 0.5;
		}
		
		room_go(_rm, -1, -1);
		con = 10;
	}
}
else if (con < 9 && press_enter == 1) // skip
{	
	// destroy shards
	if (con >= 5)
	{
		for (var i = 0; i < shard_amt; i++)
		{
			if (exists(shard[i]) == 1)
				destroy(shard[i]);
		}
	}

	audio_play(snd_gameover, 0, 0);
	title_length = 2;
	heart_alpha = 0;
	bg_alpha = 0;
	con = 9;
}

// change shard angle
if (altcon == 1)
{
	for (var i = 0; i < 6; i++)
	{
		with (shard[i])
		{
			if (x < (room_width / 2))
				image_angle -= controller.shard_amt;
			else
				image_angle += controller.shard_amt;
		}
	}
}

// manage particles
dumpparticle_manage();