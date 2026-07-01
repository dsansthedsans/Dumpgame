
if (active == 1)
{
	if (con < 4)
	{
		if (con == 0)
		{
			image_angle = 90;	
			alarm[2] = 30;
			con = 1;
		}
		if (con == 2) || (con == 3)
		{
			if (con == 2)
			{
				audio_play(unused_snd_blt_whip_throw, 0, VOLUME_SOUND);
				audio_pitch(thisaudio, 0.5);
			}
			con = 3;
			image_angle += 10;
			if (image_angle < 450)
			{
				for (var i = 0; i < ball_amt; i++)
				{
					with (ball[i])
					{	
						if (place_meeting(x, y, unused_obj_rhonheyattacktest_heart) == 1)
						{
							with (other)
							{
								con = 4;
								audio_play(unused_snd_blt_whip_take, 0, VOLUME_SOUND);
							}
						}
					}
				}
			}
			else
				con = 0;
		}
		direction = image_angle;
		
		siner += 0.1;
		for (var i = 1; i < ball_amt; i++)
		{
			if (con != 4)
			{
				ball[i].hspeed = (cos(siner - i) * 8);
				ball[i].vspeed = (sin(siner - i) * 8);
		
				ball[i].x = (x + ball[i].hspeed);
				ball[i].y = (y + ball[i].vspeed);
				ball[i].direction = direction;
				ball[i].speed = (25 + (25 * i));
			}
			else
			{
				ball[i].hspeed = 0;
				ball[i].vspeed = 0;
				ball[i].speed = 0;
			}
		}
	}
	else
	{
		var _spd = 0.15;
		
		if (heart_oldx != 0)
		{
			heart.x = heart_oldx;
			heart.y = heart_oldy;
		}
		heart.x = lerp(heart.x, (x - 40), _spd);
		heart.y = lerp(heart.y, y, _spd);
		heart_oldx = heart.x;
		heart_oldy = heart.y;
		if (heart_shake == 1)
		{
			heart.x += irandom_range(-1, 1);
			heart.y += irandom_range(-1, 1);
		}
		heart_shake = !heart_shake;
		
		targetx[1] = (x - 15);
		targetx[2] = (x - 40);
		targetx[3] = (x - 65);
		targetx[4] = (x - 60);
		
		targety[1] = (y - 15);
		targety[2] = (y - 25);
		targety[3] = (y - 12);
		targety[4] = (y + 15);
		
		for (var i = 1; i < ball_amt; i++)
		{
			ball[i].x = lerp(ball[i].x, targetx[i], _spd);
			ball[i].y = lerp(ball[i].y, targety[i], _spd);
			ball[i].image_angle = lerp(ball[i].image_angle, point_direction(ball[i].x, ball[i].y, heart.x, heart.y), _spd);
		}
	}
}










