
if (con >= 36.5) // eyes
{
	draw_sprite_ext(eyes_sprite, eyes_index, 760, eyes_y, 1, 1, 0, c_white, eyes_alpha);	
	
	if (con < 37)
	{
		if (eyes_index < 6)
			eyes_index += (sprite_get_speed(eyes_sprite) / fps);
		else
			eyes_index = 6;
	}
	else
	{
		eyes_sprite = spr_gabee_eyes_jump;
		var _spd = 0.075;
		if (eyes_jumpsnd != -1 && audio_playing(eyes_jumpsnd) == 1 && audio_sound_get_track_position(eyes_jumpsnd) < 0.23)
		{
			eyes_y = lerp(eyes_y, 110, _spd);
			eyes_index = 0;
		}
		else
		{
			eyes_y = lerp(eyes_y, 0, _spd);
			eyes_alpha = lerp(eyes_alpha, 0, (_spd / 2));
			eyes_index = 1;
		}
	}
}
if (con >= 56)
{
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(-20, -20, (room_width + 20), (room_height + 20), 0);
}