/// @descr get type

can_damage = 1;
outside_box = 0; // if 0, image_scale won't matter
destroy_on_impact = 1;

image_xscale = 2;
image_yscale = 2;
image_alpha = 1;
image_speed = 0;
image_index = 0;
active = 1;
stage = 0;
delay = 0;
siner = 0;
dmg = 2;

if (type == 2000)
{
	delay = 60;
	outside_box = 1;
	destroy_on_impact = 0;
	
	sprite_index = spr_battle_blt_mysteriousball;
	image_xscale = 1;
	image_yscale = 1;
	image_alpha = 0;
	image_index = irandom(1);
	
	targetx = choose((room_width / 4) - irandom(60), (room_width / 1.5) + irandom(60));
	targety = irandom_range(80, ((room_height / 2) - 40));
	movetopoint(targetx, targety, 60, id);
	//direction = point_direction(x, y, targetx, targety);
	//speed = 2;
}
if (type == -1) // test
	image_alpha = 0;
	
if (type == 1) // Dummy
{
	sprite_index = spr_battle_blt_nail;
	image_xscale = 1;
	image_yscale = 1;
	image_alpha = 0;
	image_speed = 1;
	audio_play(snd_txt2, 0, VOLUME_SOUND);
	outside_box = 1;
	dmg = 0;
}

if (type == 2.0) // Armsguy
{
	gravity_direction = 270;
	sprite_index = spr_battle_blt_drop;
	image_xscale = 1;
	image_yscale = 1;
	gravity = 0.035;
	
	if (x < 320)
		hspeed = random_range(0, 1);
	else 
		hspeed = random_range(0, -1);
		
	var _toheart = choose(0, 0, 1);
	if (_toheart == 1)
		direction = point_direction(x, y, obj_battle_heart.x, obj_battle_heart.y);
}
if (type == 2.1)
{
	sprite_index = spr_battle_blt_slime;
	image_xscale = 1;
	image_yscale = 1;
	gravity_direction = 270;
	gravity = 0.05;
	targetx = obj_battle_heart.x;
	basegrav = gravity;
}

if (type == 3.0) // Trashguy
{
	hspeed = random_range(-0.5, 0.5);
	if (myself == 0)
	{
		if (controller.enemy_obj[1] != -1)
			hspeed = random_range(0.5, 1);
		if (controller.enemy_obj[2] != -1)
			hspeed = random_range(1, 2);
	}
	if (myself == 1 && controller.enemy_obj[2] == -1)
		hspeed = random_range(-0.5, -1);
	if (myself == 2 && controller.enemy_obj[1] != -1)
		hspeed = random_range(-1, -2);
		
	vspeed = irandom_range(-4, -5);
	gravity = 0.075;
	gravity_direction = 270;
	
	image_angle = irandom(360);
	image_index = irandom(4);
	image_alpha = 0;
	image_xscale = 0;
	image_yscale = 0;
	sprite_index = spr_battle_blt_trash;
	
	scale_amt = 0.25;
	alpha_amt = 0.10;
	angle_amt = irandom_range(-1, 1);
	
	outside_box = 1;
}
if (type == 3.1)
{
	x = (controller.box_x - (controller.box_w / 2) - controller.box_borderw);
	y = controller.box_y;
	depth = controller.battle_depth[1];
	image_alpha = 0.25;
	image_xscale = 2;
	if (myside == 1)
		image_xscale = -2;
	image_yscale = 2;
	sprite_index = spr_battle_blt_trashguytop;
	
	mystage = 0;
	mydelay = 0;
	mytimer = 0;
	myspeed = 5;
	targetx = (controller.box_x - (controller.box_w / 2) - 30);
	can_damage = 0;
	outside_box = 1;
	destroy_on_impact = 0;

	if (myside == 1)
	{
		x = (controller.box_x + (controller.box_w / 2) + controller.box_borderw);
		targetx = (controller.box_x + (controller.box_w / 2) + 30);
		myspeed = -5;
	}	
}

if (type >= 4.0 && type <= 4.2) // Flitcher
{	
	sprite_index = choose(spr_battle_blt_eye1, spr_battle_blt_eye1, spr_battle_blt_eye2);
	image_xscale = 1;
	image_yscale = 1;
	siner = 0;
	mult = 1;
	if (type == 4) || (type == 4.1)
	{
		if (type == 4)
			vspeed = 1.5;
		else
			hspeed = -1.5;
	}
	if (sprite_index == spr_battle_blt_eye2)
	{
		mult = 0.5;
		if (type == 4)
			vspeed = 0.75;
		else if (type == 4.1)
			hspeed = -0.75;
	}
	if (type == 4.2)
		dmg += 1;
}

