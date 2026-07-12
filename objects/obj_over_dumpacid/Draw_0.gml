
// change info in menu
if (room == room_menu)
{
	acid_alpha = controller.alpha;
	acid_bonusy = controller.scroll_y;
}

// change y2 in game over
else if (room == room_over && controller.con >= 9 && ((acid_y2 < 80) || (acid_alpha < 1)))
{
	var _amt = controller.bg_spd;
	acid_y2 = lerp(acid_y2, 80, _amt);
	acid_alpha = lerp(acid_alpha, 1, _amt);
	var _dist = abs(acid_y2 - 80);
	if (_dist <= 1)
	{
		acid_y2 = 80;
		acid_alpha = 1;
	}
}
	
// draw acid
acid_siner += (0.05 * acid_alpha);

layer_id = layer_get_id("Background");
back_id = layer_background_get_id(layer_id);
var _color0 =  layer_background_get_blend(back_id);
var _color1 = global.c_dump;
draw_set_alpha(acid_alpha);
draw_rectangle_color(0, room_height, room_width, ((room_height - acid_y2) - (sin(acid_siner) * 25) + acid_bonusy), _color0, _color0, _color1, _color1, 0);	