
var _side = startside;
if (movetype == 1)
	_side = targetside;

event_user(3);

for (var i = (chara_length - 1); i > 0; i--) 
{
	if (_side == -1)
	{
		chara_x[i] = chara.x;
		chara_y[i] = chara.y;
	}
	else
	{
		if (_side == LEFT) || (_side == RIGHT)
		{
			if (_side == LEFT)
				chara_x[i] = (chara.x - i);
			if (_side == RIGHT)
				chara_x[i] = (chara.x + i);
			chara_y[i] = chara.y;
		}
		if (_side == UP) || (_side == DOWN)
		{
			chara_x[i] = chara.x;
			if (_side == UP)
				chara_y[i] = (chara.y - i);
			if (_side == DOWN)
				chara_y[i] = (chara.y + i);
		}
	}
	chara_face[i] = thisface;
}
chara_x[0] = chara.x;
chara_y[0] = chara.y;
chara_face[0] = thisface;
