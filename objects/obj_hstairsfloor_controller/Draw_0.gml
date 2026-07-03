
if (active == 0
&& ((instance_exists(obj_room_transition) == 1 && obj_room_transition.altcon >= 2)
|| (instance_exists(obj_room_transition) == 0)))
{
	active = 1;
	deadx = -120;
	deady = -120;
	
	// iniciar variáveis do chão
	infloor = 0;
	floor_x = 0;
	floor_y = 0;
	floor_index = 0;
	event_user(0);
	floor_alp = infloor;
	
	// iniciar variáveis das paredes
	for (var f = 0; f < 2; f++)
	{
		for (var i = 0; i < 10; i++)
		{
			wall[i, f] = -1; // wall, floor
			wall_x[i, f] = 0;
			wall_y[i, f] = 0;
			wall_xsc[i, f] = 1;
			wall_ysc[i, f] = 1;
		}	
	}

	// definir paredes e chão
	if (room == room_corridors_4)
	{
		wall[0, 0] = obj_solid_stairs_ru;
		wall_x[0, 0] = 580;
		wall_y[0, 0] = 220;
	
		wall[1, 0] = obj_solid_stairs_ru;
		wall_x[1, 0] = 600;
		wall_y[1, 0] = 200;
	
		wall[2, 0] = obj_solid_stairs_ru;
		wall_x[2, 0] = 620;
		wall_y[2, 0] = 180;
		
		wall[3, 0] = obj_solid_stairs_ld;
		wall_x[3, 0] = 580;
		wall_y[3, 0] = 180;
	
		//
		wall[0, 1] = obj_solid_block;
		wall_x[0, 1] = 580;
		wall_y[0, 1] = 170;
		wall_xsc[0, 1] = 3;
	
		wall[1, 1] = obj_solid_block;
		wall_x[1, 1] = 570;
		wall_y[1, 1] = 180;
		wall_ysc[1, 1] = 3;
	
		floor_x = 580;
		floor_y = 180;
	}
	if (room == unused_room_corridors_11)
	{
		wall[0, 0] = obj_solid_stairs_lu;
		wall_x[0, 0] = 220;
		wall_y[0, 0] = 180;
	
		wall[1, 0] = obj_solid_stairs_lu;
		wall_x[1, 0] = 240;
		wall_y[1, 0] = 200;
	
		wall[2, 0] = obj_solid_stairs_lu;
		wall_x[2, 0] = 260;
		wall_y[2, 0] = 220;
		
		wall[3, 0] = obj_solid_stairs_rd;
		wall_x[3, 0] = 260;
		wall_y[3, 0] = 180;
		
		//
		wall[0, 1] = obj_solid_block;
		wall_x[0, 1] = 220;
		wall_y[0, 1] = 180;
		wall_xsc[0, 1] = 3;
		wall_ysc[0, 1] = 0.5;
	
		wall[1, 1] = obj_solid_block;
		wall_x[1, 1] = 270;
		wall_y[1, 1] = 180;
		wall_ysc[1, 1] = 3;
		
		floor_x = 220;
		floor_y = 180;
		floor_index = 1;
	}

	// criar paredes
	for (var f = 0; f < 2; f++)
	{
		for (var i = 0; i < 10; i++)
		{
			if (wall[i, f] != -1)
			{
				wall[i, f] = instance_create_layer(deadx, deady, "Instances", wall[i, f]);
				wall[i, f].image_xscale = wall_xsc[i, f];
				wall[i, f].image_yscale = wall_ysc[i, f];
			}
		}
	}
}
else if (active == 1)
{
	event_user(0);

	// definir posições das paredes
	for (var f = 0; f < 2; f++)
	{
		for (var i = 0; i < 10; i++)
		{
			if (wall[i, f] != -1)
			{
				if (f == infloor)
				{
					wall[i, f].x = wall_x[i, f];
					wall[i, f].y = wall_y[i, f];
				}
				else
				{
					wall[i, f].x = deadx;
					wall[i, f].y = deady;
				}
			}		
		}
	}

	// draw floor
	var _amt = 0.15;
	if (infloor == 0 && floor_alp > 0)
		floor_alp -= _amt;
	else if (infloor == 1 && floor_alp < 1)
		floor_alp += _amt;
	draw_sprite_ext(spr_hstairsfloor, floor_index, floor_x, floor_y, 1, 1, 0, c_white, floor_alp);
}