
for (var w = 0; w < 103; w++)
{
	for (var h = 0; h < 58; h++)
	{
		var _scale = 3;
		var _offset = 20 * _scale;
		
		draw_sprite_ext(spr_dumpgame_ytbanner_single, 0, (_offset * w), (_offset * h), _scale, _scale, 0, c_white, 1);	
	}
}

if (keyboard_check_pressed(vk_f4) == 1)
	window_set_fullscreen(true)






