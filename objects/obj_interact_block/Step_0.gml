if (result >= 0 && result < 1) || (result == 4) // writer
{
	if (con == 1)
	{
		if (result == 0.1) // save
			chara_hp(99);
		if (result == 4)
		{
			sprite_index = spr_npc_trashguy;
			audio_play(snd_bump, 0, VOLUME_SOUND);
			shakeobj_small();
			chara_change(-1, 0, 0, 1, 0, 0, -1);
		}
		writer(text, -1, -1);
		con = 2;
	}
	else if (con == 2 && exists(thiswriter) == 0)
	{
		if (result != 4)
		{
			chara_change(-1, 1, 1, -1, 1, 1, -1);
			alarm[2] = 4;
			con = 3;
		}
		else
		{
			con = 5;
			x += 9;
			sprite_index = spr_npc_trashguy_closedfall;
			audio_play(snd_bump, 0, VOLUME_SOUND);
			shakeobj_small();
			alarm[2] = 60;
			angle_amt = 1;
		}
	}
	else if (con == 4)
		con = 0;
	else if (con == 6)
	{
		image_angle -= angle_amt;
		angle_amt += 0.1;
		if (image_angle <= -90)
		{
			image_angle = 0;
			sprite_index = spr_npc_trashguy_closedroll;
			audio_play(snd_screenshake, 0, VOLUME_SOUND);
			shakescreen(3, 3);
			con = 7;
			alarm[2] = 80;
		}
	}
	else if (con == 8)
	{	
		depth = -bbox_bottom;
		vspeed += 0.02;
		if (image_speed == 0)
			image_speed = 0.09;
		image_speed += 0.01;
		if (speed >= 3)
		{
			speed = 3;
			image_speed = 1.5;
			if (y >= (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 20))
			{
				con = 0;
				chara_change(-1, 1, 1, 0, 1, 1, 1);
			}
		}
	}
	//NOTIFICATION MONSTER NINJA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	//if (myinteract == 2 && myresult == 4 && exists(thiswriter) == 0) // trashguy roll
	//{
	//	middle_delay -= 1;
	
	//	if (middle_stage == 0)
	//	{
	//		x += 9;
	//		sprite_index = spr_npc_trashguy_closedfall;
	//		audio_play(snd_bump, 0, 0);
	//		shakeobj_small();
	//		middle_delay = 60;
	//		middle_stage = 1;
	//		angle_amt = 1;
	//	}
	//	if (middle_stage == 1 && middle_delay <= 0)
	//	{
	//		image_angle -= angle_amt;
	//		angle_amt += 0.1;
	//		if (image_angle <= -90)
	//		{
	//			image_angle = 0;
	//			sprite_index = spr_npc_trashguy_closedroll;
	//			audio_play(snd_screenshake, 0, 0);
	//			shakescreen(3, 3);
	//			middle_delay = 80;
	//			middle_stage = 2;
	//		}
	//	}
	//	if (middle_stage == 2 && middle_delay <= 0)
	//	{
	//		depth = -bbox_bottom;
	//		vspeed += 0.02;
	//		if (image_speed == 0)
	//			image_speed = 0.09;
	//		image_speed += 0.01;
	//		if (speed >= 3)
	//		{
	//			speed = 3;
	//			image_speed = 1.5;
	//			var _cambottomy = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]));
	//			if (y >= (_cambottomy + 20))
	//			{
	//				mydelay = 0;
	//				myinteract = 0;
	//				global.chara_cutscene = 0;
	//				global.chara_facing = DOWN;
	//				chara.move = 1;
	//			}
	//		}
	////	}
	//}
}
else if (result == 1) // Bench
{
	if (con == 1)
	{
		chara = obj_chara;
		chara_oldx = chara.x;
		chara_oldy = chara.y;
		chara_oldfacing = global.chara_facing;
		chara.x = (x + (sprite_width / 2));
		chara.y = (y + 10);
		chara.depth = -chara.bbox_bottom - 20;
		chara.xscale = 0.75;
		chara.yscale = 0.5;
		chara_facing(SIT);
		chara_change(-1, 0, 0, 1, 0, 0, 1);
		if (global.flag[2] == 1)
		{
			party_stop(0);
			party_change(0, -1, -1);
			m6 = global.party[0];
			m6_oldx = m6.x;
			m6_oldy = m6.y;
			m6_oldsprite = m6.sprite_index;
			m6.x = (x + (sprite_width / 2) - 11);
			m6.y = (y + 10);
			m6.depth = -m6.bbox_bottom - 20;
			m6.sprite_index = spr_m6_sit;
			m6.xscale = 0.75;
			m6.yscale = 0.5;
			chara.x += 11;
		}
		audio_play(snd_splat, 0, VOLUME_SOUND);
		alarm[2] = 30;
		con = 2;
	}
	else if (con == 3)
	{
		if (key("left_hold") || key("right_hold") || key("up_hold") || key("down_hold") || key("shift_press"))
		{
			chara.x = chara_oldx;
			chara.y = chara_oldy;
			chara.depth = -chara.bbox_bottom;
			chara.image_index = 0;
			chara.xscale = 0.75;
			chara.yscale = 0.5;
			chara_facing(chara_oldfacing);
			chara_change(-1, 1, 1, 0, 1, 1, 1);
			if (global.flag[2] == 1)
			{
				m6.x = m6_oldx;
				m6.y = m6_oldy;
				m6.sprite_index = m6_oldsprite;
				m6.depth = -m6.bbox_bottom;
				m6.xscale = 0.75;
				m6.yscale = 0.5;
				party_change(0, 0, -1);
			}
			audio_play(snd_splat_reversed, 0, VOLUME_SOUND);
			con = 0;
		}
	}
}
else if (result == 3) // mouse hole
{
	if (con == 1)
	{
		var _audio = choose(snd_npc_rat_0a, snd_npc_rat_1e, snd_npc_rat_2o);
		if (audio_playing(_audio) == 0 && global.chara_murder < 2)
			audio_play(_audio, 0, VOLUME_SOUND, , , , 2);
		chara_change(-1, 1, 1, -1, 1, 1, 1);
		con = 0;
	}
}
else if (result == 2) // moveble
{
	if (con == 1)
	{
		myfacing = global.chara_facing;
		if (myfacing == LEFT)
			mytargetx = (x - mydist);	
		if (myfacing == RIGHT)
			mytargetx = (x + mydist);	
		if (myfacing == UP)
			mytargety = (y - mydist);	
		if (myfacing == DOWN)
			mytargety = (y + mydist);
		var i = 0;
		xx = x;
		yy = y;
		touched = 0;
		while (i < 20)
		{
			if (mytargetx != -1)
			{
				var _amt = -1;
				if (myfacing == RIGHT)
					_amt = 1;
				xx += _amt;
			}
			else
			{
				var _amt = -1;
				if (myfacing == DOWN)
					_amt = 1;
				yy += _amt;
			}
			if (place_meeting(xx, yy, obj_solid_block_moveable) == 1)
				touched = 1;
			i += 1;
		}
		if (canmove == 0) || (touched == 1)//(mytargetx != -1 && place_meeting(mytargetx, y, obj_solid_block_moveable) == 1) || (mytargety != -1 && place_meeting(x, mytargety, obj_solid_block_moveable) == 1)
		{
			con = 0;
			mytargetx = -1;
			mytargety = -1;
			chara_change(-1, 1, 1, -1, true, true, -1);
		}
		else
		{
			audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
			chara_change(-1, 0, 0, -1, false, false, -1)
			con = 2;
		}
	}
	if (con == 2)
	{
		if (mytargetx != -1)
		{
			x = lerp(x, mytargetx, myspeed);
			depth = -bbox_bottom;
		}
		else if (mytargety != -1)
		{
			y = lerp(y, mytargety, myspeed);
			depth = -bbox_bottom;
		}
		if (mytargetx != -1 && (round(x) == mytargetx || floor(x) == mytargetx)) || (mytargety != -1 && (round(y) == mytargety || floor(y) == mytargety))
		{
			if (mytargetx != -1)
				x = mytargetx;
			else if (mytargety != -1)
				y = mytargety;
			if (room == room_corridors_9)
			{
				global.flag[xflagid] = x;
				global.flag[yflagid] = y;
			}
			chara_change(-1, 1, 1, -1, true, true, -1);
			myfacing = -1;
			mytargetx = -1;
			mytargety = -1;
			con = 0;
		}	
	}
}
else if (result == 5) // itemDropoed
{
	if (con == 1)
	{
		debug($"--- itemDropped[itemDropped_arrayPos] = {global.itemDropped[itemDropped_arrayPos]} | struct_names_count(global.itemDropped[itemDropped_arrayPos]) = {struct_names_count(global.itemDropped[itemDropped_arrayPos])}");
		if (global.item[global.item_last] == -1 && struct_names_count(global.itemDropped[itemDropped_arrayPos]) > 0)
		{
			global.item[global.item_last] = global.itemDropped[itemDropped_arrayPos].item;
			global.itemDropped[itemDropped_arrayPos] = {};
			writer("itemDropped_pickup", -1, -1, [item_name(global.item[global.item_last], "")]);
			visible = false;
			image_alpha = 0;
			audio_play(snd_item, 0, VOLUME_SOUND);
		}
		else
			writer("itemDropped_cantpickup", -1, -1);
		con = 2;
	}
	if (con == 2 && exists(thiswriter) == false)
	{
		chara_change(-1, 1, 1, -1, 1, 1, -1);
		if (visible == false) || (image_alpha == 0)
			destroy(id);
		con = 0;
	}
}








