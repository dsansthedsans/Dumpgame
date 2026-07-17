
if (global.chara_move == 1 && global.chara_menu == 0 && global.chara_cutscene == 0)
{
	if (global.flag[53] == 0 && con == 0)
	{
		chara = obj_chara;
		global.chara_move = 0;
		global.chara_facing = UP;
		global.chara_cutscene = 1;
		chara.image_speed = chara.rimgspeed;
		chara.image_index = 1;
		
		m6 = global.side[0];
		
		obj_captcha3.stage = 8;
		con = 1;
	}
	else if (global.flag[53] == 1 && con == 0)
		instance_destroy();
}