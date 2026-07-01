
event_inherited();

if (global.flag[2] == 1 && global.flag[35] == 0)
{
	con = 1;
	alarm[8] = 45;
	chara = obj_chara;
	m6 = obj_party;
	chara_facing(UP);
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	if (instance_exists(m6) == true)
	{
		party_facing(0, UP);
		party_change(0, -1, -1);
	}
}
else
	instance_destroy();


/*
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[2] == 1 && global.flag[35] == 0 && con == 0)
	{
		chara_change(0, 0, 0, 1, 0, 0, 0);
		movetopoint_facing(150, 920, 60, obj_chara, global.chara_facing);
		obj_chara.image_speed = 0.25;
		obj_chara.image_index = 1;
		
		party_stop(0);
		party_change(0, -1, -1);
		movetopoint_facing(170, 920, 60, obj_party, global.party_facing[0]);
		obj_party.image_speed = 0.25;
		obj_party.image_index = 1;
		
		cam_y = obj_GAME_CONTROLLER.cam_y;
		cam_spd = 2;
		cam_targety[0] = 610;
		cam_targety[1] = 740;
		
		aftercon = 1;
		con = 1;
	}
	else if (con == 0)
		instance_destroy();
}
*/