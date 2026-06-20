
if (active == 1)
{
	// draw danger
	if (mytype == 0) // rectangle
	{
		draw_set_alpha(1);
		
		draw_set_color(mycolor[curcolor]);
		draw_rectangle(x1, y1, x2, y2, 0);
		
		draw_set_color(c_black);
		draw_rectangle((x1 + 2), (y1 + 2), (x2 - 2), (y2 - 2), 0);
		
		var _amt = 4;
		draw_set_alpha(0.1);
		draw_set_color(mycolor[curcolor]);
		draw_rectangle((x1 + _amt), (y1 + _amt), (x2 - _amt), (y2 - _amt), 0);
		
		draw_sprite_ext(spr_battle_dangersign, 0, (x1 + ((x2 - x1) / 2)), (y1 + ((y2 - y1) / 2)), 1, 1, 0, mycolor[curcolor], 1);
	}
	else if (mytype == 1) // line
	{
		draw_set_alpha(1);
		draw_set_color(mycolor[curcolor]);
		draw_line_width(x1, y1, x2, y2, 2);
	}
}