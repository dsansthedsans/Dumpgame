
if (active == 1)
{
	myscale = 1;
	if (global.inmenu == 1) || (global.inintro == 1) || (global.inbattle == 1) || (global.ingameover == 1)
		myscale = 2;
	border_x = camera_get_view_width(view_camera[0]);
	
	draw_set_font(text_font);
	text_w = string_width(text);
	text_h = string_height(text);
	
	box_xalign = 10;
	box_yalign = 10;
	box_w = ((text_w + (box_xalign * 2)) * myscale);
	box_h = ((text_h + (box_yalign * 2) + box_h_bonus) * myscale);
	box_outw = (4 * myscale);
	
	if (image != 0)
	{
		image_w = (sprite_get_width(image) * myscale);
		image_h = (sprite_get_height(image) * myscale);
		box_w += ((box_xalign * myscale) + image_w);
	}
	
	// box movement
	if (mystage == 0)
	{
		var _targetx = (box_w / myscale);
		box_x = lerp(box_x, _targetx, 0.2);
		if (abs(box_x - _targetx) <= 0.1)
		{
			box_x = _targetx;
			mystage = 1;
		}	
	}
	if (mystage == 1)
	{
		if (mytimer <= 0)
		{
			var _targety = (((box_h + box_outw) / myscale) + myscale);
			box_y += 1;
			if (box_y >= _targety)
				destroy(id);
		}
		else
			mytimer -= 1;
	}
	
	// draw	
	draw_set_alpha(1);
	
	var _box_x1 = (border_x - (box_x * myscale));
	var _box_x2 = (_box_x1 + box_w);
	var _box_y1 = -(box_y * myscale);
	var _box_y2 = (_box_y1 + box_h + (myscale - 1));
	
	var _text_x = (_box_x1 + (box_w / 2));
	var _text_y = (_box_y1 + (box_h / 2));
	
	draw_set_color(c_black);
	draw_rectangle((_box_x1 - box_outw - myscale), _box_y1, _box_x2, (_box_y2 + box_outw + myscale), 0);
	draw_rectangle_outline(_box_x1, _box_y1, _box_x2, _box_y2, c_black, box_outw, box_outcolor);
	
	if (image != 0)
	{
		var _image_x = (_box_x1 + (box_xalign * myscale));
		var _image_y = (_box_y1 + (box_h / 2) - (image_h / 2));
		draw_sprite_ext(image, achievement_id, _image_x, _image_y, myscale, myscale, 0, c_white, 1);
		draw_sprite_ext(image_border, 0, _image_x, _image_y, myscale, myscale, 0, c_white, 1);
	
		_text_x = (_image_x + image_w + (box_xalign * myscale) + ((text_w * myscale) / 2));
	}

	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_transformed(_text_x, _text_y, string_upper(text), myscale, myscale, 0);
}

	/*
	draw_set_font(text_font);
	text_w = string_width(text);
	text_h = string_height(text);
	
	box_origx = 320;
	box_origy = 0;
	box_xalign = 10;
	box_yalign = 10;
	box_w = (text_w + (box_xalign * 2));
	box_h = (text_h + (box_yalign * 2));
	box_outw = 4;
	myscale = 1;
	if (global.inmenu == 1) || (global.inintro == 1) || (global.inbattle == 1) || (global.ingameover == 1)
		myscale = 2;
	
	// box movement
	box_xmove = lerp(box_xmove, box_w, 0.2);
	
	// draw
	draw_set_alpha(1);
	
	var _box_x1 = ((box_origx - box_xmove) * myscale);
	var _box_x2 = (_box_x1 + (box_xmove * myscale));
	var _box_y1 = ((box_origy - box_ymove) * myscale);
	var _box_y2 = (_box_y1 + (box_ymove * myscale));
	//var _box_y1 = (box_y * myscale);
	//var _box_y2 = (((box_y + box_h) * myscale) + (myscale - 1));
	var _box_outw = (box_outw * myscale);
	draw_set_color(c_black);
	draw_rectangle((_box_x1 - _box_outw - (_box_outw / 4)), _box_y1, _box_x2, (_box_y2 + _box_outw + (_box_outw / 4)), 0);
	draw_rectangle_outline(_box_x1, _box_y1, _box_x2, _box_y2, c_black, _box_outw, c_white);
	
	var _text_x = ((box_origx - box_xmove + (box_w / 2)) * myscale);
	var _text_y = (_box_y1 + (box_h * (myscale / 2)));
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_color(text_color);
	draw_set_font(text_font);
	draw_text(_text_x, _text_y, text);
	*/

/*
if (active == 1)
{
	draw_set_alpha(myalpha);

	// box
	draw_set_color(c_black);
	draw_rectangle((box_x - box_border_w - box_outline_w), (box_y - box_border_w - box_outline_w), (box_x + box_w + box_border_w + box_outline_w), (box_y + box_h + box_border_w + box_outline_w), 0);
	draw_rectangle_outline(box_x, box_y, (box_x + box_w), (box_y + box_h), c_black, box_border_w, box_border_color);

	// image
	if (image != 0)
	{
		image_x = (box_x + box_xoff);
		image_y = (box_y + (box_h / 2) - (image_h / 2));
		draw_sprite_ext(image, image_frame, image_x, image_y, myscale, myscale, 0, c_white, 1);
		draw_sprite_ext(image_border, 0, image_x, image_y, myscale, myscale, 0, c_white, 1);
	}

	// text
	text_x = (box_x + (box_w / 2));
	if (image != 0)
		text_x = (image_x + image_w + box_xoff + (text_w / 2));
	text_y = (box_y + (box_h / 2));
	draw_set_font(text_font);
	draw_set_color(text_color);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_transformed(text_x, text_y, text, myscale, myscale, 0);
	
	draw_set_alpha(1);
}
*/