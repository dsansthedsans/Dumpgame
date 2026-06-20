
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[2] == 1 && global.flag[4] == 0 && global.flag[6] == 0 && global.flag[7] == 0 && con == 0)
	{
		chara_change(-1, 0, 0, 1, 0, 0, 1);
		chara_facing(UP);
		chara_stop();
		chara = obj_chara;
		chara.image_speed = 0.25;
		chara_targetx = 150;
		chara_targety = 190;
		movetopoint(chara_targetx, chara_targety, 45, chara);
		/*
		global.chara_move = 0;
		global.chara_cutscene = 1;
		global.chara_facing = UP;
		*/
		
		party_change(0, -1, -1);
		party_facing(0, UP);
		m6 = global.party[0];
		m6.image_speed = 0.25;
		m6_targetx = 170;
		m6_targety = chara_targety;
		movetopoint(m6_targetx, m6_targety, 45, m6);
		/*
		party_change(0, 0, 0, -1, -1);
		party_facing(0, UP);
		party_stop(0);
		m6 = global.party[0];//global.side[0];
		m6.image_speed = 0.25;
		movetopoint(170, 190, 45, m6);
		*/
		/*
		side_change(0, 0, 0, -1, -1);
		side_stop(0);
		global.side_facing[0] = UP;
		*/
		
		con = 1;
	}
	else if (con == 0)
		destroy(id);
}