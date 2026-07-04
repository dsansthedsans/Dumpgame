
// fade animation
if (fade == 1)
{
	myalpha = lerp(myalpha, 0, 0.1);
	if (abs(0 + myalpha) <= 0.1)
		destroy(id);
}

// bar decreasing animation
curhp_width = lerp(curhp_width, curhp, 0.15);

// stop number falling animation
if (y > ystart)
{
	y = ystart;
	vspeed = 0;
	gravity = 0;
}

debug("i want a wife.");