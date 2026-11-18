if (delay > 0)
	delay -= 1;
else
{
	speedY += speedYadd;
	x += speedX;
	y += speedY;
}
image_alpha -= 0.01;
if (image_alpha <= 0)
	destroy(id);