
// states
if (dancing == 1)
{	
	if (dance_delay <= 0)
	{
		// set delay
		dance_delay = 5;
		if (eat_stage == 1 && eat_delay <= 10)
		{
			dance_delay += 25;
			dance_walkturn = 0;
		}
		
		// set xscale
		if (dance_dir == -1)
			image_xscale = 1;
		else
			image_xscale = -1;
		
		// go to new position
		var _xmove = (irandom_range(2, 6) * dance_dir);
		x += _xmove;
		
		y = origy;
		if (dance_walkturn == 1)
			y -= irandom_range(2, 4);
		dance_walkturn = !dance_walkturn;
		
		// reach objetive
		if (dance_dir == 1 && x >= (origx + irandom_range(5, 25))) || (dance_dir == -1 && x <= (origx - irandom_range(5, 25)))
		{
			dance_walkturn = 1;
			dance_walking = 0;
			dance_delay = (120 + dance_initdelay);
			dance_initdelay = 0;
			
			if (dance_dir == 1)
				dance_dir = -1;
			else
				dance_dir = 1;
			
			y = origy;
			eating = 1;
		}
	}
	else
		dance_delay -= 1;
}

if (eating == 1)
{
	sprite_index = spr_particle_bird_eat;
	if (eat_delay <= 0)
	{
		if (eat_stage == 0)
		{
			y = origy;
			image_index = baseindex;
			eat_delay = irandom_range(30, 180);
			eat_stage = 1;
		}
		else
		{
			y += 1;
			image_index += 1;
			eat_delay = 5;
			eat_stage = 0;
		}
	}
	else
		eat_delay -= 1;
}
else
{
	eat_stage = 0;
	eat_delay = 0;
}

if (flying == 1)
{
	sprite_index = spr_particle_bird_fly;
	if (fly_delay <= 0)
	{
		if (fly_stage == 0)
		{
			image_index = baseindex;
			fly_stage = 1;
		}
		else
		{
			image_index += 1;
			fly_stage = 0;
		}
		fly_delay = 4;
	}
	else
		fly_delay -= 1;
}
else
{
	fly_stage = 0;
	fly_delay = 0;
}

if (scarefly == 1)
{
	if (scarefly_stage == 0)
	{
		audio_play(snd_bird_startfly, 0, VOLUME_SOUND);
		scarefly_stage = 1;
		spdx = 0;
		spdy = 0;
	}
	if (scarefly_stage == 1)
	{
		spdx = lerp(spdx, ((scarefly_x - x) * 0.1), 0.1);
		spdy = lerp(spdy, ((scarefly_y - y) * 0.1), 0.1);
		depth = -bbox_bottom;
		x += spdx;
		y += spdy;
		
		// set image direction
		if (spdx < 0)
			image_xscale = 1;
		else
			image_xscale = -1;
		
		// get to point
		var _dist = point_distance(x, y, scarefly_x, scarefly_y);
		if (spdx <= 0.5 && spdy <= 0.5 && _dist <= 0.5)
		{
			x = scarefly_x;
			y = scarefly_y;
			depth = -bbox_bottom;
			image_index = baseindex;
			image_xscale = scarefly_dir;
			flying = 0;
			scarefly = 0;
			scarefly_stage = 2;
			if (mytype >= 5 && mytype <= 7)
			{
				origx = x;
				origy = y;
				dancing = 1;
			}
		}	
	}
}
else
	scarefly_stage = 0;

// trigger scarefly
if (mytype == 1 && global.flag[0] < 1 && obj_event_start.con >= 4 && custom_stage == 0) 
|| (mytype >= 2 && dancing == 1 && point_distance(x, y, chara.x, chara.y) <= scarefly_dist && chara.moving == 1)
{
	eating = 0;
	flying = 1;
	dancing = 0;
	scarefly = 1;
	if (mytype == 1)
		custom_stage = 1;
}
