/// @desc animação

event_user(1);

sprite_index = sprite[chara_face[pos], talking];
if (x == xprevious && y == yprevious)
{
	image_speed = 0;
	image_index = 0;
	moving = 0;
}
else
{
	image_speed = chara.curimgspeed;
	if (moving == 0)
		image_index = 1;
	moving = 1;
}