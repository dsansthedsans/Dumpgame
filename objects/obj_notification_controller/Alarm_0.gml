/// @descr start

active = 1;
mytype = 0;
mystage = 0;
mytimer = 120;
mycolor = c_white;
achievement_id = -1;
achievement_snd = snd_notification_achievement;

// set basics
text = "Salenis";
text_font = fnt_mars_6;

box_x = 0;
box_y = 0;
box_h_bonus = 0;
box_outcolor = c_white;

image = 0;
image_frame = -1;
image_border = 0;

// get custom
if (myid == "test0")
{
	achievement_id = ACHIEVEMENT_M6TOY;
	mytype = 0;
}

if (myid == "m6toy")
{
	achievement_id = ACHIEVEMENT_M6TOY;
	mytype = 0;
}
if (myid == "sbhelmet")
{
	achievement_id = ACHIEVEMENT_SBHELMET;
	mytype = 0;
}
if (myid == "monstninja")
{
	achievement_id = ACHIEVEMENT_MONSTNINJA;
	mytype = 0;
}
if (myid == "bcwin")
{
	achievement_id = ACHIEVEMENT_BCWIN;
	mytype = 0;
	
	if (global.chara_murder >= 2)
		achievement_snd = -1;
}
if (myid == "puzzlemaster")
{
	achievement_id = ACHIEVEMENT_PUZZLEMASTER;
	mytype = 0;
}
if (myid == "notrealone")
{
	achievement_id = ACHIEVEMENT_NOTREALONE;
	mytype = 0;
}
if (myid == "restart")
{
	achievement_id = ACHIEVEMENT_RESTART;
	mytype = 0;
}

// get info based on type
if (mytype == 0 && achievement_id != -1) // achievement
{
	text = global.achievement_name[achievement_id];
	
	image = spr_achievement_image;
	image_border = spr_achievement_border;
	
	box_h_bonus = 5;
	
	box_outcolor = c_yellow;
	if (achievement_snd != -1)
		audio_play(achievement_snd, 0, VOLUME_SOUND);
}
else if (mytype == 1) // message
	audio_play(snd_notification_message, 0, VOLUME_SOUND);	
else
{
	global.notification[myself] = 0;
	instance_destroy();
}

/*
// set text info
text_font = fnt_mars_6;
draw_set_font(text_font);
text_w = string_width(text);
text_h = string_height(text);

// get image info
image_w = 0;
image_h = 0;
if (image != 0)
{
	image_w = (sprite_get_width(image) * myscale);	
	image_h = (sprite_get_height(image) * myscale);
}

// set box info
box_xoff = (10 * myscale);
box_yoff = (10 * myscale);
box_x = camera_get_view_width(view_camera[0]);
box_y = 0;
box_w = (text_w + (box_xoff * 2));
if (image != 0)
	box_w = (text_w + (box_xoff * 3) + image_w);
box_w *= myscale;
box_h = ((text_h + (box_yoff * 2) + box_h_bonus) * myscale);
box_border_w = (2 * myscale);
box_outline_w = ((!(myscale - 1) + 1) / 2);
orig_box_x = box_x;

var _bonusy = 0;
for (var i = 0; i < 10; i++)
{
	if (global.notification[i] != 0 && i != myself && global.notification[i].active == 1)
		_bonusy += (global.notification[i].box_h);
}
box_y += _bonusy;
*/





