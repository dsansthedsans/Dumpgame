
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
		body.sprite_index = spr_enemy_trashguy_hurt;
		startattack = 0;
		if (hurt_time == 0)
		{
			controller.enemy_curhp[myself] -= obj_battle_fighttarget.dmg;
			create(-20, -20, obj_battle_dmgwriter);
		}
		if (hurt_time == 20)
			audio_play(hurtsound, 0, 0);
	
		x = normal_x;
		y = normal_y;
		x += choose(-hurt_amt, hurt_amt);
		y += choose(-hurt_amt, hurt_amt);
		body.x = (x + body_xdif);
		body.y = (y + body_ydif);
		if (hurt_amt > 0)
			hurt_amt -= (0.075 * 2);
		else
			hurt_amt = 0;
	
		hurt_time += 1;
	}
	else if (hurt_time >= 60)
	{
		if (controller.enemy_curhp[myself] <= 0)
		{
			image_alpha = 0;
			sprite_index = spr_enemy_trashguy_hurt;
			global.chara_kills += 1;
			global.world_curpopulation[global.chara_world] -= 1;
			controller.battle_expreward += controller.enemy_reward_exp[myself];
			controller.battle_mnyreward += controller.enemy_reward_mny[myself];
			controller.enemy_type[myself] = 0;
			create(x, y, obj_battle_vapor);
			destroy(body);
		}
		else
		{
			body.sprite_index = spr_enemy_trashguy;
			createbubble = 1;
		}
		
		event_user(0);
	}

	// spare animation
	if (spared == 1)
	{
		image_alpha = 0.5;
		sprite_index = spr_enemy_trashguy_hurt;
		destroy(body);
		battle_sparecloud(id);
		audio_play(snd_battle_spared, 0, 0);
		global.chara_spares += 1;
		global.world_sparedpopulation[global.chara_world] += 1;
		controller.battle_mnyreward += controller.enemy_reward_mny[myself];
		controller.enemy_type[myself] = 0;
		spared = 0;
	}

	// lower defense
	if (controller.enemy_spare[myself] >= 100 && kicked == 0)
		controller.enemy_def[myself] = 0;
	else
		controller.enemy_def[myself] = orig_def;

	if (controller.enemy_type[myself] != 0)
	{
		// act used
		if (controller.battle_usedact == 1 && usedact == 0 && controller.enemy_target == myself)
		{
			var _id = controller.level_heard;
			if (_id == 1)
				_id = string(_id) + "_" + string(emptied);
			writer("battle_act_trashguy" + string(_id), -1, -1);
			usedact = 1;
		
			if (controller.level_heard == 1)
			{
				if (emptied == 0)
				{
					emptied = 1;
					kicked = 0;
				}
				else
					alreadyempty = 1;
			}
			else if (controller.level_heard == 2)
				kicked = 1;
		}
		else if (usedact == 1 && exists(thiswriter) == 0 && controller.enemy_target == myself)
		{
			usedact = 2;
			createbubble = 1;
		}

		// nothing
		if (controller.battle_lvl == 10 && controller.enemy_target != myself && createbubble == 0)
			createbubble = 1;

		// create bubble
		if (controller.createbubble == 1 && createbubble == 1)
		{
			var _text = "battle_bubble_trashguy0";
			if (controller.battle_usedact == 1 && controller.enemy_target == myself && controller.level_heard != 0 && alreadyempty == 0)
			{
				if (controller.level_heard == 1)
					_text = "battle_bubble_trashguy3";
				else if (controller.level_heard == 2)
					_text = "battle_bubble_trashguy4";
			}
			else if (emptied == 1) || (kicked == 1)
			{
				_text = "battle_bubble_trashguy1";
				if (kicked == 1)
					_text = "battle_bubble_trashguy2";
			}
		
			writer(_text, bubble_x, bubble_y);
			createbubble = 2;
			returnmain = 0;
		
			if (emptied == 1) || (kicked == 1)
				controller.enemy_spare[myself] = 100;
		}
		else if (createbubble == 2 && exists(thiswriter) == 0)
		{
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