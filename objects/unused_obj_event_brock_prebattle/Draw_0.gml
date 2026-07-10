
if (con >= 1)
{
	if (shock == 1)
	{
		shock_x = brock.x;
		shock_y = (brock.y - (brock.sprite_height / 2));
		shock_ind += 0.25;
		draw_sprite_ext(spr_npc_brock_shock, shock_ind, shock_x, shock_y, brock.image_xscale, brock.image_yscale, brock.image_angle, c_white, brock.image_alpha);	
	}
	/*for (var i = 0; i < 2; i++)
	{
		if (con >= 3 && gate_y[i] != 80)
		{
			if (audio_playing(snd_option_movehold) == 0)
				audio_play(snd_option_movehold, 1, VOLUME_SOUND);
			gate_y[i] -= gate_yamt;
			if (gate_y[i] <= 80)
			{
				gate_y[i] = 80;
				shakescreen(4, 4);
				if (audio_playing(snd_impact) == 0)	
					audio_play(snd_impact, 0, VOLUME_SOUND);
				audio_stop(snd_option_movehold);
			}
		}
		gate_h = (sprite_get_height(gate_spr) - (gate_y[i] - 79));
		draw_sprite_part(spr_overworld_sidegate, 0, 0, 0, gate_w, gate_h, gate_x[i], gate_y[i]);
	}*/
}















