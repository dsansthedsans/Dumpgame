if (chara_murder() >= 1)
{
	var _murder_alpha = 0;
	for (var a = 0; a < 3; a++)
	{
		if (a == 0 && chara_murder() >= 1) || (a == 1 && chara_murder() >= 2) || (a == 2 && chara_murder() >= 3)
			_murder_alpha += (0.05 * 0.75);
	}
	murder_alpha = lerp(murder_alpha, _murder_alpha, 0.05);
	draw_set_alpha(murder_alpha);
	draw_set_color(merge_color(c_white, c_red, 0.5));
	draw_rectangle(-20, -20, (20 + room_width + 20), (20 + room_height + 20), false);
}
draw_set_alpha(1);