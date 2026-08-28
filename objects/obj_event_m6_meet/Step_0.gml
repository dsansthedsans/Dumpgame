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
	global.flag[1] = 0.5;
	var _DEBUG_SKIP = true;
	if (DEBUG_SKIP == false) || (DEBUG_SKIP == true && _DEBUG_SKIP == false)
	{
		con = 6;
		alarm[2] = round(60 * 1);
	}
	else
	{
		con = 13;
		alarm[2] = 1;
	}
	chara.depth = -chara.bbox_bottom;
	chara.vspeed = 0;
	chara_stop();
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
	writer("event_m6_meet_0", -1, -1);
	con += 1;
}
else if (con == 10 && exists(thiswriter) == true && thiswriter.page == 2)
{
	if (title_active == false)
		title_active = true;
	title_delay[title_length] -= 1;
	if (title_delay[title_length] <= 0)
	{
		title_length += 1;
		switch (title_length)
		{
			case 1:
			audio_play(snd_impactTitle, false, VOLUME_SOUND);
			audio_play(snd_voiceFriends, false, VOLUME_SOUND);
			shakescreen(2, 2);
			break;
			case 2:
			con += 1;
			alarm[2] = round(60 * 2.5);
			confetti_active = global.visualeff;
			audio_play(snd_impactTitle, false, VOLUME_SOUND);
			audio_play(snd_crowdCheer, false, VOLUME_SOUND);
			audio_play(snd_crowdApplause, false, VOLUME_SOUND);
			shakescreen(2, 2);
			break;
		}
	}
}
if (confetti_active == true)
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
if (con == 12)
{
	with (thiswriter)
		event_user(1);
	con += 1;
	alarm[2] = round(60 * 1.5);
	title_active = false;
	cutout_alphaTarget = 0;
}
else if (con == 14)
{
	global.flag[1] = 0.75;
	writer("event_m6_meet_1");
	con += 1;
}
else if (con == 15)
{
	if (exists(thiswriter) == true)
	{
		if (thiswriter.page >= 4)
		{
			teach_active = true;
			teachInfo_length = clamp((thiswriter.page - 4), 0, 3);
		}
	}
	else
	{
		con += 1;
		alarm[2] = 120;
		teachBg_alphaTarget = 0;
		for (var i = 0; i < teachInfo_lengthMax; i++)
			teachInfo_alphaTarget[i] = 0;
	}
}
else if (con == 17)
{
	con += 1;
	m6.sprite_index = spr_m6_l_neutral;
	m6.image_speed = (chara.wimgspeed / 2);
	m6.image_index = 1;
}
else if (con == 18)
{
	m6.x -= (chara.wspeed / 4);
	if (m6.x <= 120)
	{
		con += 1;
		alarm[2] = 60;
		m6.sprite_index = spr_m6_l_neutralTalk;
		m6.image_speed = 0;
		m6.image_index = 0;
	}
}
else if (con == 20)
{
	writer("event_m6_meet_2");
	con += 1;
}
else if (con == 21)
{
	if (exists(thiswriter) == true)
	{
		if (thiswriter.page >= 3)
			m6.sprite_index = spr_m6_d_neutralTalk;
	}
	else
	{
		con += 1;
		m6.sprite_index = spr_m6_l_neutralTalk;
	}
}