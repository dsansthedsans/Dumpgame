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
if (myid == "brockwin")
{
	achievement_id = ACHIEVEMENT_BROCKWIN;
	mytype = 0;
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
//else if (mytype == 1) // message
//	audio_play(snd_notification_message, 0, VOLUME_SOUND);	
//else
//{
//	global.notification[myself] = 0;
//	instance_destroy();
//}