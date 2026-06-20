
if (global.chara_move == 1 && global.chara_menu == 0 && global.chara_cutscene == 0 && con == 0)
{
	chara = obj_chara;
	if (global.flag[2] == 1)
		m6 = global.side[0];
	bullet_delay[0] = 30;
	bullet_delay[1] = 0;
	bullet_length = 6;
	bullet_format = 0;
	eyes_sprite = spr_gabee_eyes_appear;
	eyes_index = 0;
	eyes_alpha = 1;
	eyes_y = 100;
	
	if (global.flag[59] == 0)
	{
		global.chara_move = 0;
		global.chara_facing = RIGHT;
		global.chara_cutscene = 1;
		movetopoint(309, 195, 60, chara);
		chara_mover = thismover;
		chara.image_speed = 0.25;
		
		side_change(0, 0, 0, -1, -1);
		global.side_facing[0] = RIGHT;
		movetopoint(310, 215, 60, m6);
		m6_mover = thismover;
		m6.image_speed = 0.25;
		
		con = 1;
	}
	else if (global.flag[60] == 0)
		con = 5;
	else if (global.flag[60] == 1)
	{
		if (global.indebug == 0)
			destroy(id);
		else
		{
			con = 41;
			bullet_delay[0] = 0;
			global.indebug = 0;
			global.chara_openmenu = 0;
			global.chara_canpause = 0;
			global.chara_hpmenu = 1;
			create(-20, -20, obj_overworld_heart);
		}
	}
}

/*
if (global.chara_move == 1 && global.chara_menu == 0 && global.chara_cutscene == 0)
{
	if (con == 0)
	{
		chara = obj_chara;
		if (global.flag[2] == 1)
			m6 = global.side[0];
		bullet_delay = 0;
		bullet_length = 6;
		bullet_format = 0;
	}
	
	if (global.flag[59] == 0 && con == 0)
	{
		global.chara_move = 0;
		global.chara_facing = RIGHT;
		global.chara_cutscene = 1;
		movetopoint(309, 195, 60, chara);
		chara_mover = thismover;
		chara.image_speed = 0.25;
		
		side_change(0, 0, 0, -1, -1);
		global.side_facing[0] = RIGHT;
		movetopoint(310, 215, 60, m6);
		m6_mover = thismover;
		m6.image_speed = 0.25;
		
		con = 1;
	}
	else if (con == 0 && global.flag[60] == 0)
		con = 5;
	else if (con == 0 && global.flag[60] == 1)
	{
		if (global.indebug == 0)
			destroy(id);
		else
		{
			con = 41;
			global.chara_openmenu = 0;
			global.chara_canpause = 0;
			global.chara_hpmenu = 1;
			create(-20, -20, obj_overworld_heart);
			bullet_delay = 60;
		}
	}
}
*/