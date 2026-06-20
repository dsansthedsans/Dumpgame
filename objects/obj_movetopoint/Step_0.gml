
if (exists(target) == 1) 
{
    if (moved == 0) 
	{
        x = target.x;
        y = target.y;
        dist = distance_to_point(movex, movey);
        dir = point_direction(x, y, movex, movey);
        amt = (dist / movemax);
        xadd = lengthdir_x(amt, dir);
        yadd = lengthdir_y(amt, dir);
        moved = 1;
    }
    target.x += xadd;
    target.y += yadd;
	target.x = lerp(x, movex, (movetimer / movemax));
    target.y = lerp(y, movey, (movetimer / movemax));
    movetimer += 1;
    if (movetimer >= movemax)
	{
		//target.x = movex;
		//target.y = movey;
        destroy(id);
	}
	//debug("xadd" + string(xadd) + " yadd" + string(yadd) + " fps" + string(fps) + " hspeed" + string(target.hspeed) + " vspeed" + string(target.vspeed));
}
else
	destroy(id);




