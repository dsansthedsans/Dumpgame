
if (active == 1)
{
	if (type == 2000) // Toilet
	{
		image_alpha += 0.1;
		
		if (exists(thismover) == 0 && stage == 0 && delay <= 0)
		{
			direction = point_direction(x, y, obj_battle_heart.x, obj_battle_heart.y);
			image_index = 2;
			image_angle = (direction + 90);
			speed = 4;
			stage = 1;
			audio_play(snd_blt_launch, 0, VOLUME_SOUND);
		}
		else if (exists(thismover) == 0 && delay > 0)
			delay -= 1;
		
		if (stage == 1)
		{
			var _y = (controller.box_y + (controller.box_h / 2) - 20);
			if (y >= _y && x > (controller.box_x - (controller.box_w / 2)) && x < (controller.box_x + (controller.box_w / 2)))
			{
				y = _y;
				speed = 0;
				image_index = 3;
				image_angle = 0;
				audio_play(snd_splat, 0, VOLUME_SOUND);
				stage = 2;
			}
		}
	}
	
	if (type == -1) // test
	{
		if (stage == 0)
		{
			delay += 1;
			image_alpha += 0.1;
			if (delay >= 60)
			{
				audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
				delay = 0;
				stage = 1;
			}
		}
		else if (stage == 1)
		{
			gravity = 0.1;
			if (y >= (controller.box_y + (controller.box_h / 2)) - 40)
			{
				vspeed = 0;
				gravity = 0;
				audio_play(snd_impact, 0, VOLUME_SOUND);
				stage = 2;
			}	
		}
		else if (stage == 2)
		{
			delay += 1;
			if (delay >= 30)
			{
				gravity = 0.1;
				stage = 3;
			}
		}
		else if (stage == 3 && y >= (room_height + 40))
			destroy(id);
	}
	
	if (type == 1) // Dummy
	{
		if (global.chara_curhp <= 2)
			can_damage = 0;
		
		if (stage == 0)
		{
			image_alpha += 0.05;
			if (image_alpha >= 1)
				stage = 1;
		}
		else if (stage == 1)
		{
			if (delay >= 45)
			{
				direction = point_direction(x, y, obj_battle_heart.x, obj_battle_heart.y)
				speed = 3;
				stage = 2;	
			}
			else
			{
				siner += 0.1;
				x += sin(siner);
				y += cos(siner);
				delay += 1;
			}
		}
	}
	
	if (type == 2.1) // Armsguy
	{
		if (stage == 0)
		{
			x = lerp(x, targetx, 0.025);	
			var _y = (controller.box_y + (controller.box_h / 2) - controller.box_borderw - 6);
			if (y >= _y)
			{
				y = _y;
				vspeed = 0;
				gravity = 0;
				image_index = 1;
				audio_stop(snd_bump);
				audio_play(snd_bump, 0, VOLUME_SOUND);
				delay = 45;
				stage = 1;
			}
		}
		else if (stage == 1 && delay <= 0)
		{
			y -= 6;
			vspeed = -3;
			gravity = basegrav;
			image_index = 0;
			audio_stop(snd_smalljump);
			audio_play(snd_smalljump, 0, VOLUME_SOUND);
			targetx = obj_battle_heart.x;
			delay = 0;
			stage = 0;
		}
		else if (delay > 0)
			delay -= 1;
	}
	
	if (type == 3.0) // Trashguy
	{
		if (image_xscale < 2 && image_yscale < 2)
		{
			image_xscale += scale_amt;
			image_yscale += scale_amt;
		}
		else 
		{
			image_xscale = 2;
			image_yscale = 2;
		}
		image_alpha += alpha_amt;
		image_angle += angle_amt;
		if (y >= (room_height + 40))
			destroy(id);
	}
	if (type == 3.1)
	{
		mydelay -= 1;
		
		if (mystage == 0 && mydelay <= 0)
		{
			var _spd = 0.2;
			x = lerp(x, targetx, _spd);
			image_alpha = lerp(image_alpha, 1, _spd);
			can_damage = 0;
			if (abs(x - targetx) <= 1)
			{
				x = targetx;
				depth = controller.battle_depth[6];
				image_alpha = 1;
				mystage = 1;
				mydelay = 15;
				mytimer = (40 + (normaltime * 2));
				can_damage = 1;
			}
		}
		else if (mystage == 1 && mydelay <= 0)
		{
			y = lerp(y, obj_battle_heart.y, 0.3);
			mytimer -= 1;
			if (mytimer <= 0)
				mystage = 2;
		}
		else if (mystage == 2)
		{
			hspeed = myspeed;
			afterimage();
			if (myside == 0 && x >= controller.box_x) || (myside == 1 && x <= controller.box_x)
			{
				x = controller.box_x;
				hspeed = 0;
				if (myside == 0)
				{
					audio_play(snd_screenshake, 0, VOLUME_SOUND);
					shakescreen(5, 5)
				}
				can_damage = 0;
				mystage = 0;
				mydelay = 45;
			}
		}
	}
	
	if (type >= 4.0 && type <= 4.2) // Flitcher
	{
		siner += 0.1;
		if (type == 4.0)
			hspeed = (cos(siner) * mult);
		else if (type == 4.1)
			vspeed = (cos(siner) * mult);
		else if (type == 4.2)
			vspeed = (sin(siner + pos) * 0.75);
	}
	
	if (type == 5.1) // Eyecrush
	{
		if (stage == 0)
		{
			image_alpha += 0.1;
			if (image_alpha >= 1)
				stage = 1;
		}
		else if (stage == 1)
		{
			delay -= 1;
			if (delay <= 0)
			{
				create(x, y, obj_battle_blt);
				thisobj.type = 5.15;
				audio_play(snd_shot, 0, VOLUME_SOUND);
				
				delay = 60;
				stage = 2;	
			}
		}
		else if (stage == 2)
		{
			delay -= 1;
			if (delay <= 0)
				stage = 3;
		}
		else if (stage == 3)
		{
			image_alpha -= 0.1;
			if (image_alpha <= 0)
				destroy(id);
		}
		var _dir = 0;
		if (image_xscale != -2)
			_dir = 180;
		image_angle = point_direction(x, y, obj_battle_heart.x, obj_battle_heart.y) + _dir;
	}
	if (type == 5.15)
	{
		if (image_index >= (image_number - 1))
			image_speed = 0;
		if (speed < 8)
			speed += 0.25;
	}
	
	if (type == 6.0) // Broken Clock
	{
		speed += 0.05;
		afterimage();
	}
	if (type == 6.1)
	{
		if (reverse == 0)
		{
			if (y < (controller.box_y - (controller.box_h / 2) - controller.box_borderw - 10))
			{
				depth = controller.battle_depth[6];	
				can_damage = 1;
				if (playsnd == 0)
					audio_play(snd_blt_launch, 0, VOLUME_SOUND);
				playsnd = 1;
			}
		
			if (image_alpha < 1)
				image_alpha += 0.05;
			image_angle += angleamt;
			
			pospos += 1;
			xpos[pospos] = x;
			ypos[pospos] = y;
			depthpos[pospos] = depth;
			anglepos[pospos] = image_angle;
			alphapos[pospos] = image_alpha;
		}
		if (reverse == 1)
		{
			speed = 0;
			gravity = 0;
			reverse_delay -= 1;
			if (reverse_delay <= 0)
				reverse = 2;
		}
		if (reverse == 2 && pospos > 0)
		{
			pospos -= 1;
			x = xpos[pospos];
			y = ypos[pospos];
			depth = depthpos[pospos];
			image_angle = anglepos[pospos];
			image_alpha = alphapos[pospos];
			if (depth == controller.battle_depth[2] && y > (controller.box_y - (controller.box_h / 2) - controller.box_borderw - 10))
				can_damage = 0;
			if (pospos == 0)
			{
				audio_play(snd_blt_launch_reverse, 0, VOLUME_SOUND);
				destroy(id);
			}
		}
	}
	if (type == 6.3)
	{
		if (stage == 0)
		{		
			// get angle
			dir = choose(!dir, !dir, dir);
			var _amt = 90;
			if (dir == 0)
			{
				xpos = !xpos;
				if (xpos == 0 && ypos == 0) || (xpos == 1 && ypos == 1)
					_amt = -90;
			}
			else
			{
				ypos = !ypos;
				if (xpos == 1 && ypos == 0) || (xpos == 0 && ypos == 1)
					_amt = -90;
			}
			nextangle += _amt;
			nextx = xx[xpos];
			nexty = yy[ypos];
			
			// create danger
			var _time = 27;
			if (controller.battle_round > 3)
				_time = 22;
			dx1 = (x - (sw / 2) + 2);
			dy1 = (y - (sh / 2) + 2);
			dx2 = (nextx + (sw / 2) - 2);
			dy2 = (nexty + (sh / 2) - 2);
			if (dx2 < dx1) || (dy2 < dy1)
			{
				dx1 = (nextx - (sw / 2) + 2);
				dy1 = (nexty - (sh / 2) + 2);
				dx2 = (x + (sw / 2) - 2);
				dy2 = (y + (sh / 2) - 2);
			}
			battle_danger(0, round(dx1), round(dy1), round(dx2), round(dy2), _time);
			
			stage = 1;
		}
		else if (stage == 1 && exists(obj_battle_danger) == 0)
		{
			x = lerp(x, nextx, 0.25);
			y = lerp(y, nexty, 0.25);
			image_angle = lerp(image_angle, nextangle, 0.25);
			if (delay == 0 && touchytouchy == 1)
				audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
			
			var _time = 20;
			if (controller.battle_round > 3)
				_time = 15;
			if (delay >= _time)
			{
				x = nextx;
				y = nexty;
				image_angle = nextangle;
				delay = 0;
				stage = 0;
			}
			else
				delay += 1;
		}
	}
	if (type >= 6.21 && type <= 6.23)
		image_angle += spd;
	if (type == 6.24)
	{
		if (fadeout == 1)
		{
			image_alpha -= 0.04;
			if (image_alpha <= 0)
				destroy(id);
		}
		fadeout = 1;
	}
}










