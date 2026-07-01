
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
		body.sprite_index = spr_enemy_eyecrush_hurt;
		startattack = 0;
		if (hurt_time == 0)
		{
			controller.enemy_curhp[myself] -= obj_battle_fighttarget.dmg;
			create(-20, -20, obj_battle_dmgwriter);
		}
	
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
			sprite_index = spr_enemy_eyecrush_hurt;
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
			body.sprite_index = spr_enemy_eyecrush;
			createbubble = 1;
		}
		
		event_user(0);
	}

	// spare animation
	if (spared == 1)
	{
		image_alpha = 0.5;
		sprite_index = spr_enemy_eyecrush_hurt;
		destroy(body);
		battle_sparecloud(id);
		audio_play(snd_battle_spared, 0, VOLUME_SOUND);
		global.chara_spares += 1;
		global.world_sparedpopulation[global.chara_world] += 1;
		controller.battle_mnyreward += controller.enemy_reward_mny[myself];
		controller.enemy_type[myself] = 0;
		spared = 0;
	}

	if (controller.enemy_type[myself] != 0)
	{
		// act used
		if (controller.battle_usedact == 1 && usedact == 0 && controller.enemy_target == myself)
		{
			var _bonus = "";
			var _heard = controller.level_heard;
			if (_heard == 2)
			{
				_bonus = "_0";
				if (hypnotized == 2)
					_bonus = "_1";
			}
			writer("battle_act_eyecrush" + string(_heard) + string(_bonus), -1, -1);
			usedact = 1;
			if (_heard == 1)
			{
				controller.enemy_spare[myself] = 100;
				body.sprite_index = spr_enemy_eyecrush_hypnotized;
				hypnotized = 1;
			}
			if (_heard == 2 && controller.enemy_spare[myself] < 100)
				controller.enemy_spare[myself] += 50;
		}
		else if (usedact == 1 && exists(thiswriter) == 0 && controller.enemy_target == myself)
		{
			usedact = 2;
			createbubble = 1;
		}

		// nothing
		if (controller.battle_lvl == 10 && controller.enemy_target != myself && createbubble == 0)
			createbubble = 1;

		// skip bubble
		if (controller.createbubble == 1 && createbubble == 1)
		{
			if (hypnotized == 2)
			{
				controller.enemy_spare[myself] = 0;
				body.sprite_index = spr_enemy_eyecrush;
				hypnotized = 0;
			}
			if (hypnotized == 1)
				hypnotized += 1;
			
			createbubble = 0;
			startattack = 1;
			returnmain = 0;
		}

		// end attack
		if (startattack == 1 && controller.battle_lvl == 13)
		{	
			startattack = 0;
			returnmain = 1;
			usedact = 0;
		}
	}
}