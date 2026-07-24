if (con > 0)
{
	var _gate_heightTarget = (gate.heightMax * (gate.active == true));
	if (gate.height != _gate_heightTarget)
	{
		var _gate_heightSpeed = ((gate.heightMax / gate.heightTime) * ((gate.active == true) ? 1 : -1));
		gate.height = clamp((gate.height + _gate_heightSpeed), 0, gate.heightMax);
		if (gate.height == _gate_heightTarget)
		{
			audio_play(snd_impact, 0, VOLUME_SOUND, 0.5);
			shakescreen(2, 2);
		}
	}
	draw_sprite_stretched_ext(gate.sprite, 0, gate.x, (gate.y - gate.height), sprite_get_width(gate.sprite), gate.height, c_white, 1);
}
if (con >= 36.5)
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