if (type == 5.0) // Eyecrush
{
	image_xscale = 1;
	image_yscale = 1;
	image_speed = 1;
	
	var _spd = 1;
	sprite_index = spr_battle_blt_tinycrush_h;
	hspeed = _spd;
	if (side == RIGHT)
		hspeed = -_spd;
	if (side == UP) || (side == DOWN)
	{
		sprite_index = spr_battle_blt_tinycrush_v;
		vspeed = _spd;
		hspeed = 0;
		if (side == DOWN)
			vspeed = -_spd;
	}
}
if (type == 5.1)
{
	sprite_index = spr_battle_blt_eye;
	if (x < controller.box_x)
		image_xscale *= -1;
	image_alpha = 0;
	outside_box = 1;
	delay = irandom_range(15, 80);
}
if (type == 5.15)
{
	sprite_index = spr_battle_blt_eyelaser;
	image_angle = point_direction(x, y, obj_battle_heart.x, obj_battle_heart.y);
	image_speed = 1;
	direction = image_angle;
	depth -= 1;
	speed = 4;
	outside_box = 1;
}

if (type == 6.0) // Broken Clock
{
	speed = 1;
	direction = point_direction(x, y, obj_battle_heart.x, obj_battle_heart.y);
	image_angle = (direction + 90);
	image_xscale = 1;
	image_yscale = 1;
	sprite_index = spr_battle_blt_shock;
	dmg += 1;
	outside_box = 1;
	audio_play(snd_shock_blt, 0, VOLUME_SOUND);
}
if (type == 6.1)
{
	dmg += 1;
	can_damage = 0;
	outside_box = 1;
	depth = controller.battle_depth[2];
	image_alpha = 0;
	image_index = irandom(4);
	image_angle = irandom(360);
	sprite_index = spr_battle_blt_brick;
	
	vspeed = -choose(3, 5);
	gravity = 0.1;
	if (x < controller.box_x)
		hspeed = irandom_range(0, 1);
	else
		hspeed = irandom_range(0, -1);
	
	playsnd = 1;
	angleamt = choose(1, -1);
	audio_play(snd_blt_launch, 0, VOLUME_SOUND);
	
	pospos = 0;
	for (var i = 0; i < 1000; i++)
	{
		xpos[i] = 0;
		ypos[i] = 0;
		depthpos[i] = 0;
		anglepos[i] = 0;
		alphapos[i] = 0;
	}
	xpos[0] = x;
	ypos[0] = y;
	depthpos[0] = depth;
	anglepos[0] = image_angle;
	alphapos[0] = image_alpha;
	reverse = 0;
	reverse_delay = 30;
}
if (type == 6.3)
{	
	sprite_index = spr_enemy_brock_body;
	image_alpha = 0;
	image_blend = c_red;
	dmg += 2;
	outside_box = 1;
	destroy_on_impact = 0;
	
	bx = controller.box_x;
	by = controller.box_y;
	bw = controller.box_w;
	bh = controller.box_h;
	
	sw = (sprite_get_width(sprite_index) * 2);
	sh = (sprite_get_height(sprite_index) * 2);
	
	xx[0] = round(bx - (bw / 2) + (sw / 2)); // left
	xx[1] = round(bx + (bw / 2) - (sw / 2)); // right
	
	yy[0] = round(by - (bh / 2) + (sh / 2)); // top
	yy[1] = round(by + (bh / 2) - (sh / 2)); // bottom
	
	xpos = irandom(1);
	ypos = 0;
	dir = 0;
	stage = 1;
	touchytouchy = false;
	
	x = xx[xpos];
	y = yy[ypos];
	nextx = x;
	nexty = y;
	nextangle = image_angle;
}
if (type == 6.20)
{
	sprite_index = spr_battle_blt_clockcenter;
	image_xscale = 1;
	image_yscale = 1;
	destroy_on_impact = 0;
	outside_box = 1;
	dmg += 2;
}
if (type >= 6.21 && type <= 6.23)
{
	sprite_index = spr_battle_blt_clockline;
	image_xscale = 1.2;
	image_yscale = 12;
	if (type == 6.22) || (type == 6.23)
	{
		image_xscale = 1.4;
		image_yscale = 6;
		if (type == 6.23)
			image_yscale = 5;
	}
	destroy_on_impact = 0;
	outside_box = 1;
	dmg += 1;
}
if (type == 6.24)
{
	sprite_index = spr_battle_blt_lightingpixel;
	image_yscale = 200;
	image_xscale = 1;
	image_angle = (point_direction(x, y, targetx, targety) + 90);
	image_blend = c_white;
	image_speed = 1;
	alarm[1] = 7;
	fadeout = 0;
	dmg += 2;
	outside_box = 1;
	destroy_on_impact = 0;
	audio_play(snd_explosion2, 0, VOLUME_SOUND);
	shakescreen(5, 5);
}













