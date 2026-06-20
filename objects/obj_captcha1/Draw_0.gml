
// draw screen
draw_sprite_ext(spr_overworld_captcha_screen, myscreen, myscreen_x, myscreen_y, 1, 1, 0, c_white, 1);
		
// draw my write
draw_set_font(fnt_main_spaced)
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_color(myscreen_write_x, myscreen_write_y, mywrite, myscreen_write_color[0], myscreen_write_color[0], myscreen_write_color[1], myscreen_write_color[1], 1);

// draw letters
for (var w = 0; w < 3; w++)
{	
	for (var h = 0; h < 3; h++)
	{
		draw_set_font(fnt_main)
		draw_set_alpha(1);
		draw_set_color(#161419);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text((mybutton_x[w] + 10), (mybutton_y[h] + 7 + (3 * mybutton_pressed[w, h])), myletter[w, h]);
	}
}
