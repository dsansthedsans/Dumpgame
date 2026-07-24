
depth = 0;

event_user(0);
moveable_targetx[0] = 140;
moveable_targety[0] = 680;

moveable_targetx[1] = 60;
moveable_targety[1] = 520;

moveable_targetx[2] = 80;
moveable_targety[2] = 360;

for (var i = 0; i < 3; i++)
{
	puzzle_complete[i] = global.flag[(31 + i)];
	
	// bridge setup
	bridge_x[i] = 200;
	bridge_y[i] = (660 - (180 * i));
	orig_bridge_y[i] = bridge_y[i];
	if (puzzle_complete[i] == 1)
	{
		bridge_y[i] -= 60;
		bridge_wall[i] = -1;
	}
	else
	{
		bridge_wall[i] = instance_create_layer(bridge_x[i], (bridge_y[i] - 20), "Instances", obj_solid_block);
		bridge_wall[i].image_xscale = 2;
	}
	
	// create moveables
	var _xflagid = (25 + (2 * i));
	var _yflagid = (26 + (2 * i));
	
	create_moveable(moveable_curx[i], moveable_cury[i], !puzzle_complete[i], _xflagid, _yflagid);
	moveable[i] = mymoveable;
}



thiswriter = undefined;