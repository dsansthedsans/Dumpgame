
event_user(0);

// draw background
draw_sprite_stretched_ext(spr_menu_optbg, 0, bg_x, bg_y, bg_w, bg_h, c_white, myalpha);

// draw indicator
var _scale = 3;
draw_sprite_ext(spr_heart_small, 0, (heart_optx[mypos, myfloor] - 2), heart_opty[mypos, myfloor], _scale, _scale, 0, c_white, 0.75);

// draw options
for (i = 0; i < letter_length; i++)
{
	thisfloor = 0;
	event_user(1);
	draw_text_outline(letter_x[i, 0] + choose(-shake, 0), letter_y[i, 0] + choose(-shake, 0), letter1[i], thiscolor, 2, c_black);
	
	thisfloor = 1;
	event_user(1);
	draw_text_outline(letter_x[i, 1] + choose(-shake, 0), letter_y[i, 1] + choose(-shake, 0), letter2[i], thiscolor, 2, c_black);
}
for (i = 0; i < number_length; i++)
{
	thisfloor = 2;
	event_user(1);
	draw_text_outline(number_x[i] + choose(-shake, 0), number_y[i] + choose(-shake, 0), number[i], thiscolor, 2, c_black);
}
for (i = 0; i < bonus_length; i++)
{
	thisfloor = 3;
	event_user(1);
	draw_text_outline(bonus_x[i], bonus_y[i], bonus[i], thiscolor, 2, c_black);
}
