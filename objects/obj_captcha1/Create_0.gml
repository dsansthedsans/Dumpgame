
depth = 0;
image_alpha = 0;
mywrite = "";
buttons_press = 1;

myscreen = 0;
myscreen_x = 80;
myscreen_y = 60;
if (room == room_corridors_5_B)
	myscreen_x = 120;
myscreen_write_x = (myscreen_x + 80);
myscreen_write_y = (myscreen_y + 9.5);
myscreen_write_color[0] = c_white;
myscreen_write_color[1] = c_grey;

victory = 0;
victory_delay = 0;


// get word
if (room == room_corridors_5_A)
{
	myword = choose(get_text("room_captcha1_0"), get_text("room_captcha1_1"), get_text("room_captcha1_2"), get_text("room_captcha1_3"));
	if (global.flag[9] == "")
		global.flag[9] = myword;
	else	
		myword = global.flag[9];

	if (myword == get_text("room_captcha1_0"))
		myscreen = 0;
	if (myword == get_text("room_captcha1_1"))
		myscreen = 1;
	if (myword == get_text("room_captcha1_2"))
		myscreen = 2;
	if (myword == get_text("room_captcha1_3"))
		myscreen = 3;
	if (global.lang == "pt")
		myscreen += 4;
}
else
{
	myword = "TROLLFACE";
	if (global.flag[12] == "")
		global.flag[12] = myword;
	else	
		myword = global.flag[12];
	myscreen = 8;
}	
	
	
// get way
myway = choose(0, 1);
if (room == room_corridors_5_A)
{
	if (global.flag[10] == -1)
		global.flag[10] = myway;
	else
		myway = global.flag[10];
}
else
{
	if (global.flag[13] == -1)
		global.flag[13] = myway;
	else
		myway = global.flag[13];
}


// set each button's letter and create buttons
for (var w = 0; w < 3; w++)
{	
	for (var h = 0; h < 3; h++)
	{
		// get each letter
		myletter[w, h] = "";
		
		if (myway == 0 && w == 0)
		{
			if (h == 0)
				myletter[w, h] = string_char_at(myword, 1);
			if (h == 1)
				myletter[w, h] = string_char_at(myword, 6);
			if (h == 2)
				myletter[w, h] = string_char_at(myword, 7);
		}
		if (myway == 0 && w == 1)
		{
			if (h == 0)
				myletter[w, h] = string_char_at(myword, 2);
			if (h == 1)
				myletter[w, h] = string_char_at(myword, 5);
			if (h == 2)
				myletter[w, h] = string_char_at(myword, 8);
		}
		if (myway == 0 && w == 2)
		{
			if (h == 0)
				myletter[w, h] = string_char_at(myword, 3);
			if (h == 1)
				myletter[w, h] = string_char_at(myword, 4);
			if (h == 2)
				myletter[w, h] = string_char_at(myword, 9);
		}
		
		if (myway == 1 && h == 0)
		{
			if (w == 0)
				myletter[w, h] = string_char_at(myword, 1);
			if (w == 1)
				myletter[w, h] = string_char_at(myword, 6);
			if (w == 2)
				myletter[w, h] = string_char_at(myword, 7);
		}
		if (myway == 1 && h == 1)
		{
			if (w == 0)
				myletter[w, h] = string_char_at(myword, 2);
			if (w == 1)
				myletter[w, h] = string_char_at(myword, 5);
			if (w == 2)
				myletter[w, h] = string_char_at(myword, 8);
		}
		if (myway == 1 && h == 2)
		{
			if (w == 0)
				myletter[w, h] = string_char_at(myword, 3);
			if (w == 1)
				myletter[w, h] = string_char_at(myword, 4);
			if (w == 2)
				myletter[w, h] = string_char_at(myword, 9);
		}
		
		// create buttons
		mybutton_basex = 90;
		if (room == room_corridors_5_B)
			mybutton_basex = 130;
		mybutton_basey = 102;
		
		mybutton_x[w] = (mybutton_basex + (20 * w));
		mybutton_y[h] = (mybutton_basey + (15 * h));
		mybutton_obj[w, h] = instance_create_layer(mybutton_x[w], mybutton_y[h], "Instances", obj_overworld_nonsolid);
		mybutton_pressed[w, h] = 0;
		with (mybutton_obj[w, h])
		{
			depth = (50 - (h * (w + 1)));
			image_angle = 0;
			image_speed = 0;
			image_index = 0;
			image_alpha = 1;
			image_xscale = 1;
			image_yscale = 1;
			sprite_index = spr_overworld_captcha_button;
			parent = obj_captcha1;
		}
	}
}


// create reset button
resetbutton_x = 170;
if (room == room_corridors_5_B)
	resetbutton_x = 210;
resetbutton_y = (mybutton_basey + 15);
resetbutton_obj = instance_create_layer(resetbutton_x, resetbutton_y, "Instances", obj_overworld_nonsolid);
resetbutton_pressed = 0;
with (resetbutton_obj)
{
	depth = 50;
	image_angle = 0;
	image_speed = 0;
	image_index = 2;
	image_alpha = 1;
	image_xscale = 1;
	image_yscale = 1;
	sprite_index = spr_overworld_captcha_button;
	parent = obj_captcha1;
}


// already completed
if (room == room_corridors_5_A && global.flag[11] == 1) || (room == room_corridors_5_B && global.flag[14] == 1)
{
	victory = 1;
	mywrite = myword;
	buttons_press = 0;
}

victorysound = -1;
victorypitch = 0.75;
peachy = 0;