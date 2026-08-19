if (con == 1)
{
	con += 1;
	chara.y += 20;
	chara.vspeed = -0.75;
	chara.image_speed = 0.2;
	chara.image_index = 1;
}
if (con == 2 && chara.y <= 195)
{
	con += 1;
	alarm[2] = 30;
	chara.depth = -chara.bbox_bottom;
	chara.vspeed = 0;
	chara_stop();
}
else if (con == 4)
{
	global.flag[1] = 0.5;
	writer("event_m6_meet_0", -1, -1);
	con += 1;
}
else if (con == 5 && exists(thiswriter) == 0)
{
	con += 1;
	alarm[2] = 60;
}
else if (con == 7)
{
	con += 1;
	alarm[2] = 60;
	cutout_active = true;
	audio_play(snd_heartpulse1, false, VOLUME_SOUND);
}
else if (con == 9)
{
	global.flag[1] = 0.75;
	writer("event_m6_meet_1", -1, -1);
	con += 1;
}
else if (con == 10 && exists(thiswriter) == true && thiswriter.page == 2 && title_length < 2)
{
	title_active = true;
	title_delay[title_length] -= 1;
	if (title_delay[title_length] <= 0)
	{
		title_length += 1;
		audio_play(snd_writer_m6, false, VOLUME_SOUND,,,, (1 - (0.125 * (title_length - 1))));
		audio_play(snd_impactTitle, false, VOLUME_SOUND);
		shakescreen(2, 2);
		switch (title_length)
		{
			case 1:
			audio_play(snd_voiceFriends, false, VOLUME_SOUND);
			break;
			case 2:
			con += 1;
			alarm[2] = round(60 * 3);
			confetti_active = true;
			audio_play(snd_crowdCheer, false, VOLUME_SOUND);
			audio_play(snd_crowdApplause, false, VOLUME_SOUND);
			break;
		}
	}
}
if (confetti_active == true && global.visualeff == true)
{
	if (confetti_time > 0)
	{
		marker(irandom_range(-10, (room_width + 10)), irandom_range(-5, -35), spr_singlepixel, 1, 2, 2, 0, 0, 0, merge_color(choose(c_red, c_blue, c_lime, c_yellow, c_aqua, c_fuchsia, c_green, c_orange), c_white, 0.5), (-room_height + 1));
		thismarker.vspeed = 1.5;
		thismarker.siner = 0;
		thismarker.sinermult = random_range(0.5, 2.5);
		array_push(confetti_objects, thismarker);
		confetti_time -= 1;
	}
	for (var c = 0; c < array_length(confetti_objects); c++)
	{
		if (exists(confetti_objects[c]) == true && confetti_objects[c].y >= room_height)
		{
			destroy(confetti_objects[c]);
			array_delete(confetti_objects, c, 1);
			if (array_length(confetti_objects) <= 0)
				confetti_active = false;
			break;
		}
	}
}
else if (confetti_active && global.visualeff == false)
	confetti_active = false;
if (con == 12)
{
	title_active = false;
	with (thiswriter)
		event_user(1);
	con += 1;
	alarm[2] = 30;
}
if (con == 14)
{
	cutout_alpha -= (1 / 60);
	if (cutout_alpha <= 0)
	{
		con += 1;
		alarm[2] = 60;
		cutout_active = false;
	}
}
else if (con == 16)
{
	writer("event_m6_meet_2");
	con += 1;
}
