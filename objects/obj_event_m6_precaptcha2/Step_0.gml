
if (con == 1 && exists(m6) == 1)
{
	chara.x -= 10;
	chara.vspeed = -0.75;
	chara.image_speed = 0.2;
	chara.image_index = 1;
	party_facing(0, UP);
	party_change(0, -1, -1);
	m6.x += 10;
	m6.vspeed = -0.75;
	m6.image_speed = 0.2;
	m6.image_index = 1;
	m6.sprite_index = spr_m6_u;
	con = 2;
}
if (con == 2 && chara.y <= 920 && m6.y <= 920)
{
	chara.y = 920;
	chara.vspeed = 0;
	chara_stop();
	m6.y = 920;
	m6.vspeed = 0;
	party_stop(0);
	con = 3;
}
if (altcon == 1)
{
	global.chara_camera_move = false;
	cam_y = obj_GAME_CONTROLLER.cam_y;
	cam_targety[0] = 610;
	cam_targety[1] = 740;
	altcon = 2;
}
if (altcon == 2)
{
	if (cam_y > cam_targety[0])
		cam_y -= 1.5;
	else
	{
		cam_y = cam_targety[0];
		if (con == 3)
		{
			alarm[2] = 30;
			con = 4;
			altcon = -1;
		}
	}
	screenpos(0, cam_y);
}
if (con == 5)
{
	writer("event_m6_precaptcha2", -1, -1);
	con = 6;
}
if (con == 6 && exists(thiswriter) == false)
{
	if (cam_y < cam_targety[1])
		cam_y += 2;
	else
	{
		cam_y = cam_targety[1];
		global.flag[35] = 1;
		chara_facing(DOWN);
		chara_change(1, 1, 1, 0, 1, 1, 1);
		party_change(0, 1, RIGHT);
		destroy(id);
	}
	screenpos(0, cam_y);
}

/*
if (aftercon == 1 && exists(thismover) == 0)
{
	chara_stop();
	chara_facing(UP);
	party_stop(0);
	party_facing(0, UP);
	aftercon = 0;
}
if (con == 1)
{
	screenpos(0, cam_y);
	if (cam_y <= cam_targety[0])
	{
		alarm[2] = 30;
		con = 2;
	}
	else
		cam_y -= cam_spd;
}
if (con == 3)
{
	
}
if (con == 4 && exists(thiswriter) == 0)
{
	screenpos(0, cam_y);
	if (cam_y >= cam_targety[1])
	{
		global.flag[35] = 1;
		chara_facing(DOWN);
		chara_change(1, 1, 1, 0, 1, 1, 1);
		party_change(0, 1, RIGHT);
		destroy(id);
	}
	else
		cam_y += cam_spd;
}
*/