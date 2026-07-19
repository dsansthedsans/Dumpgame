
if (active == 1)
{
	// create body
	if (body == -1)
	{
		body = instance_create_layer((x + body_xdif), (y + body_ydif), "Instances", obj_enemy_body);
		body.type = controller.enemy_type[myself];
		body.enemy = id;
		body.myself = myself;
		body.depth = depth;
		image_alpha = 0;
	}

	// hurt animation
	if (hurt == 1 && hurt_time < 60)
	{	
		startattack = 0;
		if (hurt_time == 0)
		{
			dmg = obj_battle_fighttarget.dmg
			controller.enemy_curhp[myself] -= dmg;
			create(-20, -20, obj_battle_dmgwriter);
		}

		hurt_stage = 0;
		if (fightattempt == 1)
			hurt_stage = 1;
		hurt_time += 1;
		if (controller.enemy_spare[myself] >= 100)
		{
			audio_play(hurtsound, 0, VOLUME_SOUND);
			body.movement = 5;
			hurt_time = 60;
		}
	}
	else if (hurt_time >= 60)
	{
		if !(controller.enemy_spare[myself] >= 100 && dmg != 0)
		{
			if (hurt_stage == 0)
			{	
				body.movement = 1;
				writer("battle_bubble_brock1", bubble_x, bubble_y);
				hurt_stage = 1;
			}
			else if (hurt_stage == 1 && exists(thiswriter) == 0)
			{	
				event_user(0);
				if (fightattempt == 0)
					bubbledelay = 30;
				fightattempt = 1;
				createbubble = 1;
			}
		}
		else if (body.movement == 5 && body.stage == 3)
		{
			global.flag[38] = 1;
			global.chara_kills += 1;
			controller.battle_expreward += controller.enemy_reward_exp[myself];
			controller.battle_mnyreward += controller.enemy_reward_mny[myself];
			controller.enemy_type[myself] = 0;
			event_user(0);
		}
	}

	// spare animation
	if (spared == 1)
	{
		image_alpha = 0.5;
		destroy(body);
		battle_sparecloud(id);
		audio_play(snd_battle_spared, 0, VOLUME_SOUND);
		global.chara_spares += 1;
		global.world_sparedpopulation[global.chara_world] += 1;
		controller.battle_mnyreward += controller.enemy_reward_mny[myself];
		controller.enemy_type[myself] = 0;
		spared = 0;
	}

	// lower defense
	if (controller.enemy_spare[myself] >= 100)
	{
		controller.battle_music = -1;
		if (body.tense == true)
			controller.battle_music = mus_brock_sad;
		controller.enemy_def[myself] = -10293;
		obj_battle_bg.waveFreeze = true;
	}
	else
		controller.enemy_def[myself] = orig_def;

	if (controller.enemy_type[myself] != 0)
	{
		// act used
		if (controller.battle_usedact == 1 && usedact == 0 && controller.enemy_target == myself)
		{
			global.writer_enemy = id;
			writer("battle_act_brock" + string(controller.level_heard), bubble_x, bubble_y);
			usedact = 1;
		}
		else if (usedact == 1 && exists(thiswriter) == 0 && controller.enemy_target == myself)
		{
			if (controller.level_heard == 3)
				bubbledelay = 30;
			usedact = 2;
			createbubble = 1;
		}

		// nothing
		if (controller.battle_lvl == 10 && controller.enemy_target != myself && createbubble == 0)
			createbubble = 1;

		// create bubble
		if (controller.createbubble == 1 && createbubble == 1)
		{
			if (body.movement == 0)
				body.movement = 1;
			if (body.movement == 2)
			{
				if (bubbledelay <= 0)
				{	
					bubbledelay = 0;
					global.writer_enemy = id;
					writer("battle_bubble_brock0", bubble_x, bubble_y);
					createbubble = 2;
					returnmain = 0;
				}
				else
					bubbledelay -= 1;
			}
		}
		else if (createbubble == 2 && exists(thiswriter) == 0)
		{
			if (controller.enemy_spare[myself] < 100)
				body.movement = 3;
			createbubble = 0;
			startattack = 1;
		}

		// start attack
		if (startattack == 1 && controller.battle_lvl == 13)
		{
			startattack = 0;
			returnmain = 1;
			usedact = 0;
		}
	}
}

