
// create body
if (body == -1)
{
	body = instance_create_layer((x + body_xdif), y, "Instances", obj_enemy_body);
	body.type = controller.enemy_type[myself];
	body.depth = depth;
	image_alpha = 0;
}

// hurt animation
if (hurt == 1 && hurt_time < 60)
{	
	body.image_index = 1;
	startattack = 0;
	if (hurt_time == 0)
	{
		controller.enemy_curhp[myself] -= obj_battle_fighttarget.dmg;
		create(-20, -20, obj_battle_dmgwriter);
	}
	if (hurt_time == 20)
		audio_play_sound(hurtsound, 0, VOLUME_SOUND);
	
	x = normal_x;
	y = normal_y;
	x += choose(-hurt_amt, hurt_amt);
	y += choose(-hurt_amt, hurt_amt);
	body.x = (x + body_xdif);
	body.y = y;
	if (hurt_amt > 0)
		hurt_amt -= 0.075;
	else
		hurt_amt = 0;
	
	hurt_time += 1;
}
else if (hurt_time >= 60)
{
	if (controller.enemy_curhp[myself] <= 0)
	{
		image_index = 1;
		image_alpha = 0;
		controller.battle_expreward += controller.enemy_reward_exp[myself];
		controller.battle_mnyreward += controller.enemy_reward_mny[myself];
		controller.enemy_type[myself] = 0;
		create(x, y, obj_battle_vapor);
		destroy(body);
	}
	else
	{
		createbubble = 1;
		body.image_index = 0;
	}
		
	event_user(0);
}

// spare animation
if (spared == 1)
{
	image_index = 1;
	image_alpha = 0.5;
	destroy(body);
	battle_sparecloud(id);
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
		writer("battle_act_test" + string(controller.level_heard), bubble_x, bubble_y);
	
		if (controller.level_heard == 1)
			controller.enemy_spare[myself] += 100;
	
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
		writer("battle_bubble_test", bubble_x, bubble_y);
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