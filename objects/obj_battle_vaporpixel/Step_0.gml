
if (delay > 0)
{
	disappear += 0.01;
	delay -= 1;
}
else
{
	image_speed = 1;
	gravity_direction = 90;
	gravity = (random(0.1) + 0.1);
	hspeed = (random(1) - 0.5);
	delay = 99999;
}
image_alpha = (1 - disappear);

draw_set_alpha(1);




