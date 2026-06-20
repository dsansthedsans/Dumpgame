
x = chara.x;
y = (chara.y - (chara.sprite_height / 2) + 6);
depth = (chara.depth - 1);

// damage animation
if (invtime > 0)
	invtime -= 1;
else
{
	image_speed = 0;
	image_index = 0;
}

// appear and disappear
if (disappear == 0 && image_alpha < 1)
	image_alpha += 0.1;
else if (disappear == 1)
{
	image_alpha -= 0.1;
	if (image_alpha <= 0)
		destroy(id);
}