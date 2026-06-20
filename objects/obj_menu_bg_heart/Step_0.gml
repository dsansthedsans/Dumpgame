
image_angle += (0.01 * dir);
direction = (image_angle + 90);
if (y <= 240)
	image_alpha -= 0.005;
if (x <= -20) || (x >= (room_width + 20)) || (y <= -20) || (image_alpha <= 0) || (global.visualeff == 0)
	destroy(id);