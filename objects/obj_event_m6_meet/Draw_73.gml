if (title_active == true)
{
	draw_set_font(fnt_main_big);
	draw_set_color(global.c_dump);
	draw_set_alpha(1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	var _title_x = round(camera_get_view_x(view_camera[0]) + thiswriter.orig_text_x + (thiswriter.orig_letter_xspace * 2));
	var _title_y = round(camera_get_view_y(view_camera[0]) + thiswriter.textbox_y + (thiswriter.textbox_height / 2) - (string_height("Salenis\nSalenis") / 2));
	for (var t = 0; t < title_length; t++)
		draw_text_transformed(_title_x, (_title_y + (30 * t)), title_text[t], 1.5, 1, 0);
	if (title_length >= 2)
	{
		_title_x = round(camera_get_view_x(view_camera[0]) + thiswriter.textbox_x + thiswriter.textbox_width - 28);
		_title_y = round(camera_get_view_y(view_camera[0]) + thiswriter.textbox_y + (thiswriter.textbox_height / 2));
		draw_set_color(c_white);
		draw_set_valign(fa_middle);
		draw_text_transformed(_title_x, _title_y, "!", 2, 2, 0);
	}
}
draw_set_color(c_white);
draw_set_alpha(1);