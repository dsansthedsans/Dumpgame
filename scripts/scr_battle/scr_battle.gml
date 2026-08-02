
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
		battle_group = irandom_range(2, 4);
		if (global.world_curpopulation[global.chara_world] > 1)
		{
			battle_group = choose(irandom_range(2, 4), irandom_range(7, 9));
			if (global.flag[37] == 1 && global.flag[39] == 1)
				battle_group = ((irandom_range(1, 5) != 1) ? irandom_range(7, 9) : 12);
		}
		if (global.battle_nextgroup == 0)
			global.flag[18] = 1;
	}
	else if (global.chara_world == WORLD_CAVERNS) // caverns
	{
		battle_group = 13;
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
		battle_bg = spr_battle_bg_cave;
	battle_music = mus_battle_1;
	
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
	
	if (battle_group == 13) // Rhonhey
	{
		battle_music = mus_event_rhonhey_battle;
		button_active = false;
		enemy_type[0] = 7;
		enemy_obj[0] = instance_create_layer((defaultx[0] + 6), (defaulty - 4), "Instances", obj_enemy_rhonhey);
		heart.x = box_defaultx;
		heart.y = round(box_defaulty + (160 / 3));
		assist.active = false;
		assist.x = (room_width * 1.5);
		assist.y = (room_height * 0.5);
		assist.objectSpeedMax = 14;
		assist.slide = false;
		assist.heal = 99;
		assist.audio_volume = 0.5;
		assist.destroyBullets = false;
	}
	
	if (battle_group == 0) // But nobody came.
	{
		battle_music = -1;
		if (global.flag[22] == false)
			audio_play(snd_murder, 0, VOLUME_SOUND);
		global.flag[22] = true;
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
	if (battle_group == 5) // Eyecrush (UNUSED)
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
	if (battle_group == 10) // Eyecrush, Armsguy (UNUSED)
	{
		enemy_type[0] = 5;
		enemy_obj[0] = instance_create_layer(defaultx[1], defaulty, "Instances", obj_enemy_eyecrush);
		
		enemy_type[1] = 2;
		enemy_obj[1] = instance_create_layer(defaultx[2], defaulty, "Instances", obj_enemy_armsguy);
	}
	if (battle_group == 11) // Eyecrush, Flitcher (UNUSED)
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
		enemy_obj[1] = instance_create_layer(defaultx[4] + 25, defaulty, "Instances", obj_enemy_trashguy);
		
		enemy_type[2] = 4;
		enemy_obj[2] = instance_create_layer(defaultx[5] - 5, defaulty, "Instances", obj_enemy_flitcher);
	}
	
	if (battle_group == 14) // Rhonhey
	{
		enemy_type[0] = 7;
		enemy_obj[0] = instance_create_layer((defaultx[0] + 6), (defaulty - 4), "Instances", obj_enemy_rhonhey);
	}
	
	if (battle_group == 1000) // TROLLFACE
	{
		//battle_flee = 0;
		battle_music = mus_battle_troll;
		battle_bg = spr_battle_bg_troll;
		obj_battle_bg.waveSpeed /= 2;
		enemy_type[0] = 1000;
		enemy_obj[0] = instance_create_layer(defaultx[0], defaulty, "Instances", obj_enemy_troll);
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
			enemy_obj[i].hurtsound = snd_shriekFrog;
		
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
				enemy_obj[i].hurtsound = snd_shriekDemon;
			}
			if (enemy_type[i] == 4) // Flitcher
			{
				enemy_name[i] = "Flitcher";
				enemy_curhp[i] = 25;
				enemy_maxhp[i] = 25;
				enemy_atk[i] = 3;
				enemy_def[i] = 6;
				enemy_reward_exp[i] = 3;
				enemy_reward_mny[i] = 2;
				enemy_act[i, 1] = get_text("battle_act_flitcher_1");
				enemy_act[i, 2] = get_text("battle_act_flitcher_2");
				enemy_obj[i].hurtsound = snd_shriekDragon;
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
				enemy_act[i, 1] = get_text("unused_battle_act_eyecrush_1");
				enemy_act[i, 2] = get_text("unused_battle_act_eyecrush_2");
			}
			
			if (enemy_type[i] == 6) // Broken Clock
			{
				enemy_name[i] = "Broken Clock";
				enemy_curhp[i] = 50;
				enemy_maxhp[i] = 50;
				enemy_atk[i] = 10;
				enemy_def[i] = 99999;
				enemy_reward_exp[i] = 15;
				enemy_reward_mny[i] = 10;
				enemy_act[i, 1] = get_text("battle_act_brock_1");
				enemy_act[i, 2] = get_text("battle_act_brock_2");
				enemy_act[i, 3] = get_text("battle_act_brock_3");
				enemy_obj[i].hurtsound = snd_impactBreak;
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
			
			if (enemy_type[i] == 1000) // TROLLFACE
			{
				enemy_name[i] = "TROLLFACE";
				enemy_curhp[i] = 100;
				enemy_maxhp[i] = 100;
				enemy_atk[i] = 10;
				enemy_def[i] = 10;
				enemy_reward_exp[i] = 25;
				enemy_reward_mny[i] = 100;
				enemy_obj[i].hurtsound = snd_shriekTroll;
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
			heart_nexty = round(box_nexty + (box_nexth / 3));
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
			audio_play(snd_impactBump, 0, VOLUME_SOUND);
			
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
			
			var _s = unused_spr_battle_blt_tinycrush_h;
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
				_s = unused_spr_battle_blt_tinycrush_v;
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
				bltvideo = create(box_x, box_y, obj_battle_blt);
				bltvideo.type = 6.15;
				bltpos = 0;
				for (var i = 0; i < 100; i++)
					thisblt[i] = -1;
				delay = 0;
				stage = 1;
			}
			if (stage == 1)
			{
				var _delay = 15 - (4 * (controller.battle_round > 1));
				if (delay >= _delay)
				{
					create((box_x - (box_w / 2) + irandom(box_w)), (box_y - (box_h / 2) + 20), obj_battle_blt);
					thisobj.type = 6.1;
					thisobj.bltvideo = bltvideo;
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
			if (stage == 0)
			{
				stage += 1;
				delay = 30;
			}
			else if (stage == 1)
			{
				if (delay > 0)
					delay -= 1;
				else
					stage = 2;
			}
			if (stage == 2)
			{
				stage += 1;
				delay = round(60 * 1.75);
				ball =
				{
					objects : [],
					speed : 0.002,
					length : 6,
					distance : ((32 / 2) + 8),
					angle : 180,
					angleOffset : 90,
					angleSpeed : 0,
					angleSpeed_max : -8,
					appear :
					{
						asset : snd_appearSword,
						id : undefined,
					},
					rotate :
					{
						asset : snd_rotate,
						id : undefined,
						volume : undefined,
						volumeMin : 0.25,
						volumeMax : 1,
						pitch : undefined,
						pitchMin : 2,
						pitchMax : 4,
					},
					catch :
					{
						index : undefined,
						angle : undefined,
					},
				};
				for (var b = 0; b < ball.length; b++)
				{
					ball.objects[b] = create(-20, -20, obj_battle_blt);
					thisobj.type = 13;
					thisobj.index = b;
					thisobj.myself = myself;
					thisobj.delaydelay = (10 * b);
				};
				ball.appear.id = audio_play(ball.appear.asset, false, VOLUME_SOUND);
				mee6 =
				{
					stage : 0,
					delay : round(60 * 6),
					buildup :
					{
						asset : snd_buildupComputer,
						id : undefined,
						pitch : undefined,
						pitchMin : 0.5,
						pitchMax : 3,
						pitchSpeed : 0.00375,
					},
					object : undefined,
					bubble_offsetX : 0,
					bubble_offsetY : 0,
				};
				mee6.object = marker(-20, -20, spr_enemy_m6_default, 1, 2, 2, 0, 0, 0, c_white, controller.battle_depth[1]);
				mee6.object.x = (room_width + (sprite_get_width(mee6.object.sprite_index) * mee6.object.image_xscale));
				mee6.object.y = controller.defaulty;
				mee6.bubble_offsetX = (-((sprite_get_width(mee6.object.sprite_index) * mee6.object.image_xscale) / 2));
				mee6.bubble_offsetY = -(((sprite_get_height(mee6.object.sprite_index) * mee6.object.image_yscale) / 2) - round(35 / 4));
			}
			else if (stage == 3)
			{
				if (delay > 0)
					delay -= 1;
				else
				{
					ball.angleSpeed = lerp(ball.angleSpeed, ball.angleSpeed_max, ball.speed);
					ball.angle += ball.angleSpeed;
					if (ball.rotate.id == undefined)
						ball.rotate.id = audio_play(ball.rotate.asset, true, VOLUME_SOUND);
					if (ball.rotate.id != undefined && audio_playing(ball.rotate.asset) == true)
					{
						if (ball.rotate.volume == undefined)
							ball.rotate.volume = ball.rotate.volumeMin;
						ball.rotate.volume = lerp(ball.rotate.volume, (ball.rotate.volumeMin + (abs(ball.rotate.volumeMax - ball.rotate.volumeMin) * (ball.angleSpeed / ball.angleSpeed_max))), ball.speed);
						audio_gain(ball.rotate.id, ball.rotate.volume, 0, false, VOLUME_SOUND);
						if (ball.rotate.pitch == undefined)
							ball.rotate.pitch = ball.rotate.pitchMin;
						ball.rotate.pitch = lerp(ball.rotate.pitch, (ball.rotate.pitchMin + (abs(ball.rotate.pitchMax - ball.rotate.pitchMin) * (ball.angleSpeed / ball.angleSpeed_max))), ball.speed);
						audio_pitch(ball.rotate.id, ball.rotate.pitch);
					}
					else
						ball.rotate.id = undefined;
				}
				for (var b = 0; b < ball.length; b++)
				{
					var _angle = ((b == 0) ? ball.angle : (ball.objects[b - 1].image_angle + ball.angleOffset + ((-ball.angleSpeed_max * b) * (ball.angleSpeed / ball.angleSpeed_max))));
					var _x = ((b == 0) ? controller.box_x : (ball.objects[b - 1].x + lengthdir_x(ball.distance, _angle)));
					var _y = ((b == 0) ? controller.box_x : (ball.objects[b - 1].y + lengthdir_y(ball.distance, _angle)));
					ball.objects[b].image_angle = (_angle - ball.angleOffset);
					ball.objects[b].x = _x;
					ball.objects[b].y = _y;
					if (ball.catch.index == undefined)
					{
						with (ball.objects[b])
						{
							if (active == true && can_damage == true && place_meeting(x, y, other.heart) == true)
							{
								controller.heart_move = false;
								other.ball.catch.index = b;
								other.ball.catch.angle = other.heart.image_angle;
								audio_play(snd_impactOrchestra, false, VOLUME_SOUND,,,, 1.5);
								shakescreen(6, 6);
							}
						}
					}
					else if (ball.catch.index == b)
					{
						global.flag[69] = 0.125;
						heart.x = (ball.objects[b].x + lengthdir_x((ball.objects[b].sprite_width / 2), (_angle - ball.angleOffset)));
						heart.y = (ball.objects[b].y + lengthdir_y((ball.objects[b].sprite_height / 2), (_angle - ball.angleOffset)));
						if (mee6.buildup.id == undefined)
							mee6.buildup.id = audio_play(mee6.buildup.asset, true, VOLUME_SOUND);
						if (mee6.buildup.pitch == undefined)
							mee6.buildup.pitch = mee6.buildup.pitchMin;
						mee6.buildup.pitch += mee6.buildup.pitchSpeed;
						mee6.buildup.pitch = clamp(mee6.buildup.pitch, mee6.buildup.pitchMin, mee6.buildup.pitchMax);
						audio_pitch(mee6.buildup.id, mee6.buildup.pitch);
						if (mee6.delay > 0)
							mee6.delay -= 1;
						else if (controller.assist.active == false)
						{
							controller.assist.active = true;
							controller.assist.curr = controller.assist.max;
						}
						else if (controller.assist.object != undefined && controller.assist.object.active == false) || (controller.assist.object == undefined)
						{
							global.flag[69] = 0.25;
							controller.battle_music = -1;
							controller.heart_move = true;
							stage += 1;
							delay = (60 * 2);
							for (var bb = 0; bb < ball.length; bb++)
								destroy(ball.objects[bb]);
							audio_play(snd_bellFlower, false, VOLUME_SOUND);
							if (ball.rotate.id != undefined && audio_playing(ball.rotate.id) == true)
								audio_stop(ball.rotate.id);
							if (mee6.buildup.id != undefined && audio_playing(mee6.buildup.id) == true)
								audio_stop(mee6.buildup.id);
							break;
						}
					}
				}
			}
			else if (stage == 4)
			{
				if (delay > 0)
					delay -= 1;
				else
					stage += 1;
			}
			else if (stage == 5)
			{
				global.flag[69] = 0.5;
				stage += 1;
				delay = (120 - 30 - 15);
				audio_play(snd_whip_crack, false, VOLUME_SOUND);
			}
			else if (stage == 6)
			{
				if (delay > 0)
					delay -= 1;
				else
					stage += 1;
			}
			else if (stage == 7)
			{
				global.flag[69] = 0.625;
				writer("battle_bubble_m6_0", clamp((mee6.object.x + mee6.bubble_offsetX), 0, (room_width - round(35 / 4))), (mee6.object.y + mee6.bubble_offsetY));
				stage += 1;
			}
			else if (stage == 8 && exists(thiswriter) == false)
			{
				var _mee6_targetX = round(controller.box_defaultx + (controller.box_defaultw / 2.5));
				if (mee6.object.x > _mee6_targetX)
					mee6.object.x -= 2;
				var _rhonhey_targetX = (controller.box_defaultx - (controller.box_defaultw / 2.5));
				if (controller.enemy_obj[myself].body.x > _rhonhey_targetX)
				{
					global.flag[69] = 0.75;
					controller.enemy_obj[myself].body.x -= 1;
				}
				if (controller.enemy_obj[myself].body.x <= _rhonhey_targetX && mee6.object.x <= _mee6_targetX)
				{
					controller.enemy_obj[myself].body.x = round(controller.enemy_obj[myself].body.x);
					mee6.object.x = round(mee6.object.x);
					stage += 1;
				}
			}
			else if (stage == 9)
			{
				writer("battle_bubble_m6_1", (mee6.object.x + mee6.bubble_offsetX), (mee6.object.y + mee6.bubble_offsetY));
				stage += 1;
				delay = 60;
			}
			else if (stage == 10 && exists(thiswriter) == false)
			{
				if (delay > 0)
					delay -= 1;
				else
					stage += 1;
			}
			else if (stage == 11)
			{
				global.flag[69] = 0.875;
				var _rhonhey_targetX = (controller.box_defaultx - (controller.box_defaultw / 2));
				controller.enemy_obj[myself].body.x -= 0.5;
				if (controller.enemy_obj[myself].body.x <= _rhonhey_targetX)
				{
					controller.enemy_obj[myself].body.x = round(controller.enemy_obj[myself].body.x);
					stage += 1;
					delay = 60;
				}
			}
			else if (stage == 12)
			{
				if (delay > 0)
					delay -= 1;
				else
					stage += 1;
			}
			else if (stage == 13)
			{
				writer("battle_bubble_m6_2", (mee6.object.x + mee6.bubble_offsetX), (mee6.object.y + mee6.bubble_offsetY));
				stage += 1;
				delay = 60;
			}
			else if (stage == 14 && exists(thiswriter) == false)
			{
				if (delay > 0)
					delay -= 1;
				else
					stage += 1;
			}
			else if (stage == 15)
			{
				global.flag[69] = 1;
				var _rhonhey_targetX = -(room_width / 2)
				controller.enemy_obj[myself].body.x -= 2;
				if (controller.enemy_obj[myself].body.x <= _rhonhey_targetX)
				{
					controller.enemy_obj[myself].body.x = round(controller.enemy_obj[myself].body.x);
					with (obj_battle_controller)
						alarm[0] = 30;
					stage += 1;
				}
			}
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