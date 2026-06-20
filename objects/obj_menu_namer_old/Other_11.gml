/// @descr draw info

thiscolor = c_white;
if (i == 0 && thisfloor == 3 && capslock == 1)
	thiscolor = c_orange;
if (i == mypos && thisfloor == myfloor)
	thiscolor = c_yellow;
draw_set_alpha(myalpha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_main_spaced_big);