if (global.flag[2] == true && global.flag[4] == false && global.flag[6] == false && global.flag[7] == false)
{
	if (con == 1 && exists(m6) == 1)
	{
		chara.x -= 10;
		chara.vspeed = -0.75;
		chara.image_speed = 0.2;
		chara.image_index = 1;
		party_change(0, -1, -1);
		party_facing(0, UP);
		m6.x += 10;
		m6.vspeed = -0.75;
		m6.image_speed = 0.2;
		m6.image_index = 1;
		m6.sprite_index = spr_m6_u;
		con += 1;
	}
	if (con == 2 && chara.y <= 190 && m6.y <= 190)
	{
		chara.vspeed = 0;
		chara_stop();
		m6.vspeed = 0;
		party_stop(0);
		alarm[2] = 30;
		con += 1;
	}
	if (con == 4)
	{
		writer("event_m6_predummy_0", -1, -1);
		con += 1;
	}
	if (con == 5 && instance_exists(thiswriter) == 0)
	{
		global.flag[4] = 1;
		chara_facing(DOWN);
		chara_change(1, 1, 1, 0, 1, 1, 1);
		party_change(0, 1, RIGHT)
		destroy(id);
	}
}
else if (global.flag[2] == true && global.flag[4] == true && global.flag[6] == true && global.flag[7] < 1)
{
	if (con == 1 && exists(m6) == true)
	{
		con += 1;
		alarm[2] = 60;
		chara.x = (160 - 10);
		chara.y = 190;
		chara_facing(UP);
		party_change(0, -1, -1);
		party_facing(0, UP);
		m6.x = (160 + 10);
		m6.y = 190;
	}
	else if (con == 3)
	{
		writer($"event_m6_predummy_1_{global.flag[5]}");
		con += 1;
	}
	else if (con == 4 && exists(thiswriter) == false)
	{
		con += 1;
		alarm[2] = 60;
	}
	else if (con == 6)
	{
		global.flag[7] = 0.5;
		con += 1;
		alarm[2] = 30;
		shakescreen(4, 4);
		audio_play(snd_impactBluh, false, VOLUME_SOUND);
	}
	else if (con == 8)
	{
		global.flag[7] = 1;
		chara_facing(DOWN);
		chara_change(-1, true, true, false, true, true, true);
		party_change(0, 1, RIGHT);
		con += 1;
	}
}


















