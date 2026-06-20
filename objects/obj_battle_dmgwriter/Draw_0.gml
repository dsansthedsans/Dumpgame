
// bar
if (drawbar == 1)
{
	// max
	draw_set_alpha(myalpha);
	draw_rectangle_outline(myx, myy, (myx + maxhp), (myy + myh), mycolor_max, 2, c_black);

	// current
	if (curhp_width > 1)
	{
		draw_set_alpha(myalpha);
		draw_rectangle_color(myx, myy, (myx + curhp_width), (myy + myh), mycolor_cur, mycolor_cur, mycolor_cur, mycolor_cur, 0);
	}
}

// dmg
draw_set_font(global.fnt_dmg);
draw_set_alpha(myalpha);
draw_set_color(mycolor_dmg);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_text( (myx + (maxhp / 2)), (myy - 5 + y), dmg);

draw_set_alpha(1);