
if (active == 1)
{
	if (movement == 1)
	{
		// movimento normal
		if (following == 1)
		{
			// pegar se o jogador está movendo e/ou correndo
			chara_moving = 0;
			chara_running = 0;
			if (chara.x != chara_x[0]) || (chara.y != chara_y[0])
				chara_moving = 1;
			if (chara_speed[pos] > chara.wspeed)	
				chara_running = 1;	
		
			// movimento e animação
			if (chara_moving == 1)
			{
				// movimento
				for (var i = (chara_length - 1); i > 0; i--) 
				{
					chara_x[i] = chara_x[i - 1];
					chara_y[i] = chara_y[i - 1];
					chara_face[i] = chara_face[i - 1];
					chara_speed[i] = chara_speed[i - 1];
				}
				chara_x[0] = chara.x;
				chara_y[0] = chara.y;
				chara_face[0] = global.chara_facing;
				chara_speed[0] = chara.curspeed;
				
				x = chara_x[pos];
				y = chara_y[pos];
				depth = -bbox_bottom;
				
				// animação
				if (x != xprevious) || (y != yprevious)
				{
					image_speed = chara.curimgspeed;
					if (moving == 0)
						image_index = 1;
					moving = 1;
				}
			}
			else
			{
				party_stop(myself);
				moving = 0;	
			}
			
			// resetar velocidade e definir sprite
			speed = 0;
			party_type();
		}
	
		// voando
		else
		{
			targetx = chara.x;
			targety = chara.y;
			xposbonus = 0;
			yposbonus = 0;
			var _facing = -1;
			if (flyside == -1)
				_facing = global.chara_facing;
		
			// pegar posição que tem que ir
			if (flyside == RIGHT) || (_facing == LEFT)
				targetx += 20;
			else if (flyside == LEFT) || (_facing == RIGHT)
				targetx -= 20;
			else if (flyside == DOWN) || (_facing == UP)
				targety += 20;
			else if (flyside == UP) || (_facing == DOWN)
				targety -= 20;
			xposbonus = ((targetx - chara.x) / 20);
			yposbonus = ((targety - chara.y) / 20);
		
			var _xdist = abs(x - targetx);
			var _ydist = abs(y - targety);
			
			// terminar
			if (_xdist <= 2 && _ydist <= 2) || (x == targetx && y == targety)
			{
				x = targetx;
				y = targety;
				speed = 0;
				party_stop(myself);
				if (flylook == -1)
					flylook = global.chara_facing;
			
				for (var i = chara_length; i >= 0; i--)
				{
					chara_x[i] = (chara.x + (xposbonus * i));
					chara_y[i] = (chara.y + (yposbonus * i));
					chara_face[i] = flylook;
					chara_speed[i] = chara.curspeed;
				}
			
				flyside = -1;
				flylook = -1;
				following = 1;
			}
			
			// definir sprite
			else
			{
				speed = 4;
				depth = -bbox_bottom;
				direction = point_direction(x, y, targetx, targety);
				image_speed = 0.35;
				
				if (_xdist > _ydist)
				{
					if (hspeed < 0)
						sprite_index = sprite[LEFT];
					else
						sprite_index = sprite[RIGHT];
				}
				else
				{
					if (vspeed < 0)
						sprite_index = sprite[UP];
					else
						sprite_index = sprite[DOWN];
				}	
			}
		}
	}
	else
	{
		// resetar velocidade e definir sprite
		speed = 0;
		party_type();
	}
}