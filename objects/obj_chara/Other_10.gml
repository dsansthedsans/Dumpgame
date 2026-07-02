/// @descr definir sprites

sprite[LEFT]	= spr_chara_l;
sprite[RIGHT]	= spr_chara_r;
sprite[UP]		= spr_chara_u;
sprite[DOWN]	= spr_chara_d;
sprite[FALLEN]	= spr_chara_fallen;
sprite[SIT]		= spr_chara_sit;

if (afktime >= afkmaxtime)
{
	if (global.chara_facing != SIT)
	{
		xscale = 0.75;
		yscale = 0.5;
		audio_play(snd_cutesit, 0, VOLUME_SOUND);
	}
	global.chara_facing = SIT;
}
if (global.chara_facing == SIT)
{
	image_index = 0;
	if (global.chara_murder >= 2)
		image_index = 1;
	
	// armadura
	if (global.chara_armor == ITEM_BOWL)
		image_index += 2;
}
if (global.chara_facing != -1)
	sprite_index = sprite[global.chara_facing];





/*
sprite_l = spr_mainchara_l;
sprite_r = spr_mainchara_r;
sprite_u = spr_mainchara_u;
sprite_d = spr_mainchara_d;

// afk
if (afktime >= (60 * 120) && move == 1 && inwater == 0)
{
	if (isafk == 0)
	{
		myxscale = 0.9;
		myyscale = 0.9;
		audio_play(snd_cutesit, 0, VOLUME_SOUND);
	}
	isafk = 1;
	facing = SIT;
}
else
	isafk = 0;

// set sprite
if (facing == LEFT)
	sprite_index = sprite_l;
if (facing == RIGHT)
	sprite_index = sprite_r;
if (facing == UP)
	sprite_index = sprite_u;
if (facing == DOWN)
	sprite_index = sprite_d;
if (facing == FALLEN)
	sprite_index = spr_mainchara_fallen;
if (facing == SIT)
{
	sprite_index = spr_mainchara_sit;
	
	// set image index based on route
	image_index = 0;
	if (global.chara_murder >= 2)
		image_index = 1;
	
	// armor
	if (global.chara_armor == ITEM_BOWL)
		image_index += 2;
}
*/