/*

// start interact
if (myinteract == 1)
{
	if (myresult >= 0 && myresult < 1) || (myresult == 4) // writer, save point, trashguy roll
	{
		writer(myid, -1, -1);
		mydelay = 4;
		
		// save point
		if (myresult == 0.1)
			chara_hp(99);
		
		// trashguy roll
		if (myresult == 4)
		{
			sprite_index = spr_npc_trashguy;
			audio_play(snd_bump, 0, 0);
			shakeobj_small();
			global.chara_cutscene = 1;
		}
	}
	else if (myresult == 1) // bench
	{
		chara = obj_chara;
		chara_oldx = chara.x;
		chara_oldy = chara.y;
		chara_oldfacing = global.chara_facing;
		chara.x = (x + (sprite_width / 2));
		chara.y = (y + 10);
		chara.depth = -chara.bbox_bottom - 20;
		chara.myxscale = 0.9;
		chara.myyscale = 0.9;
		global.chara_cameramove = 0;
		global.chara_facing = SIT;
		
		if (global.flag[2] == 1)
		{
			side_stop(0);
			side_change(0, 0, 0, -1, -1);
			m6 = global.side[0];
			m6_oldx = m6.x;
			m6_oldy = m6.y;
			m6_oldsprite = m6.sprite_index;
			m6.x = (x + (sprite_width / 2) - 11);
			m6.y = (y + 10);
			m6.depth = -m6.bbox_bottom - 20;
			m6.sprite_index = spr_m6_d_sit;
			m6.myxscale = 0.9;
			m6.myyscale = 0.9;
			chara.x += 11;
		}
		
		var _xx = (x + (sprite_width / 2) - 160);
		var _yy = (y + (sprite_height / 2) - 120);
		_xx = clamp(_xx, 0, (room_width - 320));
		_yy = clamp(_yy, 0, (room_height - 240));
		screenpos(_xx, _yy);
		audio_play(snd_cutesit, 0, 0);
		mydelay = 30;
	}
	else if (myresult == 2) // moveable
	{
		myfacing = global.chara_facing;
		if (myfacing == LEFT)
			mytargetx = (x - mydist);	
		if (myfacing == RIGHT)
			mytargetx = (x + mydist);	
		if (myfacing == UP)
			mytargety = (y - mydist);	
		if (myfacing == DOWN)
			mytargety = (y + mydist);	
			
		i = 0;
		xx = x;
		yy = y;
		touched = 0;
		while (i < 20)
		{
			if (mytargetx != -1)
			{
				var _amt = -1;
				if (myfacing == RIGHT)
					_amt = 1;
				xx += _amt;
			}
			else
			{
				var _amt = -1;
				if (myfacing == DOWN)
					_amt = 1;
				yy += _amt;
			}
			
			if (place_meeting(xx, yy, obj_solid_block_moveable) == 1)
				touched = 1;
			
			i += 1;
		}
		
		if (canmove == 0) || (touched == 1)//(mytargetx != -1 && place_meeting(mytargetx, y, obj_solid_block_moveable) == 1) || (mytargety != -1 && place_meeting(x, mytargety, obj_solid_block_moveable) == 1)
		{
			myinteract = 0;
			mytargetx = -1;
			mytargety = -1;
			chara.move = 1;
		}
		else
			audio_play(snd_heartpulse1, 0, 0);
			
		mydelay = 0;
	}
	else if (myresult == 3) // mouse hole
	{
		if (audio_playing(snd_squeak) == 0 && global.chara_murder < 2)
			audio_play(snd_squeak, 0, 0);
		chara.move = 1;
		myinteract = 0;
	}
	else if (myresult == 5) // captcha 3 lever
	{
		var _snd = snd_heartpulse1;
		if (x == 100 && global.flag[50] == 0)
			global.flag[50] = 1;
		else if (x == 200 && global.flag[51] == 0)
			global.flag[51] = 1;
		else
			_snd = -1;
		
		if (_snd != -1)
		{
			if (global.flag[50] == 1 && global.flag[51] == 1)
				_snd = snd_bluh;
			audio_play(_snd, 0, 0);
		}
		
		chara.move = 1;
		myinteract = 0;
	}
	
	if (myinteract != 0)
		myinteract = 2;
}

// middle interact
if (myinteract = 2 && myresult >= 0 && myresult < 1 && exists(thiswriter) == 0) // writer
{
	mydelay -= 1;
	if (mydelay <= 0)
	{
		mydelay = 0;
		myinteract = 0;	
	}
}
if (myinteract == 2 && myresult == 1) // bench
{
	mydelay -= 1;
	if (mydelay <= 0 && (key("left_hold") || key("right_hold") || key("up_hold") || key("down_hold") || key("shift_press")))
	{
		chara.x = chara_oldx;
		chara.y = chara_oldy;
		chara.depth = -chara.bbox_bottom;
		chara.image_index = 0;
		chara.myxscale = 0.9;
		chara.myyscale = 0.9;
		global.chara_cameramove = 1;
		global.chara_facing = chara_oldfacing;
		chara.move = 1;
		
		if (global.flag[2] == 1)
		{
			m6.x = m6_oldx;
			m6.y = m6_oldy;
			m6.sprite_index = m6_oldsprite;
			m6.depth = -obj_sidechara.bbox_bottom;
			m6.myxscale = 0.9;
			m6.myyscale = 0.9;
			side_change(0, 1, 1, -1, -1);
		}
		
		audio_play(snd_cutegetup, 0, 0);
		myinteract = 0;
		mydelay = 0;
	}
}
if (myinteract == 2 && myresult == 2) // moveable
{
	if (mytargetx != -1)
	{
		x = lerp(x, mytargetx, myspeed);
		depth = -bbox_bottom;
	}
	else if (mytargety != -1)
	{
		y = lerp(y, mytargety, myspeed);
		depth = -bbox_bottom;
	}
	if (mytargetx != -1 && (round(x) == mytargetx || floor(x) == mytargetx)) || (mytargety != -1 && (round(y) == mytargety || floor(y) == mytargety))
	{
		if (mytargetx != -1)
			x = mytargetx;
		else if (mytargety != -1)
			y = mytargety;
		
		if (room == room_corridors_9)
		{
			global.flag[xflagid] = x;
			global.flag[yflagid] = y;
		}
		chara.move = 1;
		myfacing = -1;
		mytargetx = -1;
		mytargety = -1;
		myinteract = 0;
	}	
}
if (myinteract == 2 && myresult == 4 && exists(thiswriter) == 0) // trashguy roll
{
	middle_delay -= 1;
	
	if (middle_stage == 0)
	{
		x += 9;
		sprite_index = spr_npc_trashguy_closedfall;
		audio_play(snd_bump, 0, 0);
		shakeobj_small();
		middle_delay = 60;
		middle_stage = 1;
		angle_amt = 1;
	}
	if (middle_stage == 1 && middle_delay <= 0)
	{
		image_angle -= angle_amt;
		angle_amt += 0.1;
		if (image_angle <= -90)
		{
			image_angle = 0;
			sprite_index = spr_npc_trashguy_closedroll;
			audio_play(snd_screenshake, 0, 0);
			shakescreen(3, 3);
			middle_delay = 80;
			middle_stage = 2;
		}
	}
	if (middle_stage == 2 && middle_delay <= 0)
	{
		depth = -bbox_bottom;
		vspeed += 0.02;
		if (image_speed == 0)
			image_speed = 0.09;
		image_speed += 0.01;
		if (speed >= 3)
		{
			speed = 3;
			image_speed = 1.5;
			var _cambottomy = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]));
			if (y >= (_cambottomy + 20))
			{
				mydelay = 0;
				myinteract = 0;
				global.chara_cutscene = 0;
				global.chara_facing = DOWN;
				chara.move = 1;
			}
		}
	}
}

// specific
if (room == room_corridors_6 && x == 150 && y == 125 && global.flag[20] == 1) || (room == room_corridors_10 && x == 130 && y == 110 && global.flag[36] == 1)
	instance_destroy();



*/







