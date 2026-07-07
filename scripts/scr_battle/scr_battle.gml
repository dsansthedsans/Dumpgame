
function battle()
{
	global.chara_move = 0;
	global.chara_interact = 0;
	global.chara_lastx = obj_chara.x;
	global.chara_lasty = obj_chara.y;
	global.chara_lastroom = room;
	chara_stop();
	create(0, 0, obj_battle_quicker);
	if (room == room_corridors_9 && audio_playing(snd_option_movehold) == 1)
		audio_stop(snd_option_movehold);
}
function battle_getgroup()
{	
	if (global.chara_world == WORLD_CORRIDORS) // corridors
	{
		battle_group = irandom_range(2, 5);
		if (global.world_curpopulation[global.chara_world] > 1)
		{
			battle_group = choose(irandom_range(2, 5), irandom_range(7, 11));
			if (global.flag[37] == 1 && global.flag[39] == 1)
				battle_group = irandom_range(7, 11);
		}
		if (global.battle_nextgroup == 0)
			global.flag[18] = 1;
	}
	else if (global.chara_world == WORLD_CAVERNS) // caverns
	{
		battle_group = 12;
	}
	if (global.world_curpopulation[global.chara_world] <= 0) // but nobody came
		battle_group = 0;
	if (global.battle_nextgroup != 0) // override battlegroup with nextgroup
		battle_group = global.battle_nextgroup;
	global.battle_nextgroup = 0;
}
function battle_setupgroup()
{
	defaultx[0] = box_x;
	
	defaultx[1] = (box_x - 120);
	defaultx[2] = (box_x + 120);
	
	defaultx[3] = (box_x - 200);
	defaultx[4] = box_x;
	defaultx[5] = (box_x + 200);
	for (var i = 0; i < array_length(defaultx); i++)
		defaultx[i] = round(defaultx[i]);
	
	defaulty = round(box_y - (box_h / 2) - box_borderw - 20);
	
	battle_bg = spr_battle_bg_corridors;
	if (global.chara_world == WORLD_CAVERNS)
		battle_bg = spr_battle_bg_caverns;
	battle_music = mus_battle1;
	
	if (battle_group == -4) // Test
	{
		
		enemy_type[0] = -1;
		enemy_obj[0] = instance_create_layer(defaultx[1], defaulty, "Instances", obj_enemy_test);
		
		enemy_type[1] = -1;
		enemy_obj[1] = instance_create_layer(defaultx[2], defaulty, "Instances", obj_enemy_test);
	}
	if (battle_group == -3)
	{
		enemy_type[0] = -1;
		enemy_obj[0] = instance_create_layer((defaultx[3] - 20), defaulty, "Instances", obj_enemy_test);
		
		enemy_type[1] = -1;
		enemy_obj[1] = instance_create_layer((defaultx[2] - 20), defaulty, "Instances", obj_enemy_test);
	}
	if (battle_group == -2)
	{
		enemy_type[0] = -1;
		enemy_obj[0] = instance_create_layer(-20, -20, "Instances", obj_enemy_test);
	}
	if (battle_group == -1)
	{
		battle_bg = spr_battle_bg_corridors;
		
		enemy_type[0] = -1;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_test);
	}
	
	if (battle_group == 0) // But nobody came.
	{
		//battle_bg = -1;
		battle_music = -1;
		global.flag[22] = 1;
	}
	if (battle_group == 1) // Dummy
	{
		battle_bg = spr_battle_bg_dummy;
		battle_flee = 0;
		battle_music = mus_battle_dummy;
		
		enemy_type[0] = 1;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_dummy);	
	}
	if (battle_group == 2) // Armsguy
	{
		enemy_type[0] = 2;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_armsguy);
	}
	if (battle_group == 3) // Trashguy
	{
		enemy_type[0] = 3;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_trashguy);	
	}
	if (battle_group == 4) // Flitcher
	{
		enemy_type[0] = 4;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_flitcher);	
	}
	if (battle_group == 5) // Eyecrush
	{
		enemy_type[0] = 5;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_eyecrush);	
	}
	
	if (battle_group == 6) // Broken Clock
	{
		battle_flee = 0;
		battle_music = mus_battle_brock;
		enemy_type[0] = 6;
		enemy_obj[0] = instance_create_layer((defaultx[0] + sprite_get_width(spr_enemy_brock_body)), (room_height / 2), "Instances", obj_enemy_brock);
		obj_battle_bg.waveSpeed /= 2;
	}
	
	if (battle_group == 7) // Armsguy, Armsguy
	{	
		enemy_type[0] = 2;
		enemy_obj[0] = instance_create_layer(defaultx[1], defaulty, "Instances", obj_enemy_armsguy);
		
		enemy_type[1] = 2;
		enemy_obj[1] = instance_create_layer(defaultx[2], defaulty, "Instances", obj_enemy_armsguy);	
	}
	if (battle_group == 8) // Trashguy, Armsguy
	{	
		enemy_type[0] = 3;
		enemy_obj[0] = instance_create_layer(defaultx[1], defaulty, "Instances", obj_enemy_trashguy);
		
		enemy_type[1] = 2;
		enemy_obj[1] = instance_create_layer(defaultx[2], defaulty, "Instances", obj_enemy_armsguy);
	}
	if (battle_group == 9) // Armsguy, Flitcher
	{	
		enemy_type[0] = 2;
		enemy_obj[0] = instance_create_layer(defaultx[1], defaulty, "Instances", obj_enemy_armsguy);
		
		enemy_type[1] = 4;
		enemy_obj[1] = instance_create_layer(defaultx[2], defaulty, "Instances", obj_enemy_flitcher);	
	}
	if (battle_group == 10) // Eyecrush, Armsguy
	{
		enemy_type[0] = 5;
		enemy_obj[0] = instance_create_layer(defaultx[1], defaulty, "Instances", obj_enemy_eyecrush);
		
		enemy_type[1] = 2;
		enemy_obj[1] = instance_create_layer(defaultx[2], defaulty, "Instances", obj_enemy_armsguy);
	}
	if (battle_group == 11) // Eyecrush, Flitcher
	{
		enemy_type[0] = 5;
		enemy_obj[0] = instance_create_layer(defaultx[1], defaulty, "Instances", obj_enemy_eyecrush);
		
		enemy_type[1] = 4;
		enemy_obj[1] = instance_create_layer(defaultx[2], defaulty, "Instances", obj_enemy_flitcher);
	}
	
	if (battle_group == 12) // Armsguy, Trashguy, Flitcher
	{
		enemy_type[0] = 2;
		enemy_obj[0] = instance_create_layer(defaultx[3] + 20, defaulty, "Instances", obj_enemy_armsguy);
		
		enemy_type[1] = 3;
		enemy_obj[1] = instance_create_layer(defaultx[4], defaulty, "Instances", obj_enemy_trashguy);
		
		enemy_type[2] = 4;
		enemy_obj[2] = instance_create_layer(defaultx[5] - 40, defaulty, "Instances", obj_enemy_flitcher);
	}
	
	if (battle_group == 13) // Rhonhey
	{
		enemy_type[0] = 7;
		enemy_obj[0] = instance_create_layer((defaultx[0] + 6), (defaulty + 8), "Instances", obj_enemy_rhonhey);
	}
	
	if (battle_group == 1000) // TROLLFACE PRIME
	{
		//battle_flee = 0;
		battle_music = mus_battle_tfp;
		battle_bg = -1;
		
		enemy_type[0] = 1000;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_tfp);
	}
	if (battle_group == 2000) // Toilet
	{
		battle_bg = -1;
		battle_music = unused_mus_battle_toilet;
		enemy_type[0] = 2000;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", unused_obj_enemy_toilet);
	}
}
function battle_enemy()
{
	for (var i = 0; i < enemy_length; i++)
	{
		if (enemy_obj[i] != -1)
		{
			enemy_obj[i].myself = i;
			enemy_obj[i].hpwidth = 100;
			enemy_obj[i].hurtsound = snd_enemy_hurt1;
		
			if (enemy_type[i] == 2000) // Toilet
			{
				enemy_name[i] = "Toilet";
				enemy_curhp[i] = 1000;
				enemy_maxhp[i] = 1000;
				enemy_atk[i] = 10;
				enemy_def[i] = 10;
				enemy_reward_exp[i] = 100;
				enemy_reward_mny[i] = 100;
				enemy_obj[i].hpwidth = 200;
				enemy_act[i, 1] = "Flush";
			}
			if (enemy_type[i] == -1000) // Sans
			{
				enemy_name[i] = "Sans";
				enemy_curhp[i] = 1;
				enemy_maxhp[i] = 1;
				enemy_atk[i] = 1;
				enemy_def[i] = 1;
			}
			
			if (enemy_type[i] == -1) || (enemy_type[i] == -10) // test
			{
				enemy_name[i] = "TESTE 1";
				if (enemy_type[i] == -10)
					enemy_name[i] = "TESTE 2";
				enemy_curhp[i] = 50;
				enemy_maxhp[i] = 50;
				enemy_atk[i] = 0;
				enemy_def[i] = -100;
				enemy_reward_exp[i] = 300;
				enemy_reward_mny[i] = 200;
				enemy_act[i, 1] = "Plead";
				enemy_act[i, 2] = "Challenge";
				enemy_act[i, 3] = "Convince";
				enemy_act[i, 4] = "Kick";
			}
		
			if (enemy_type[i] == 1) // Dummy
			{
				enemy_name[i] = "Dummy";
				enemy_curhp[i] = 50;
				enemy_maxhp[i] = 50;
				enemy_atk[i] = 1;
				enemy_def[i] = 1;
				enemy_reward_exp[i] = 0;
				enemy_reward_mny[i] = 0;
				enemy_act[i, 1] = get_text("battle_act_dummy_1");
				enemy_act[i, 2] = get_text("battle_act_dummy_2");
			}
			if (enemy_type[i] == 2) // Armsguy
			{
				enemy_name[i] = "Armsguy";
				enemy_curhp[i] = 35;
				enemy_maxhp[i] = 35;
				enemy_atk[i] = 5;
				enemy_def[i] = 4;
				enemy_reward_exp[i] = 3;
				enemy_reward_mny[i] = 2;
				enemy_act[i, 1] = get_text("battle_act_armsguy_1");
				enemy_act[i, 2] = get_text("battle_act_armsguy_2");
				enemy_obj[i].hpwidth = 200;
			}
			if (enemy_type[i] == 3) // Trashguy
			{
				enemy_name[i] = "Trashguy";
				enemy_curhp[i] = 25;
				enemy_maxhp[i] = 25;
				enemy_atk[i] = 4;
				enemy_def[i] = 7;
				enemy_reward_exp[i] = 3;
				enemy_reward_mny[i] = 2;
				enemy_act[i, 1] = get_text("battle_act_trashguy_1");
				enemy_act[i, 2] = get_text("battle_act_trashguy_2");
				enemy_obj[i].hurtsound = snd_enemy_hurt2;
			}
			if (enemy_type[i] == 4) // Flitcher
			{
				enemy_name[i] = "Flitcher";
				enemy_curhp[i] = 25;
				enemy_maxhp[i] = 25;
				enemy_atk[i] = 4;
				enemy_def[i] = 6;
				enemy_reward_exp[i] = 3;
				enemy_reward_mny[i] = 2;
				enemy_act[i, 1] = get_text("battle_act_flitcher_1");
				enemy_act[i, 2] = get_text("battle_act_flitcher_2");
				enemy_obj[i].hurtsound = snd_enemy_hurt3;
			}
			if (enemy_type[i] == 5) // Eyecrush
			{
				enemy_name[i] = "Eyecrush";
				enemy_curhp[i] = 35;
				enemy_maxhp[i] = 35;
				enemy_atk[i] = 6;
				enemy_def[i] = 0;
				enemy_reward_exp[i] = 3;
				enemy_reward_mny[i] = 2;
				enemy_act[i, 1] = get_text("battle_act_eyecrush_1");
				enemy_act[i, 2] = get_text("battle_act_eyecrush_2");
			}
			
			if (enemy_type[i] == 6) // Broken Clock
			{
				enemy_name[i] = "Broken Clock";
				enemy_curhp[i] = 50;
				enemy_maxhp[i] = 50;
				enemy_atk[i] = 5;
				enemy_def[i] = 1000;
				enemy_reward_exp[i] = 15;
				enemy_reward_mny[i] = 10;
				enemy_act[i, 1] = get_text("battle_act_brock_1");
				enemy_act[i, 2] = get_text("battle_act_brock_2");
				enemy_act[i, 3] = get_text("battle_act_brock_3");
				enemy_obj[i].hurtsound = snd_enemy_hurt5;
			}
			
			if (enemy_type[i] == 7) // Rhonhey
			{
				enemy_name[i] = "Rhonhey";
				enemy_curhp[i] = 50;
				enemy_maxhp[i] = 50;
				enemy_atk[i] = 5;
				enemy_def[i] = 4;
				enemy_reward_exp[i] = 6;
				enemy_reward_mny[i] = 4;
				enemy_act[i, 1] = get_text("battle_act_rhonhey_1");
				enemy_act[i, 2] = get_text("battle_act_rhonhey_2");
				enemy_act[i, 3] = get_text("battle_act_rhonhey_3");
			}
			
			if (enemy_type[i] == 1000) // TROLLFACE PRIME
			{
				enemy_name[i] = "TROLLFACE PRIME";
				enemy_curhp[i] = 100;
				enemy_maxhp[i] = 100;
				enemy_atk[i] = 10;
				enemy_def[i] = 10;
				enemy_reward_exp[i] = 25;
				enemy_reward_mny[i] = 100;
				enemy_obj[i].hurtsound = snd_enemy_hurt4;
			}
		}
	}
}
function battle_getattack()
{
	box_nextw = 160;
	box_nexth = 160;
	battle_turntime = 450;
	
	heart_nextx = -1;
	heart_nexty = -1;
	
	for (var i = 0; i < enemy_length; i++)
	{
		enemy_attack[i]	= irandom(1);
		
		if (enemy_type[i] == 2000) // Toilet
		{
			enemy_attack[i] = 0;
			battle_turntime = 600;
		}
		
		if (enemy_type[i] == 5555) // empty
		{
			enemy_attack[i] = 1;
			battle_turntime = 600;
		}
	
		if (enemy_type[i] == 2) // Armsguy
		{
			if (i == 1 && enemy_type[(i - 1)] == 3 && enemy_attack[(i - 1)] == 1)
				enemy_attack[i] = 0;
		}
		if (enemy_type[i] == 4) // Flitcher
		{
			for (var z = 0; z < 3; z++)
			{
				if (i != z && enemy_type[z] != 0 && enemy_type[z] != 4)
					enemy_attack[i] = choose(2, 2, 2, 0, 1);
			}
		}
		if (enemy_type[i] == 5) // Eyecrush
		{
			if (enemy_attack[i] == 1 && battle_group == 5)
			{
				box_nextw = 120;
				box_nexth = 120;
			}
		}
		
		if (enemy_type[i] == 6) // Broken Clock
		{
			// get attack
			enemy_attack[i] = battle_round;
			if (battle_round > 3)
				enemy_attack[i] = irandom_range(0, 3);
			
			// get turntime and box info
			if (enemy_attack[i] == 1)
				battle_turntime = 480;
			else if (enemy_attack[i] == 2) || (enemy_attack[i] == 3)
			{
				if (enemy_attack[i] == 3)
				{
					box_nextw = 188;
					box_nexth = 188;
				}
				battle_turntime = 600;
				heart_nexty = (box_nexty + (box_nexth / 3));
			}
			
			// can spare
			if (enemy_spare[i] >= 100)
			{
				enemy_attack[i] = 0;
				box_nextx = box_defaultx;
				box_nexty = box_defaulty;
				box_nextw = box_defaultw;
				box_nexth = box_defaulth;
				heart_nextx = box_nextx;
				heart_nexty = box_nexty;
				battle_turntime = 0;
			}
			
			
		}
		
		if (enemy_type[i] == 7) // Rhonhey
		{
			enemy_attack[i] = 0;
		}
	}
	
	if (heart_nextx == -1)
		heart_nextx = box_nextx;
	if (heart_nexty == -1)
		heart_nexty = box_nexty;
	if (global.indebug == 1 && global.debug_hud == true)
		battle_turntime = 0;
}
function battle_attack()
{
	// vars: time (1), amt (0), stage (0), delay (999), siner (0), controller and box_ (myself, enemy (type), attack)
	if (enemy == -1) || (enemy == -10) // test
	{
		if (attack == 0)
		{
			delay += 1;
			if (delay >= 30)
			{
				var _x = (box_x - (box_w / 2) + (40 * irandom(3)));
				var _y = (box_y - (box_h / 2) - box_borderw - 40);
				create(_x, _y, obj_battle_blt);
				thisobj.type = -1;
				delay = 0;
			}
		}
	}
	
	if (enemy == 1) // Dummy
	{
		var _x = choose((box_x - box_w), (box_x + box_w));
		var _y = irandom_range(box_y - (box_h / 2), (box_y + (box_h / 2)));
		create(_x, _y, obj_battle_blt);
		thisobj.type = 1;
		
		time = (irandom_range(30, 50) - (controller.enemy_obj[0].stage * 3));
		time = clamp(time, 1, 60);
	}
	if (enemy == 2) // Armsguy
	{
		if (attack == 0)
		{
			var _x = (box_x - (box_w / 2) + irandom(box_w));
			var _y = (box_y - (box_h / 2) - 15);
			create(_x, _y, obj_battle_blt);
			thisobj.type = 2.0;
			
			time = (irandom_range(10, 15) + normaltime);
		}
		if (attack == 1)
		{
			var _x = (box_x - (box_w / 2) + irandom(box_w));
			var _y = (box_y - (box_h / 2) - 15);
			create(_x, _y, obj_battle_blt);
			thisobj.type = 2.1;
			
			time = (irandom_range(45, 60) + normaltime);
		}
	}
	if (enemy == 3) // Trashguy
	{
		if (attack == 0)
		{
			var _enemy = controller.enemy_obj[myself];
			
			var _x = (_enemy.x + 10 + (irandom(sprite_get_width(_enemy.sprite_index) * 2) - 10));
			var _y = (_enemy.y + 35);
			create(_x, _y, obj_battle_blt);
			thisobj.type = 3.0;
			thisobj.myself = myself;
			
			shakeobj(_enemy.body, 3, 3, 0.25);
			audio_play(snd_bump, 0, VOLUME_SOUND);
			
			time = (irandom_range(15, 25) + normaltime);
		}
		if (attack == 1)
		{
			for (var i = 0; i < 2; i++)
			{				
				create(-40, -40, obj_battle_blt);
				thisobj.type = 3.1;
				thisobj.normaltime = normaltime;
				thisobj.myside = i;
			}
			time = 0;	
		}
	}
	if (enemy == 4) // Flitcher
	{
		if (attack == 0) || (attack == 1)
		{
			var _x = (box_x - (box_w / 2) + irandom_range(10, box_w - 10));
			var _y = (box_y - (box_h / 2) - 20);
			if (attack == 1)
			{
				_x = (box_x + (box_h / 2) + 20);
				_y = (box_y - (box_h / 2) + irandom_range(10, box_h - 10));
			}
			
			create(_x, _y, obj_battle_blt)
			thisobj.type = (4 + (attack / 10));
			time = irandom_range(20, 30) + (normaltime * 2);
		}
		if (attack == 2)
		{
			if (stage == 0)
			{
				for (var i = 0; i < 20; i++)
				{
					create((box_x - box_w + (20 * i)), (box_y + (box_h / 2) - 20), obj_battle_blt);
					thisobj.type = 4.2;
					thisobj.pos = i;
					
					create((box_x - box_w + (20 * i)), (box_y - (box_h / 2) + 10), obj_battle_blt);
					thisobj.type = 4.2;
					thisobj.pos = i;
				}
				xx = box_x;
				stage = 1;
			}
			else
			{
				siner += 0.1;
				controller.box_nextx = (xx + sin(siner) * 18);
			}
		}
	}
	if (enemy == 5) // Eyecrush
	{
		if (attack == 0)
		{
			side = choose(LEFT, RIGHT, UP, DOWN);
			var _inheart = choose(0, 0, 1);
			
			var _s = spr_battle_blt_tinycrush_h;
			var _sw = sprite_get_width(_s);
			var _sh = sprite_get_height(_s);
		
			var _x = (box_x - (box_w / 2) - 20);
			var _y = (box_y - (box_h / 2) + irandom(box_h) - (_sh / 2));
			if (side == RIGHT)
				_x = (box_x + (box_w / 2) + 20);
			if (_inheart == 1)
				_y = (obj_battle_heart.y - (_sh / 2));
				
			if (side == UP) || (side == DOWN)
			{
				_s = spr_battle_blt_tinycrush_v;
				_sw = sprite_get_width(_s);
				_sh = sprite_get_height(_s);
				
				_x = (box_x - (box_w / 2) + irandom(box_w) - (_sw / 2));
				_y = (box_y - (box_h / 2) - 20);
				if (side == DOWN)
					_y = (box_y + (box_h / 2) + 20);
				if (_inheart == 1)
					_x = (obj_battle_heart.x - (_sw / 2));
			}
			
			create(_x, _y, obj_battle_blt);
			thisobj.type = 5.0;
			thisobj.side = side;
			time = (30 + (normaltime * 2));
		}
		else
		{
			if (stage == 0)
			{
				xx = 0;
				yy = 0;
			}
			stage = 1;
	
			while (xx == 0 && yy == 0) || (place_meeting(xx, yy, obj_battle_blt) == 1)
			{
				xx = choose((box_x + (box_w / 2) + irandom_range(60, 120)), (box_x - (box_w / 2) - irandom_range(60, 120)));
				yy = (box_y - (box_h / 2) - 40 + irandom(box_h + 80));	
			}
			
			create(xx, yy, obj_battle_blt);
			thisobj.type = 5.1;
			time = (irandom_range(20, 35) + (normaltime * 2));
		}
	}
	
	if (enemy == 6) // Broken Clock
	{
		var _body = controller.enemy_obj[myself].body;
		var _body_w = _body.sprite_width;
		var _body_h = _body.sprite_height;
		
		if (attack == 0) // electricity
		{
			if (_body.movement == 4 && _body.stage == 2)
			{
				var _delay = 4// - (1 * (controller.battle_round > 0));
				if (delay >= _delay && amt < 7)
				{	
					var _x = (_body.x - (_body_w / 4) + irandom(_body_w / 2));
					var _y = (_body.y - _body_h + 25);
					create(_x, _y, obj_battle_blt);
					thisobj.type = 6;
					delay = 0;
					amt += 1;
				}
				else 
					delay += 1;
			}
			else
			{
				delay = 0;
				amt = 0;
			}
		}
		if (attack == 1) // throwing bricks
		{		
			if (stage == 0)
			{
				bltpos = 0;
				for (var i = 0; i < 100; i++)
					thisblt[i] = -1;
				delay = 0;
				stage = 1;
			}
			if (stage == 1)
			{
				var _delay = 15 - (3 * (controller.battle_round > 1));
				if (delay >= _delay)
				{
					create((box_x - (box_w / 2) + irandom(box_w)), (box_y - (box_h / 2) + 20), obj_battle_blt);
					thisobj.type = 6.1;
					thisblt[bltpos] = thisobj;
					bltpos += 1;
					delay = 0;
				}
				else
					delay += 1;
				
				timer += 1;
				if (timer >= 225)
					stage = 2;
			}
			else if (stage == 2)
			{
				for (var i = 0; i < 100; i++)
				{
					if (thisblt[i] != -1 && exists(thisblt[i]) == 1)
						thisblt[i].reverse = 1;
				}
				stage = 3;
			}	
		}
		if (attack == 3) // himself
		{
			create(_body.x, _body.y, obj_battle_blt);
			thisobj.type = 6.3;
			thisobj.myself = myself;
			time = 0;	
		}
		if (attack == 2) // clock and lightnign
		{
			if (stage == 0)
			{	
				for (var i = 0; i < 4; i++)
				{
					create(controller.box_nextx, controller.box_nexty, obj_battle_blt);
					thisobj.type = (6.2 + (i / 100));
					thisobj.spd = (choose(i, -i) * 1.75);
				}
				time = 60;
				stage = 1;
			}
			else if (stage == 1)
			{
				bx = controller.box_nextx;
				by = controller.box_nexty;
				bw = controller.box_nextw;
				bh = controller.box_nexth;

				danger_x1 = (bx - (bw / 2));
				danger_x2 = (bx + (bw / 2));
				danger_y1 = (by - (bh / 2) + irandom(bh));
				danger_y2 = (by - (bh / 2) + irandom(bh));
				
				priority = irandom(1);
				if (priority == 1)
				{
					danger_x1 = (bx - (bw / 2) + irandom(bw));
					danger_x2 = (bx - (bw / 2) + irandom(bw));
					danger_y1 = (by - (bh / 2));
					danger_y2 = (by + (bh / 2));
				}
				
				var _time = 45;
				if (controller.battle_round > 2)
					_time = 40;
				battle_danger(1, danger_x1, danger_y1, danger_x2, danger_y2, _time);
				
				time = _time;
				stage = 2;
			}	
			else if (stage == 2)
			{
				create(danger_x1, danger_y1, obj_battle_blt);
				thisobj.type = 6.24;
				thisobj.targetx = danger_x2;
				thisobj.targety = danger_y2;
				
				time = 60 - (10 * (controller.battle_round > 2));
				stage = 1;
			}
		}
	}
	
	if (enemy == 7) // Rhonhey
	{
		if (attack == 0)
		{
				
		}
	}
	
	if (enemy == 2000) // Toilet
	{
		if (attack == 0)
		{
			var _x = controller.enemy_obj[myself].orig_x;
			var _y = controller.enemy_obj[myself].y + (controller.enemy_obj[myself].sprite_height / 2);
			create(_x, _y, obj_battle_blt);
			thisobj.type = 2000;
			time = 30;
		}
	}
	
	/*
	else
	{
		if (stage == 0)
		{
			for (var i = 0; i < 3; i++)
			{
				create((box_x + 61), ((round(box_y) - (box_h / 2)) + (40 * i)), obj_battle_blt);
				thisobj.type = 5.1;
				eyeleg[i] = thisobj;
			}
			eyeleg_spd = 0.2;
				
			ii = irandom(2);
			zz = ii;
			while (zz == ii)
				zz = irandom(2);
			stage = 1;
		}
		else if (stage == 1)
		{
			var _targetx = (box_x + 31);
			eyeleg[ii].x = lerp(eyeleg[ii].x, _targetx, eyeleg_spd);
			eyeleg[zz].x = lerp(eyeleg[zz].x, _targetx, eyeleg_spd);
			if (round(eyeleg[ii].x) == _targetx && round(eyeleg[zz].x) == _targetx)
			{
				time = 30;
				stage = 2;
			}
		}
		else if (stage == 2)
		{
			var _targetx = (box_x + 46);
			eyeleg[ii].x = lerp(eyeleg[ii].x, _targetx, eyeleg_spd);
			eyeleg[zz].x = lerp(eyeleg[zz].x, _targetx, eyeleg_spd);
		}
	}
	*/
}
function battle_sparecloud(_instance)
{
	var _enemy = argument0;
	
	for (var i = 0; i < 10; i++)
	{
		var _x = (_enemy.x + (_enemy.sprite_width / 2));
		var _y = (_enemy.y + (_enemy.sprite_height / 2));
		
		cloud = instance_create_layer(_x, _y, "Instances", obj_battle_sparecloud);
		cloud.direction = irandom(360);
	}
}

function battle_danger(_type, _x1, _y1, _x2, _y2, _destroytime)
{
	danger = instance_create_layer(0, 0, "Instances", obj_battle_danger);
	danger.x1 = _x1;
	danger.y1 = _y1;
	danger.x2 = _x2;
	danger.y2 = _y2;
	danger.mytype = _type;
	danger.destroytime = _destroytime;
}



