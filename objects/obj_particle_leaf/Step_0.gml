
if (y < maxy)
{
	siner += 0.1;
	x += (sin(siner / 2) / 4);
	y += 0.25;
	image_angle += 1;
}
else
{
	if (delay <= 0)
	{
		image_alpha -= 0.01;
		if (image_alpha <= 0)
			destroy(id);
	}
	else
		delay -= 1;
}