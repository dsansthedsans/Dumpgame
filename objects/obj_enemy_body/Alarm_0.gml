/// @descr get type

if (type == 2000) // Toilet
{
	sprite_index = unused_spr_enemy_toilet;
}

if (type == -1) || (type == -10) // test
	sprite_index = spr_enemy_test_body;

if (type == 1) // Dummy
	sprite_index = spr_enemy_dummy;
if (type >= 2 && type <= 5) // Armsguy, Trashguy, Flitcher, Eyecrush
{
	if (type == 2)
		sprite_index = spr_enemy_armsguy;
	else if (type == 3)
		sprite_index = spr_enemy_trashguy;
	else if (type == 4)
		sprite_index = spr_enemy_flitcher;
	else if (type == 5)
		sprite_index = spr_enemy_eyecrush;
	image_speed = 1;
}

if (type == 6) // Broken Clock
{
	sprite_index = spr_enemy_brock_body;
	otherimage = 1;
	
	shock_x = 0;
	shock_y = 0;
	shock_index = 0;
	shock_alpha = 1;
	shock_alphaTrue = 1;
	
	line_spr = spr_enemy_brock_line;
	for (var i = 0; i < 3; i++)
	{
		line_amt[i] = random_range(0.1, 0.5);
		line_time[i] = irandom(360);
		line_side[i] = choose(-1, 1);
	}
	
	part_length = 20;
	explosion_alpha = 1;
	
	if (enemy.skip == 1)
		movement = 1;
}

if (type == 7) // Rhonhey
{
	body_length = 5;
	for (var i = 0; i < body_length; i++)
	{
		body_spr[i] = spr_enemy_rhonhey_body;
		body_spr[0] = spr_enemy_rhonhey_head;
		
		body_x[i] = 0;
		body_x[0] = (x - 7 + 52);
		body_x[1] = (x + 7 + 30 + 40);
		body_x[2] = (body_x[1] + 45) - 6;
		body_x[3] = (body_x[2] + 33) + 4;
		body_x[4] = (body_x[3] + 25) + 2;
		body_x[5] = (body_x[4] + 20);
		
		body_y[i] = 0;
		body_y[0] = (y + 18);
		body_y[1] = (body_y[0] + 8);
		body_y[2] = (body_y[0] + 12);
		body_y[3] = (body_y[0] + 8);
		body_y[4] = (body_y[0]);
		body_y[5] = (body_y[0] - 14);
		body_y[0] -= 4;
		
		head_index = 0;
		
		var z = (i - 1);
		z = clamp(z, 0, (body_length - 1));
		body_scale[i] = (2 - (0.3 * z));
		var v = (255 - (40 * z));
		body_color[i] = make_color_rgb(v, v, v);
	}
}

if (type == 1000) // TROLLFACE PRIME
{
	body_spd = 0;
	head_spr = spr_enemy_troll_head;
}

active = 1;