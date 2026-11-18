if (os_browser != browser_not_a_browser)
{
	draw_set_font(fnt_main_spaced_big);
	draw_set_alpha(image_alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline_ext(320, (240 - 10), text_get("room_start"), c_white, 35, 999, 1, c_dkgrey);
	draw_sprite_outline(x, y, sprite_index, image_index, image_xscale, image_yscale, image_angle, image_blend, image_alpha, 1, c_dkgrey);
	//draw_self();
}