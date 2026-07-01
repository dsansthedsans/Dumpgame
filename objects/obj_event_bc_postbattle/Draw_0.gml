
if (con >= 1)
{
	// draw and control gate
	for (var i = 0; i < 2; i++)
	{
		if (((con >= 3 && global.flag[38] == 0) || (con >= 10 && global.flag[38] == 1)) && gate_y[i] != 180)
		{
			if (audio_playing(snd_option_movehold) == 0)
			{
				audio_play(snd_option_movehold, 1, 0);
				audio_pitch(snd_option_movehold, 0.75);
			}
			gate_y[i] += gate_yamt;
			if (gate_y[i] >= 180)
			{
				gate_y[i] = 180;
				shakescreen(2, 2);
				if (audio_playing(snd_impact) == 0)
					audio_play(snd_impact, 0, VOLUME_SOUND);
				audio_stop(snd_option_movehold);
			}
		}
		gate_h = (sprite_get_height(gate_spr) - (gate_y[i] - 79));
		draw_sprite_part(spr_overworld_sidegate, 0, 0, 0, gate_w, gate_h, gate_x[i], gate_y[i]);
	}
}


















