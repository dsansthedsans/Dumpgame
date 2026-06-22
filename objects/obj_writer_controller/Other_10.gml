/// @descr get type

if (msg_format[page] == "textbox") || (msg_format[page] == "textbox_bottom") || (msg_format[page] == "textbox_top")
{
	// get textbox side
	if (msg_format[page] == "textbox" && exists(obj_chara) == 1)
	{
		var _cam = view_camera[0];
		var _camy = camera_get_view_y(_cam);
		var _camh = camera_get_view_height(_cam);
		var _camcenter = (_camy + (_camh / 2));
	
		for (var i = 0; i < 99; i++)
		{
			chara = obj_chara;
			msg_format[i] = "textbox_bottom";
			if ((chara.y - (chara.sprite_height / 2) - 1) > _camcenter)
				msg_format[i] = "textbox_top";
		}
	}
	
	text_x = 30;
	text_y = 170;
	if (msg_format[page] == "textbox_top")
		text_y = 15;
	text_xend = 294;
	text_speed = 2;
	letter_xspace = 8;
	letter_yspace = 18;
	for (var i = 0; i < 2; i++)
		text_color[i] = c_white;

	// get type
	if (msg_type[page] == "intro")
	{
		text_x = 60;
		text_y = 160;
		text_xend = 290;
		text_speed = 4;
		letter_xspace = 9;
	}
	if (msg_type[page] == "savepoint")
	{
		text_x = 68;
		text_y = 68;
		letter_yspace = 20.5;
	}
	
	if (msg_type[page] == "notawake")
		text_y = 120;
	
	if (msg_type[page] == "endingreal")
	{
		textbox_color = c_red;
		for (var i = 0; i < 2; i++)
			text_color[i] = c_red;
	}

	// change text_x if there's face
	if (msg_face[page] > -1)
		text_x = (16 + 11 + sprite_get_width(msg_face[page]) + 8);
	
	// change position based on font
	if (msg_font[page] == global.fnt_dsans)
	{
		text_x -= 2;
		text_y += 2;
	}
}
if (msg_format[page] == "battlebox")
{	
	depth = -1500;
	text_x = (controller.box_x - (controller.box_w / 2) - controller.box_borderw + 20);
	text_y = (controller.box_y - (controller.box_h / 2) - controller.box_borderw + 20.5);
	text_xend = (controller.box_x + (controller.box_w / 2) - 16);
	text_speed = 2;
	letter_xspace = 16;
	letter_yspace = 32;
	for (var i = 0; i < 2; i++)
		text_color[i] = c_white;
		
	// get type
	if (msg_type[page] == "nobody")
	{
		letter_xspace = 8;
	}	
		
	// change text_x if there's face
	if (msg_face[page] > -1)
		text_x += ((sprite_get_width(msg_face[page]) * 2) + 8);
}
if (msg_format[page] == "bubble")
{
	text_x = bubble_x;
	text_y = bubble_y;
	text_xend = 0;
	text_speed = 2;
	bubble_spr = spr_writer_bubble1; // normal
	letter_xspace = 10;
	letter_yspace = 20;
	for (var i = 0; i < 2; i++)
		text_color[i] = c_black;
		
	// get type
	if (msg_type[page] == 2) // normal big
		bubble_spr = spr_writer_bubble2;
	else if (msg_type[page] == 3) // top
		bubble_spr = spr_writer_bubble3;
	else if (msg_type[page] == 4) // top big
		bubble_spr = spr_writer_bubble4;
		
	if (bubble_spr == spr_writer_bubble1)
	{
		text_x += 38;
		text_y -= 42;
	}
	else if (bubble_spr == spr_writer_bubble2)
	{
		text_x += 23;
		text_y -= 72;	
	}
	else if (bubble_spr == spr_writer_bubble3) || (bubble_spr == spr_writer_bubble4)
	{
		if (bubble_spr == spr_writer_bubble3)
		{
			text_x -= 54;
			text_y -= 80;
		}
		else
		{
			text_x -= 84;
			text_y -= 100;
		}
		text_xend = (bubble_x + (sprite_get_width(bubble_spr) / 2) - 10);
	}
	
	//if (msg_font[page] == global.fnt_comicsans) cabeça vazia
	//	text_x -= 5;
	
	if (text_xend == 0)
		text_xend = (bubble_x + sprite_get_width(bubble_spr) - 10);
}

orig_text_x = text_x;
orig_text_y = text_y;
orig_text_color = text_color[0];
orig_letter_xspace = letter_xspace;
