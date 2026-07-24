
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
	controller.enemy_def[myself] = 9999999;
	createbubble = 1;
	if (stage == 1)
		stage = 2;
	event_user(0);
}

// spare animation
if (spared == 1)
{
	image_alpha = 0.5;
	destroy(body);
	battle_sparecloud(id);
	if (audio_playing(snd_battle_spared) == false)
		audio_play(snd_battle_spared, 0, VOLUME_SOUND);
	controller.battle_mnyreward += controller.enemy_reward_mny[myself];
	controller.enemy_type[myself] = 0;
	spared = 0;
}

if (controller.enemy_type[myself] != 0)
{
	// act used
	if (controller.battle_usedact == 1 && usedact == 0 && controller.enemy_target == myself)
	{
		writer("battle_act_dummy" + string(controller.level_heard), -1, -1);
		
		if (controller.level_heard == 0 && stage == 3)
			stage = 4;
		else if (controller.level_heard == 1 && stage == 5)
		{
			stage = 6;
			body.stage = 1;
			controller.enemy_spare[myself] = 100;
		}
		else if (controller.level_heard == 2)
		{
			body.stage = 2;
			if (stage >= 3)
				screamed += 1;
		}
		
		usedact = 1;
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
		writer("battle_bubble_dummy", bubble_x, bubble_y);
		createbubble = 2;
		returnmain = 0;
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