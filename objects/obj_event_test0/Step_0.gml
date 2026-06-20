
if (con == 1)
{
	mus_volume(global.music[MUSIC_AMBIENCE], 0, 1);
	alarm[2] = 60;
	con = 2;
}
if (con == 3)
{
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + 1, camera_get_view_y(view_camera[0]));
	
	if (camera_get_view_x(view_camera[0]) >= 200)
	{
		alarm[2] = 60;
		con = 4;
	}
}
if (con == 5)
{
	create_writer("event_test0.0", -1)
	con = 6;
}
if (con == 6 && instance_exists(obj_writer) == 0)
{
	alarm[2] = 60;
	con = 7;
}
if (con == 8 && instance_exists(obj_writer) == 0)
{
	thismarker.sprite_index = obj_chara.sprite_u;
	alarm[2] = 60;
	con = 9;
}
if (con == 10)
{
	thismarker.sprite_index = obj_chara.sprite_l;
	alarm[2] = 75;
	con = 11;
}
if (con == 12)
{
	create_writer("event_test0.1", -1)
	con = 13;
}
if (con == 13)
{
	if (instance_exists(obj_writer) == 1)
	{
		if (obj_writer.mypage == 7) || (obj_writer.mypage == 12)
		{
			thismarker.sprite_index = obj_chara.sprite_u;
			audio_stop(unused_mus_event_test0);
		}
		else
		{
			thismarker.sprite_index = obj_chara.sprite_l;
			
			if (obj_writer.mypage == 8 && audio_playing(unused_mus_event_test0) == 0)
				music_organize();
			if (obj_writer.mypage == 9)
				audio_sound_pitch(unused_mus_event_test0, 1.2);
			if (obj_writer.mypage == 10)
				audio_sound_pitch(unused_mus_event_test0, 1.4);
			if (obj_writer.mypage == 11)
				audio_sound_pitch(unused_mus_event_test0, 1.6);
		}
	}
	else
	{
		con = 14;
		alarm[2] = 45;	
	}
}
if (con == 15)
{
	create_writer("event_test0.2", -1)	
	music_organize();
	thismarker.sprite_index = obj_chara.sprite_l;
	targetx = thismarker.x;
	orig_targetx = targetx;
	con = 16;
}
if (con == 16)
{
	if (instance_exists(obj_writer) == 1)
	{
		var _p = obj_writer.mypage;
		
		if (_p < 9)
			targetx = (orig_targetx - ((_p + 1) * 17));
		if (_p >= 10)
		{
			siner += 0.1;
			targetx = orig_targetx;
		}
		
		hspeed = sin(siner) * 12;
		thismarker.x = lerp(thismarker.x, targetx + hspeed, 0.15);		
	}
	else
	{
		global.battle_nextgroup = -1;
		audio_stop(unused_mus_event_test1);
		battle();
		con = 999;
	}
}

/*
if (con == 13 && instance_exists(obj_writer) == 0)
{
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - 1, camera_get_view_y(view_camera[0]));
	
	if (camera_get_view_x(view_camera[0]) <= (obj_chara.x - 160))
	{
		global.chara_move = 1;
		global.chara_facing = 3;
		global.chara_cutscene = 0;
		instance_destroy(thismarker);
		instance_destroy();
	}
}
*/