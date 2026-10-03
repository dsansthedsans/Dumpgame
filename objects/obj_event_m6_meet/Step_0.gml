if (con == 1)
{
	chara.y += 20;
	chara.vspeed = -0.75;
	chara.image_speed = 0.2;
	chara.image_index = 1;
	m6.x = (room_width / 2);
	m6.y = 135;
	party_change(0, -1, -1);
	party_facing(0, DOWN);
	party_stop(0);
	con += 1;
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
	audio_play(snd_impactPulse1, false, VOLUME_SOUND);
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
		marker(irandom_range(-10, (room_width + 10)), irandom_range(-5, -35), spr_singlepixel, 1, 2, 2, 0, 0, 0, merge_color(choose(c_red, c_blue, c_lime, global.c_yellow, c_aqua, c_fuchsia, c_green, c_orange), c_white, 0.5), (-room_height + 1));
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
		if (teach_activePage == undefined && string_char_at(thiswriter.msg[thiswriter.page], string_length(thiswriter.msg[thiswriter.page])) == ":")
		{
			teach_active = true;
			teach_activePage = thiswriter.page;
		}
		else if (teach_activePage != undefined)
			teachInfo_length = clamp((thiswriter.page - teach_activePage), 0, 3);
	}
	else
	{
		global.flag[1] = 0.5;
		con += 1;
		alarm[2] = round(60 * 2.5);
		teachBg_alphaTarget = 0;
		for (var i = 0; i < teachInfo_lengthMax; i++)
			teachInfo_alphaTarget[i] = 0;
	}
}
else if (con == 17)
{
	global.flag[2] = 0.125;
	con += 1;
	alarm[2] = round(60 * 2);
}
else if (con == 19)
{
	party_facing(0, LEFT);
	m6.image_speed = (chara.wimgspeed / 2);
	m6.image_index = 1;
	con += 1;
}
else if (con == 20)
{
	m6.x -= (chara.wspeed / 8);
	if (m6.x <= (chara.x - 20))
	{
		party_stop(0);
		m6.x = (chara.x - 20);
		con += 1;
		alarm[2] = round(60 * 2);
	}
}
else if (con == 22)
{
	party_facing(0, -1);
	m6.sprite_index = spr_m6_l_sadTalk;
	con += 1;
	alarm[2] = round(60 * 1.5);
	audio_play(snd_splatBubble, false, VOLUME_SOUND);
}
else if (con == 24)
{
	writer("event_m6_meet_2");
	con += 1;
}
else if (con == 25)
{
	if (exists(thiswriter) == true)
	{
		if (thiswriter.page >= 3)
			party_facing(0, DOWN);
		if (thiswriter.page >= 4)
			global.flag[2] = false;
	}
	else
	{
		global.flag[2] = false;
		m6.image_speed = (chara.wimgspeed / 1);
		m6.image_index = 1;
		con += 1;
	}
}
else if (con == 26)
{
	m6.y += (chara.wspeed / 2);
	m6.depth = -m6.bbox_bottom;
	if (m6.y >= chara.y)
	{
		chara_facing(LEFT);
		party_stop(0);
		m6.y = chara.y;
		con += 1;
		alarm[2] = (60 * 1);
	}
}
else if (con == 28)
{
	party_facing(0, RIGHT);
	writer("event_m6_meet_3");
	con += 1;
}
else if (con == 29) || (con == 30)
{
	if (exists(thiswriter) == true)
	{
		if (con == 29 && thiswriter.page >= 1)
		{
			audio_play(snd_jingleParty, false, VOLUME_SOUND);
			con += 1;
		}
	}
	else
	{
		global.flag[1] = true;
		global.flag[2] = true;
		chara_facing(DOWN);
		chara_change(true, true, true, false, true, true, true);
		party_change(0, 1, LEFT);
		con += 1;
	}
}