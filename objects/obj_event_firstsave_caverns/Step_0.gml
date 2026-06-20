
if (con == 1) || (con == 1.5)
{
	if (con == 1)
		chara.y += 40;
	con = 1.5;
	chara.y -= chara.wspeed;
	chara.image_speed = chara.wimgspeed;
	if (chara.y <= 370)
	{
		global.chara_cameramove = 0;
		cam_y = obj_GAME_CONTROLLER.cam_y;
		orig_cam_y = cam_y;
		chara_stop();
		alarm[2] = 60;
		con = 2;
	}
}
if (con == 3)
{
	screenpos(obj_GAME_CONTROLLER.cam_x, cam_y);
	
	if (cam_y <= (orig_cam_y - 120))
	{
		alarm[2] = 60;
		con = 4;
	}
	else
		cam_y -= (chara.wspeed / 2);
}
if (con == 5)
{
	screenpos(obj_GAME_CONTROLLER.cam_x, cam_y);
	
	if (cam_y >= (chara.y - (chara.sprite_height / 2) - 120))
	{
		global.chara_move = 1;
		global.chara_facing = DOWN;
		global.chara_cutscene = 0;
		global.chara_cameramove = 1;
		global.flag[63] = 1;
		destroy(id);
	}
	else
		cam_y += (chara.wspeed / 2);
}







