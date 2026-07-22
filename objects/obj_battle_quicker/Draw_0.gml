
// heart move animation
if (heart_move == 1)
{
	heart_x = lerp(heart_x, heart_targetx, 0.15);
	heart_y = lerp(heart_y, heart_targety, 0.15);
	if (nobody == 1)
		heart_alpha = lerp(heart_alpha, 0, 0.15);
	
	chara_color = lerp(chara_color, 0, 0.15);
	chara.image_blend = make_color_rgb(chara_color, chara_color, chara_color);
	
	// heart get to place
	if (abs(heart_x - heart_targetx) <= 0.2 && abs(heart_y - heart_targety) <= 0.2)
	{
		chara.image_blend = c_white;
		room_goto(room_battle);
		heart_move = 0;
	}
}

// set heart position
heart.x = heart_x;
heart.y = heart_y;
heart.image_alpha = heart_alpha;

// draw background
draw_set_alpha(myalpha);
draw_set_color(c_black);
draw_rectangle(-40, -40, (room_width + 40), (room_height + 40), 0);

draw_set_alpha(1);




