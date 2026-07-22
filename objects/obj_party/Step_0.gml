
if (active == 1)
{
	// movimento normal
	if (movetype == 0)
	{
		// movimento
		if (chara_x[0] != chara.x) || (chara_y[0] != chara.y)
		{
			for (var i = (chara_length - 1); i > 0; i--) 
			{
				chara_x[i] = chara_x[i - 1];
				chara_y[i] = chara_y[i - 1];
				chara_face[i] = chara_face[i - 1];
			}
			chara_x[0] = chara.x;
			chara_y[0] = chara.y;
			chara_face[0] = global.chara_facing;
	
			x = chara_x[pos];
			y = chara_y[pos];
			depth = -bbox_bottom;
		}

		// animação
		event_user(0);
		facing = -1;
	}
	
	// movimento "voando"
	else if (movetype == 1)
	{	
		// pegar posição final
		targetx = chara.x;
		targety = chara.y;
		if (targetside == LEFT)
			targetx = (chara.x - pos);
		else if (targetside == RIGHT)
			targetx = (chara.x + pos);
		else if (targetside == UP)
			targety = (chara.y - pos);
		else if (targetside == DOWN)
			targety = (chara.y + pos);
		
		// definir aparência e velocidade
		event_user(3);
		sprite_index = sprite[thisface, 0];
		direction = point_direction(x, y, targetx, targety);
		speed = chara.rspeed_party;
		image_speed = chara.rimgspeed_party;
		if (moving == 0)
			image_index = 0;
		moving = 1;
		
		// se chegou na posição final
		var _xdist = abs(targetx - x);
		var _ydist = abs(targety - y);
		if (_xdist <= speed && _ydist <= speed)
		{
			x = targetx;
			y = targety;
			speed = 0;
			image_speed = 0;
			image_index = 0;
			
			event_user(2);
			
			targetside = -1;
			moving = 0;
			movetype = 0;
		}
		
		depth = -bbox_bottom;
	}
	
	// evento
	else
	{
		event_user(1);
		if (facing != -1)
			sprite_index = sprite[facing, talking];
		moving = 0;
	}
}
























