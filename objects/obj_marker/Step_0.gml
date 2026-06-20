
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
if (sprite_index == spr_singlepixel && room == unused_room_happybirthday)
{
	siner += 0.1;
	hspeed = sin(siner) * sinermult;	
	image_angle += choose(-2, 2);
}