
if (controller.stage >= 1)
{
	var _x = obj_GAME_CONTROLLER.cam_x;
	var _y = obj_GAME_CONTROLLER.cam_y;
	draw_set_alpha(controller.timer_alpha);
	
	draw_sprite_stretched(spr_writer_textbox, 0, (_x + 255), (_y + 5), 61, 38);
	
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	controller.timer_color = lerp(controller.timer_color, 0, 0.05);
	draw_set_color(make_color_rgb(255, controller.timer_color, 0));
	draw_set_font(fnt_main_big);
	var _string0 = controller.timer[0];
	if (controller.timer[0] < 10)
		_string0 = "0" + string(controller.timer[0]);
	draw_text((_x + 264), (_y + 40), _string0);
	
	draw_set_font(fnt_main);
	var _string1 = controller.timer[1];
	if (controller.timer[1] < 10)
		_string1 = "0" + string(controller.timer[1]);
	draw_text((_x + 264 + string_width(_string0) + 14), (_y + 36), "." + string(_string1));
}

draw_set_alpha(1);
