
if (global.chara_move == 1 && global.chara_cutscene == 0 && con == 0)
{
	game = obj_GAME_CONTROLLER;
	chara = obj_chara;
	characolorvalue = 255;
	if (global.flag[2] == 1)
		m6 = global.party[0];
	
	bullet_length = 6;
	
	bullet_time[0] = 32;
	bullet_time[1] = 48;
	bullet_time[2] = 32;
	bullet_delay[0] = 16;
	bullet_delay[1] = 0;
	bullet_delay[2] = 0;
	bullet_format[0] = 0;
	bullet_format[1] = 0;
	bullet_format[2] = 0;
	
	eyes_jumpsnd = -1;
	eyes_sprite = spr_gabee_eyes_appear;
	eyes_index = 0;
	eyes_alpha = 1;
	eyes_y = 100;
	jumpsnd = 0;
	
	gate =
	{
		active : false,
		sprite : spr_overworld_sidegate,
		x : 305,
		y : 220,
		height : 0,
		heightMax : 101,
		heightTime : 30,
		object : undefined,
	}
	
	/* debug
	chara.x = 720;
	chara.y = 200;
	m6.x = 670;
	m6.y = 200;
	global.flag[59] = true;
	*/
	
	if (global.flag[59] == false)
	{
		chara_facing(RIGHT)
		chara_change(-1, false, false, true, false, false, true);
		movetopoint(310, 195, 60, chara);
		chara_mover = thismover;
		chara.image_speed = 0.25;
		
		party_facing(0, RIGHT)
		party_change(0, -1, -1);
		movetopoint(310, 215, 60, m6);
		m6_mover = thismover;
		m6.image_speed = 0.25;
		
		con = 1;
	}
	else if (global.flag[60] == false)
		con = 5;
	else
		destroy(id);
}