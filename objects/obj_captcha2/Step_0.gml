
event_user(0);

for (var i = 0; i < 3; i++)
{
	// puzzle victory
	if (puzzle_complete[i] == 0 && moveable_curx[i] == moveable_targetx[i] && moveable_cury[i] == moveable_targety[i])
	{
		alarm[0] = 30;
		var _winflagid = (31 + i);
		global.flag[_winflagid] = 1;
		if (global.flag[31] == 1 && global.flag[32] == 1 && global.flag[33] == 1)
			global.flag[34] = 1;
		moveable[i].canmove = 0;
		puzzle_complete[i] = 0.25;
	}
	
	// bridge movement
	if (puzzle_complete[i] == 0.5)
	{
		bridge_y[i] -= 1;
		bridge_wall[i].y -= 1;
		
		if (obj_chara.x > bridge_x[i] && obj_chara.x < (bridge_x[i] + sprite_get_width(spr_overworld_captcha_bridge)) && obj_chara.y < orig_bridge_y[i] && obj_chara.y > (orig_bridge_y[i] - 60))
		{
			obj_chara.y -= 1;
			obj_chara.depth = -obj_chara.bbox_bottom;
		}
		
		// end movement
		var _targety = (orig_bridge_y[i] - 60);
		if (bridge_y[i] <= _targety)
		{
			bridge_y[i] = _targety;
			puzzle_complete[i] = 1;
			shakescreen(2, 2);
			audio_play(snd_impact, 0, VOLUME_SOUND);
			audio_stop(snd_option_movehold);
			destroy(bridge_wall[i]);
		}
	}
}