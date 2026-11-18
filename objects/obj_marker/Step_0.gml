
if (sprite_index == spr_dumpparticle_heart)
{
	image_angle += (0.01 * mydir);
	direction = (image_angle + 90)
	
	if (y <= 240)
		myfade += 0.005;
	image_alpha = (myalpha - myfade)
	
	if (x <= -20) || (x >= (room_width + 20)) || (y <= -20) || (image_alpha <= 0)
		destroy(id);	
}