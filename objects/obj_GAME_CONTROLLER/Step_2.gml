
chara = obj_chara;
if (exists(chara) == 1)
{
	cam_charax = clamp((chara.x - 160), 0, (room_width - 320));
	cam_charay = clamp((chara.y - round(chara.sprite_height / 2) - 120), 0, (room_height - 240));
	if (global.chara_camera_move == 1)
	{
		var _cam_spd = cam_spd;
		if (global.chara_cutscene == true && global.chara_facing == SIT && is_undefined(chara.lastcol) == false && exists(chara.lastcol) == true && chara.lastcol.object_index == obj_interact_block && chara.lastcol.result == 1)
		{
			_cam_spd /= 2;
			cam_charax = clamp((chara.lastcol.x + (chara.lastcol.sprite_width / 2) - 160), 0, (room_width - 320));
			cam_charay = clamp((chara.lastcol.y + (chara.lastcol.sprite_height / 2) - 120), 0, (room_height - 240));
		}
		if (cam_spdJump == true) || (global.visualeff == false)
			_cam_spd = 1;
		cam_x = lerp(cam_x, cam_charax, _cam_spd);
		cam_y = lerp(cam_y, cam_charay, _cam_spd);
		if (exists(obj_room_transition) == false) || (exists(obj_room_transition) == true && obj_room_transition.altcon >= 2)
			cam_spdJump = false;
	
		// custom
		if (room == room_corridors_18)
			cam_y = clamp(cam_y, 60, (room_height - 240));
	}
}
var _xx = cam_x;
var _yy = cam_y;
if (cam_shake_stage == 1) || (cam_shake_stage == 2)
{
	cam_shake_xint = clamp(cam_shake_xint, 0, 6);
	cam_shake_yint = clamp(cam_shake_yint, 0, 6);
	_xx += round(cam_shake_xint * choose(1, -1));
	_yy += round(cam_shake_yint * choose(1, -1));
	
	if (cam_shake_xint > 0)
		cam_shake_xint -= 0.2;
	else
		cam_shake_xint = 0;		
	if (cam_shake_yint > 0)
		cam_shake_yint -= 0.2;
	else
		cam_shake_yint = 0;			
	cam_shake_stage = 2;
	if (cam_shake_xint == 0 && cam_shake_yint == 0)
		cam_shake_stage = 0;
}
camera_set_view_pos(view_camera[0], _xx, _yy);